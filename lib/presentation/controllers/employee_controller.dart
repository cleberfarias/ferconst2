import 'dart:ffi';

import '../../model/data/employeeModel.dart';
import '../../model/repositories/api_repository.dart';
import '../../model/repositories/errors/api_exception.dart';

class EmployeeController {
  final ApiRepository apiRepository;

  EmployeeController(this.apiRepository);

  // Mostrar erro ao usuário
  String? _errorLoadingEmployee;

  // Recuperar erro
  String? get getErrorLoadingEmployee => _errorLoadingEmployee;

  // Progress
  bool isLoading = false;

  // Employee que vamos carregar
  EmployeeModel? _loadedEmployee;

  EmployeeModel? get getLoadedEmployee => _loadedEmployee;

  Future<void> ondLoadEmployee(int employeeId) async {
    isLoading = true;
    _errorLoadingEmployee = null;

    try {
      final employee = await apiRepository.getEmployee(employeeId);
      _loadedEmployee = employee;
    } on ApiException catch (apiException) {
      _errorLoadingEmployee = apiException.menssagem;
    } catch (error, stacktrace) {
      _errorLoadingEmployee = "Erro ao carregar o EMPLOYEE";
    }
    isLoading = false;
  }

  Future<void> onPostEmployee(
      String nome, String setor, String cargo, String inscricao) async {
    isLoading = true;
    _errorLoadingEmployee = null;

    try {
      final postEmployee =
          await apiRepository.postEmployee(nome, setor, cargo, inscricao);
      _loadedEmployee = postEmployee;
    } on ApiException catch (apiException) {
      _errorLoadingEmployee = apiException.menssagem;
      throw apiException;
    } catch (error, stacktrace) {
      _errorLoadingEmployee = "Erro na solicitação POST";
      throw ApiException(menssagem: "Erro na solicitação POST");
    }
    isLoading = false;
  }

  Future<List<EmployeeModel>?> onGetEmployees() async {
    isLoading = true;
    _errorLoadingEmployee = null;
    List<EmployeeModel>? getAllEmployees = null;
    try {
      getAllEmployees = await apiRepository.getAllEmployees();
      return getAllEmployees;
    } on ApiException catch (apiException) {
      _errorLoadingEmployee = apiException.menssagem;
    } catch (error, stacktrace) {
      _errorLoadingEmployee = "Erro na solicitação POST";
    }
    return getAllEmployees;
  }
}
