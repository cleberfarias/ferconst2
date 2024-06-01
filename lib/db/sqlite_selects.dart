import 'package:ferconst/db/sqlite/connection_sqlite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../model/data/employeeModel.dart';
import '../model/data/trainingModel.dart';

class DatabaseSelects {
  final ConnectionSqLite _connectionSqLite;

  DatabaseSelects(this._connectionSqLite);

  Future<List<EmployeeModel>?> getEmployees() async {
    Database? db = await ConnectionSqLite.get();
    List<Map<String, Object?>>? resultsEmployee = await db?.query('funcionario');
    List<EmployeeModel>? employees = resultsEmployee?.map((result) {
      return EmployeeModel.fromMap(result);
    }).toList();
    return employees;
  }

  Future<List<TrainingModel>?> getTrainings() async {
    Database? db = await ConnectionSqLite.get();
    List<Map<String, Object?>>? resultsTrainings = await db?.query('treinamento');
    List<TrainingModel>? trainings = resultsTrainings?.map((result) {
      return TrainingModel.fromMap(result);
    }).toList();
    return trainings;
  }

  Future<List<Map<String, dynamic>>?> getEmployeeTrainingData() async {
    Database? db = await ConnectionSqLite.get();
    List<Map<String, Object?>>? results = await db?.rawQuery('''
      SELECT f.id as funcionario_id, f.nome as funcionario_nome, f.cargo as funcionario_cargo, f.setor as funcionario_setor,
             t.nome as treinamento_nome, t.inicio as treinamento_inicio, t.fim as treinamento_fim
      FROM Funcionario_Treinamento ft
      INNER JOIN Funcionario f ON ft.funcionario_id = f.id
      INNER JOIN Treinamento t ON ft.treinamento_id = t.id
    ''');
    return results?.map((result) => result.cast<String, dynamic>()).toList();
  }

  Future<List<Map<String, dynamic>>?> getEmployeeTrainings(int employeeId) async {
    Database? db = await ConnectionSqLite.get();
    List<Map<String, Object?>>? results = await db?.rawQuery('''
    SELECT t.nome as treinamento_nome, t.inicio as treinamento_inicio, t.fim as treinamento_fim
    FROM Funcionario_Treinamento ft
    INNER JOIN Treinamento t ON ft.treinamento_id = t.id
    WHERE ft.funcionario_id = ?
  ''', [employeeId]);
    return results?.map((result) => result.cast<String, dynamic>()).toList();
  }
}
