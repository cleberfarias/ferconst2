import 'package:ferconst/db/sqlite/connection_sqlite.dart';
import 'package:ferconst/db/sqlite_update.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:sqflite/sqflite.dart';

class ApiStatusPage extends StatefulWidget {
  const ApiStatusPage({Key? key}) : super(key: key);

  @override
  State<ApiStatusPage> createState() => _ApiStatusPageState();
}

class _ApiStatusPageState extends State<ApiStatusPage> {

  Future<void> _initDb() async {
    final connectionSqLite = ConnectionSqLite();
    final db = await ConnectionSqLite.get(); // Obter o banco de dados
    if (db != null) {
      await DatabaseUpdater.syncData(db); // Atualizar o banco de dados
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Atualizar Banco de Dados"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await _initDb();
            // Feedback para o usuário
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Banco de dados atualizado com sucesso!'))
            );
          },
          child: const Text('Atualizar Banco'),
        ),
      ),
    );
  }
}
