import 'package:ferconst/db/sqlite/scriptv1.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ConnectionSqLite {
  static Database? _db;

  static Future<Database?> get() async {
    if (_db == null) {
      var path = join(await getDatabasesPath(), 'bancoTeste.db');

      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, v) {
          db.execute(createTableFuncionario);
          db.execute(createTableTreinamento);
          db.execute(createTableFuncionarioTreinamento);
        },
      );
    }
    return _db;
  }
}
