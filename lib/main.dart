import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:ferconst/src/login/login_page.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:ferconst/db/cron/atualization_db_help.dart';

Future main() async {

// Initialize FFI para conexão do DBSQlite
  sqfliteFfiInit();


  databaseFactory = databaseFactoryFfi;

  final cron = startDatabaseInitializationCron();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desktop App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(), // Definindo a rota inicial como a página de login
    );
  }
}
