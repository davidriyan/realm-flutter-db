// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pegawai_service.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Pegawai extends _Pegawai with RealmEntity, RealmObjectBase, RealmObject {
  Pegawai(
    String id,
    String name,
    String pekerjaan,
    int umur, {
    Iterable<CategoryUser> resumePegawai = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'pekerjaan', pekerjaan);
    RealmObjectBase.set(this, 'umur', umur);
    RealmObjectBase.set<RealmList<CategoryUser>>(
        this, 'resumePegawai', RealmList<CategoryUser>(resumePegawai));
  }

  Pegawai._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get pekerjaan =>
      RealmObjectBase.get<String>(this, 'pekerjaan') as String;
  @override
  set pekerjaan(String value) => RealmObjectBase.set(this, 'pekerjaan', value);

  @override
  int get umur => RealmObjectBase.get<int>(this, 'umur') as int;
  @override
  set umur(int value) => RealmObjectBase.set(this, 'umur', value);

  @override
  RealmList<CategoryUser> get resumePegawai =>
      RealmObjectBase.get<CategoryUser>(this, 'resumePegawai')
          as RealmList<CategoryUser>;
  @override
  set resumePegawai(covariant RealmList<CategoryUser> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Pegawai>> get changes =>
      RealmObjectBase.getChanges<Pegawai>(this);

  @override
  Pegawai freeze() => RealmObjectBase.freezeObject<Pegawai>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Pegawai._);
    return const SchemaObject(ObjectType.realmObject, Pegawai, 'Pegawai', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('pekerjaan', RealmPropertyType.string),
      SchemaProperty('umur', RealmPropertyType.int),
      SchemaProperty('resumePegawai', RealmPropertyType.object,
          linkTarget: 'CategoryUser', collectionType: RealmCollectionType.list),
    ]);
  }
}

class CategoryUser extends _CategoryUser
    with RealmEntity, RealmObjectBase, RealmObject {
  CategoryUser(
    String id,
    String category,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'category', category);
  }

  CategoryUser._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get category =>
      RealmObjectBase.get<String>(this, 'category') as String;
  @override
  set category(String value) => RealmObjectBase.set(this, 'category', value);

  @override
  Stream<RealmObjectChanges<CategoryUser>> get changes =>
      RealmObjectBase.getChanges<CategoryUser>(this);

  @override
  CategoryUser freeze() => RealmObjectBase.freezeObject<CategoryUser>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(CategoryUser._);
    return const SchemaObject(
        ObjectType.realmObject, CategoryUser, 'CategoryUser', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('category', RealmPropertyType.string),
    ]);
  }
}
