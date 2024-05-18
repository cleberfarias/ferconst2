
import 'dart:developer';

import 'package:dio/dio.dart';
import 'dart:ffi';

import 'package:ferconst/model/data/employeeModel.dart';
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
      final url = '$API_URL/funcionario/$employeeId'; //recuperando id do employee
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
  Future<EmployeeModel?> postEmployee(String nome, String setor, String cargo, String inscricao) async {
    try{

      Map<String, dynamic> request ={
        'nome':nome,
        'setor':setor,
        'cargo':cargo,
        'inscricao':inscricao
      };
      final url = '$API_URL/funcionario/cadastro';
      final response = await _dio.post(url,data:request);

      if(response.statusCode == 200){
        return EmployeeModel.fromJson(response.data);
      }else{
        throw ApiException(menssagem: 'Erro ao enviar dados do funcionário');
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

  @override
  Future<List<EmployeeModel>> getAllEmployees() async {
    try {
      final url = '$API_URL/funcionario';
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        List<dynamic> employeeDataList = response.data;
        List<EmployeeModel> employees = employeeDataList.map((data) => EmployeeModel.fromMap(data)).toList();
        return employees;
      } else {
        throw ApiException(menssagem: "Falha ao buscar funcionários");
      }
    } catch (error, stacktrace) {
      log(erroPost, error: error, stackTrace: stacktrace);
      throw ApiException(menssagem: erro);
    }
  }


}