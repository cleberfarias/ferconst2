

import 'dart:developer';
import 'dart:ffi';

import 'package:ferconst/model/data/employeeModel.dart';
import 'package:ferconst/model/repositories/api_repository.dart';
import 'package:http/http.dart';

import '../errors/api_exception.dart';

class HttpApiRepository implements ApiRepository{

  final Client _client;

  final String erro = "Erro ao caregar o EMPLOYEE";

  final String erroGet = "Erro ao fazer o get no EMPLOYEE";

  HttpApiRepository({required Client client}) : _client = client;

  @override
  Future<EmployeeModel?> getEmployee(int employeeId) async {
    try{
      final url = '$API_URL/usuario/$employeeId'; //recuperando id do employee
      final response = await _client.get(Uri.parse(url));

      if(response.statusCode ==200){
        return EmployeeModel.fromJson(response.body);
      } else {
        throw ApiException(menssagem: erro);
      }
    }catch(error, stacktrace){
      log(erroGet, error: error, stackTrace: stacktrace);
      throw ApiException(menssagem: erro);
    }
  }

  @override
  Future<EmployeeModel?> postEmployee(String nome, String email, String senha, String setor, String cargo, String inscricao) {
    // TODO: implement postEmployee
    throw UnimplementedError();
  }

  @override
  Future<EmployeeModel?> delEmployee(int employeeId) {
    // TODO: implement delEmployee
    throw UnimplementedError();
  }


  @override
  Future<EmployeeModel?> upEmployee(int employeeId) {
    // TODO: implement upEmployee
    throw UnimplementedError();
  }

}