import 'package:flutter/material.dart';
import 'package:ferconst/src/login/login_page.dart';
import 'package:ferconst/utils/token.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'db/cron/atualization_db_help.dart';

Future<void> main() async {
  // Initialize FFI para conexão do DBSQlite
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

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
  //monitorar estados aplicação
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
      title: 'Desktop App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
