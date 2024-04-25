import 'dart:ffi';

import 'package:ferconst/Model/data/EmployeeModel.dart';
import 'package:ferconst/Model/repositories/api_repository.dart';
import 'package:ferconst/Model/repositories/errors/api_exception.dart';

class PostController{

  final ApiRepository apiRepository;

  PostController(this.apiRepository);

  //mostrar erro ao usuário
  String? _errorLoadingEmployee;

  //recuperar error
  String? get getErrorLoadingEmployee => _errorLoadingEmployee;

  //progress
  bool isLoading = true;

  //Employee que vamos carregar
  EmployeeModel? _loadedEmployee;

  EmployeeModel? get getLoadedEmployee => _loadedEmployee;

  Future<void> ondLoadEmployee (int employeeId) async{
    isLoading = true;
    _errorLoadingEmployee = null;

    try {
      final post = await apiRepository.getEmployee(employeeId as Long);
      _loadedEmployee = post;
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