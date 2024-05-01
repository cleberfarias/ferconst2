import 'package:cron/cron.dart';
import 'package:sqflite/sqflite.dart';

import '../sqlite/connection_sqlite.dart';
import '../sqlite_help.dart';
import '../sqlite_update.dart';

Cron startDatabaseInitializationCron() {
  final cron = Cron();

  Future<void> _initDb() async {
    DatabaseHelper? databaseHelper = DatabaseHelper();
    if (databaseHelper != null) {
      await databaseHelper.initDb(); // iniciar o db
    } else {
      DatabaseUpdater? databaseUpdater = DatabaseUpdater();
      Database? db = await ConnectionSqLite.get(); // recuperar o banco de dados
      if (db != null) {
        await DatabaseUpdater.syncData(db); //  atualização se o banco de dados não for nulo
      }
    }
  }


  cron.schedule(Schedule.parse('*/10 * * * *'), () async {
    await _initDb();
    print("Task of Cron: " + DateTime.now().toString());
  });

  return cron;
}
