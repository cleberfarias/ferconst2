
import 'dart:developer';

import 'package:dio/dio.dart';
import 'dart:ffi';

import 'package:ferconst/model/data/EmployeeModel.dart';
import 'package:ferconst/model/repositories/api_repository.dart';
import 'package:ferconst/model/repositories/errors/api_exception.dart';

class DioApiRepository implements ApiRepository{

  final String erro = "Erro ao caregar o EMPLOYEE";

  final String erroGet = "Erro ao fazer o get no EMPLOYEE";

  final String erroPost = "Erro ao enviar dados";

  final Dio _dio;

  DioApiRepository({required Dio dio}) : _dio = dio;


  @override
  Future<EmployeeModel?> getEmployee(int employeeId) async {
    try{
      final url = '$API_URL/usuario/$employeeId'; //recuperando id do employee
      final response = await _dio.get(url);

      return EmployeeModel.fromMap(response.data);
    } on DioError catch(dioError){
      throw ApiException(menssagem: dioError.message ?? erro);
    }catch(error, stacktrace){
      log(erroGet, error: error, stackTrace: stacktrace);
      throw ApiException(menssagem: erro);
    }
  }

  @override
  Future<EmployeeModel?> postEmployee(String nome, String email, String senha, String setor, String cargo, DateTime inscricao) async {
    try{

      Map<String, dynamic> request ={
        'nome':nome,
        'email':email,
        'senha':senha,
        'setor':setor,
        'cargo':cargo,
        'isncricao':inscricao
      };
      final url = '$API_URL/usuario/cadastro';
      final response = await _dio.post(url,data:request);

      if(response.statusCode == 200){
        return EmployeeModel.fromJson(response.data);
      }else{
        throw ApiException(menssagem: 'Erro ao enviar dados');
      }

    }catch (error, stacktrace){
      log(erroPost, error: error, stackTrace: stacktrace);
      throw ApiException(menssagem: erro);
    }

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