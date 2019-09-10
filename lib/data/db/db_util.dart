import 'package:synchronized/synchronized.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'db_scheme.dart';

export 'db_scheme.dart';

class DbUtil{
  Database _db;
  final _lock = new Lock();

  Future<List<Map<String, dynamic>>> get(String table, {List<String> columns, String orderBy}) async {
    final db = await _getDb();
    final result = await db.query(
        table,
        columns: columns,
        orderBy: orderBy
    );
    return result;
  }

  Future<void> insert(String table, Map<String, dynamic> values) async {
    final db = await _getDb();
    await db.insert(table, values);
  }

  Future<void> update(String table, Map<String, dynamic> values, {String where, List<dynamic> whereArgs}) async {
    final db = await _getDb();
    await db.update(
      table,
      values,
      where: where,
      whereArgs: whereArgs,
    );
  }

  Future<void> delete(String table, {String where, List<dynamic> whereArgs}) async {
    final db = await _getDb();
    await db.delete(
      table,
      where: where,
      whereArgs: whereArgs,
    );
  }

  Future<Database> _getDb() async {
    if (_db == null) {
      await _lock.synchronized(() async {
        if (_db == null) {
          _db = await _open();
        }
      });
    }
    return _db;
  }

  Future<Database> _open() async {
    final path = await _getPath();
    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<String> _getPath() {
    return getDatabasesPath()
        .then((value) {
      return join(value, 'demo.db');
    });
  }

  Future<void> _onCreate(Database db, int version) {
    return Future.wait([
      db.execute(CartScheme.getCreateSql()),
      db.execute(OfferScheme.getCreateSql()),
      db.execute(SellerScheme.getCreateSql()),
    ]);
  }
}