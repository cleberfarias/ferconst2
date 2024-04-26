import 'dart:ffi';

import 'package:ferconst/model/data/EmployeeModel.dart';
import 'package:ferconst/model/repositories/api_repository.dart';
import 'package:ferconst/model/repositories/errors/api_exception.dart';

class EmployeeController{
  // trabalhando com async devemos implementar esses 3 tipos de estados
  // loading - carregando
  // state - finalizado e atualiza a tela
  // error - após carregar não carrega os dados ou da erro

  final ApiRepository apiRepository;

  EmployeeController(this.apiRepository);

  //mostrar erro ao usuário
  String? _errorLoadingEmployee;

  //recuperar error
  String? get getErrorLoadingEmployee => _errorLoadingEmployee;

  //progress
  bool isLoading = false;

  //Employee que vamos carregar
  EmployeeModel? _loadedEmployee;

  EmployeeModel? get getLoadedEmployee => _loadedEmployee;

  Future<void> ondLoadEmployee (int employeeId) async{
    isLoading = true;
    _errorLoadingEmployee = null;

    try {
      final employee = await apiRepository.getEmployee(employeeId);
      _loadedEmployee = employee;
    } on ApiException catch(apiExecption){
      _errorLoadingEmployee = apiExecption.menssagem;
    } catch(error, stacktracer){

      //ja temos o log dentro do apiRepository.
      _errorLoadingEmployee = "Erro ao carregar o EMPLOYEE";
    }
    //terminou de carregar
    isLoading = false;

  }


}