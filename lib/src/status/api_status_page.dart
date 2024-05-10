import 'package:ferconst/db/sqlite/connection_sqlite.dart';
import 'package:ferconst/db/sqlite_update.dart';
import 'package:ferconst/model/repositories/implementations/dio_api_repository.dart';
import 'package:ferconst/presentation/controllers/employee_controller.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:sqflite/sqflite.dart';

const int EMPLOYEE_ID_TO_LOAD = 1;

class ApiStatusPage extends StatefulWidget {
  const ApiStatusPage({Key? key}) : super(key: key);

  @override
  State<ApiStatusPage> createState() => _ApiStatusPage();
}

class _ApiStatusPage extends State<ApiStatusPage> {
  late EmployeeController _employeeController;

  @override
  void initState() {
    _initDb(); // Chame o método para inicializar o banco de dados
    _employeeController = EmployeeController(DioApiRepository(dio: Dio()));
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await _employeeController.ondLoadEmployee(EMPLOYEE_ID_TO_LOAD);
      setState(() {
        // Rebuild UI
      });
    });
    super.initState();
  }

  Future<void> _initDb() async {
    final connectionSqLite = ConnectionSqLite();
    final db = await ConnectionSqLite.get(); // Obter o banco de dados
    if (db != null) {
      final databaseUpdater = DatabaseUpdater();
      await DatabaseUpdater.syncData(db); // Atualizar o banco de dados
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Retorno API funcionários com dio"),
      ),
      body: _employeeController.isLoading ? const Center(child: CircularProgressIndicator())
          : _employeeController.getErrorLoadingEmployee == null ?
      // Sucesso no loading
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            children: [
              Text(_employeeController.getLoadedEmployee?.nome ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 12,),
              Text(_employeeController.getLoadedEmployee?.cargo ?? '',
                style: const TextStyle(fontSize: 16),
              ),
            ]
        ),
      )
          : Column(
        children: [
          Text(
            _employeeController.getErrorLoadingEmployee!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => _employeeController.ondLoadEmployee(EMPLOYEE_ID_TO_LOAD),
            child: const Text('Tente novamente'),
          )
        ],
      ),
    );
  }
}
