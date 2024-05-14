import 'package:ferconst/db/sqlite/connection_sqlite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../model/data/employeeModel.dart';
import '../model/data/trainingModel.dart';

class DatabaseSelects {
  final ConnectionSqLite _connectionSqLite;

  DatabaseSelects(this._connectionSqLite);

  Future<List<EmployeeModel>?> getUsers() async {
    //select usuario
    Database? db = await ConnectionSqLite.get();

    List<Map<String, Object?>>? resultsUsuarios = await db?.query('usuario');

    List<EmployeeModel>? employees = resultsUsuarios?.map((result) {
      return EmployeeModel.fromMap(result);
    }).toList();

    return employees;
  }

  Future<List<TrainingModel>?> getTrainings() async {
    // Select treinamentos
    Database? db = await ConnectionSqLite.get();

    List<Map<String, Object?>>? resultsTrainings = await db?.query('treinamento');

    List<TrainingModel>? trainings = resultsTrainings?.map((result) {
      return TrainingModel.fromMap(result);
    }).toList();

    return trainings;
  }

  Future<List<Map<String, dynamic>>?> getUserTrainingData() async {
    Database? db = await ConnectionSqLite.get();

    // usuario_treinamento vinculados
    List<Map<String, Object?>>? results = await db?.rawQuery('''
      SELECT u.nome as usuario_nome, u.cargo as usuario_cargo, u.setor as usuario_setor,
             t.nome as treinamento_nome, t.inicio as treinamento_inicio, t.fim as treinamento_fim
      FROM usuario_treinamento ut
      INNER JOIN usuario u ON ut.usuario_id = u.id
      INNER JOIN treinamento t ON ut.treinamento_id = t.id
    ''');

    return results;
  }
}
