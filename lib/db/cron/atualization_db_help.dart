import 'package:cron/cron.dart';
import 'package:sqflite/sqflite.dart';

import '../sqlite/connection_sqlite.dart';
import '../sqlite_help.dart';
import '../sqlite_update.dart';

Cron startDatabaseInitializationCron() {
  final cron = Cron();

  Future<void> _initDb() async {
    final connectionSqLite = ConnectionSqLite();
    final db = await ConnectionSqLite.get(); // Recuperar o banco de dados
    if (db != null) {
      final databaseUpdater = DatabaseUpdater();
      await DatabaseUpdater.syncData(db); // Atualização do banco de dados
    }
  }

  cron.schedule(Schedule.parse('*/10 * * * *'), () async {
    await _initDb();
    print("Tarefa do Cron: " + DateTime.now().toString());
  });

  return cron;
}
