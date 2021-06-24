import 'dart:async';

import 'package:path/path.dart';
import '../Model/koleksiyonCarModel.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    var dbFolder = await getDatabasesPath();
    String path = join(dbFolder, "KoleksiyonAraba.db");
    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    return await db.execute(
        "CREATE TABLE KoleksiyonAraba(id INTEGER PRIMARY KEY, marka TEXT, firma TEXT, kimden TEXT, fiyat TEXT)"
    );
  }

  Future<List<KoleksiyonCar>> getCollecCar(String kimden) async {
    var dbClient = await db;
    var result = await dbClient.query("KoleksiyonAraba",where: "kimden=?",whereArgs: [kimden] );
    return result.map((data) => KoleksiyonCar.fromMap(data)).toList();
  }

  Future<int> insertCollecCar(KoleksiyonCar contact) async{
    var dbClient = await db;
    return await dbClient.insert("KoleksiyonAraba", contact.toMap());
  }

  Future<int> updateCollecCar(KoleksiyonCar contact) async{
    var dbClient = await db;
    return await dbClient.update("KoleksiyonAraba", contact.toMap(), where: "id=?", whereArgs: [contact.id]);
  }

  Future<void> removeCollecCar(int id) async{
    var dbClient = await db;
    return await dbClient.delete("KoleksiyonAraba", where: "id=?", whereArgs: [id]);
  }
}