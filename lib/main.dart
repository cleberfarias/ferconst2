import 'package:flutter/material.dart';
import 'package:ferconst/src/login/login_page.dart';
import 'package:ferconst/utils/token.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'db/cron/atualization_db_help.dart';
import 'db/sqlite/connection_sqlite.dart';

Future<void> main() async {
  // Initialize FFI para conexão do DBSQlite
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  Database? db = await ConnectionSqLite.get();

  final cron = startDatabaseInitializationCron();

  WidgetsFlutterBinding.ensureInitialized();
  final token = await getToken();

  runApp(MyApp(token: token));

  print(token);
}

class MyApp extends StatefulWidget {
  final String? token;

  MyApp({this.token});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      clearToken();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Desktop App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
