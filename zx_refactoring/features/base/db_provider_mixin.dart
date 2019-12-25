import 'dart:async';
import 'package:cacart/db/base/sql_manager.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

///基类
mixin DbProviderMixin {
  bool isTableExits = false;

  createTableSqlString();

  tableName();

  Future<Database> getDataBase() async {
    return await open();
  }

  @mustCallSuper
  prepare(name, String createSql) async {
    isTableExits = await SqlManager.isTableExits(name);
    if (!isTableExits) {
      Database db = await SqlManager.getCurrentDatabase();
      return await db.execute(createSql);
    }
  }

  @mustCallSuper
  open() async {
    if (!isTableExits) {
      await prepare(tableName(), createTableSqlString());
    }
    return await SqlManager.getCurrentDatabase();
  }
}








