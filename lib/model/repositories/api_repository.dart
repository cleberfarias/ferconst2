
import 'dart:ffi';

import 'package:ferconst/model/data/trainingModel.dart';

import '../data/EmployeeModel.dart';

const String API_URL = "http://localhost:8080";

//caso um dos modelos http ou dio pare, podemos alterar com essa abstract
abstract class ApiRepository{
  Future<EmployeeModel?> getEmployee(int employeeId);
  Future<EmployeeModel?> postEmployee(String nome, String email, String senha, String  setor, String cargo, String inscricao);
  Future<EmployeeModel?> upEmployee(int employeeId);
  Future<EmployeeModel?> delEmployee(int employeeId);
}

abstract class ApiRepositoryTraining{
  Future<TrainingModel> getTraining(int training);
  Future<TrainingModel> postTraining(String nome, String descricao, String inicio, String fim, String classificacao);
  Future<TrainingModel> upTraining(int training);
  Future<TrainingModel> delTraining(int training);
}
