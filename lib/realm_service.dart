// import 'package:flutter/foundation.dart';
import 'package:project_realm/models/pegawai_service.dart';
import 'package:realm/realm.dart';

class RealmServices {
  //!fungsi untuk membuat database
  Future<Realm> openDatabase() async {
    final config = Configuration.local(
      [
        Pegawai.schema,
        CategoryUser.schema,
      ],
    );
    return Realm(config);
  }

  //!fungsi untuk mendapatkan database yang sudah dibuat
  Future<Realm> getRealm() async {
    return await openDatabase();
  }

  Future<void> closeRealm() async {
    final realm = await openDatabase();
    realm.close();
  }

  //!fungsi untuk menambahkan data users
  Future<void> addDataPegawai(Pegawai user) async {
    final realm = await openDatabase();
    realm.write(
      () {
        realm.add(Pegawai(
          user.id,
          user.name,
          user.pekerjaan,
          user.umur,
        ));
      },
    );
  }

  //!function untuk menambahkan data category
  Future<void> addDataCategory(String id, CategoryUser user) async {
    final realm = await openDatabase();
    final query = realm.all<Pegawai>();
    final data = query.firstWhere((element) => element.id == id);
    realm.write(
      () {
        List<CategoryUser> categoryUserList = [];
        categoryUserList.add(CategoryUser(
          user.id,
          user.category,
        ));
        // print(categoryUserList);
        realm.add(
          Pegawai(
            data.id,
            data.name,
            data.pekerjaan,
            data.umur,
            resumePegawai: categoryUserList,
          ),
          update: true,
        );
      },
    );
  }

  ///!digunakan untuk mendapatkan data
  Future<Pegawai> getData() async {
    final realm = await openDatabase();
    final data = realm.all<Pegawai>();
    print(data.first.resumePegawai);
    if (data.first.resumePegawai.isNotEmpty) {}
    return data.first;
  }

  //!fungsi untuk update data
  Future<void> updateData(Pegawai pegawai) async {
    final realm = await openDatabase();
    final query = realm.all<Pegawai>();
    final data = query.firstWhere((element) => element.id == pegawai.id);
    realm.write(
      () {
        realm.add(
          Pegawai(
            data.id,
            pegawai.name,
            pegawai.pekerjaan,
            pegawai.umur,
          ),
          update: true,
        );
      },
    );
  }

  //!fungsi untuk menghapus database
  Future<void> deleteUser() async {
    final realm = await openDatabase();
    final user = realm.all<Pegawai>();
    realm.write(() {
      realm.delete(user.first);
    });
  }
}
