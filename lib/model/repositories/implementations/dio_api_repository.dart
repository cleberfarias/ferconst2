
import 'dart:developer';

import 'package:dio/dio.dart';
import 'dart:ffi';

import 'package:ferconst/model/data/EmployeeModel.dart';
import 'package:ferconst/model/repositories/api_repository.dart';
import 'package:ferconst/model/repositories/errors/api_exception.dart';

class DioApiRepository implements ApiRepository{

  final String erro = "Erro ao caregar o EMPLOYEE";

  final String erroGet = "Erro ao fazer o get no EMPLOYEE";

  final Dio _dio;

  DioApiRepository({required Dio dio}) : _dio = dio;


  @override
  Future<EmployeeModel?> getEmployee(Long employeeId) async {
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

}