import 'package:realm/realm.dart';
part 'pegawai_service.g.dart';

@RealmModel()
class _Pegawai {
  @PrimaryKey()
  late String id;
  late String name;
  late String pekerjaan;
  late int umur;
  late List<_CategoryUser> resumePegawai;
}

@RealmModel()
class _CategoryUser {
  @PrimaryKey()
  late String id;
  late String category;
}
