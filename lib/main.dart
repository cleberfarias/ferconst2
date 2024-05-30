import 'package:flutter/material.dart';
import 'package:ferconst/src/login/login_page.dart';
import 'package:ferconst/src/home/homePage.dart';
import 'package:ferconst/utils/token.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'db/cron/atualization_db_help.dart';

Future<void> main() async {
  // Initialize FFI para conexão do DBSQlite
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  final cron = startDatabaseInitializationCron();


  WidgetsFlutterBinding.ensureInitialized();
  final token = await getToken();

  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  final String? token;

  MyApp({this.token});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desktop App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage()
    );
  }
}
