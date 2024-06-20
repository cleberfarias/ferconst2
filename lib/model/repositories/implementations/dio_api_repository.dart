import 'dart:developer';

import 'package:dio/dio.dart';
import 'dart:ffi';
import 'package:ferconst/model/data/employeeModel.dart';
import 'package:ferconst/model/repositories/api_repository.dart';
import 'package:ferconst/model/repositories/errors/api_exception.dart';

class DioApiRepository implements ApiRepository {
  final String erro = "Erro ao carregar o EMPLOYEE";
  final String erroGet = "Erro ao fazer o get no EMPLOYEE";
  final String erroPost = "Erro ao enviar dados";
  final String erroDel = "Erro ao deletar dados";
  final String erroUp = "Erro ao alterar dados";
  final Dio _dio;
  final String token;

  DioApiRepository({required Dio dio, required this.token}) : _dio = dio;

  @override
  Future<EmployeeModel?> getEmployee(int employeeId) async {
    try {
      final url = '$API_URL/funcionario/$employeeId'; //recuperando id do employee
      final response = await _dio.get(
        url,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      return EmployeeModel.fromMap(response.data);
    } on DioError catch (dioError) {
      throw ApiException(menssagem: dioError.message ?? erro);
    } catch (error, stacktrace) {
      log(erroGet, error: error, stackTrace: stacktrace);
      throw ApiException(menssagem: erro);
    }
  }

  @override
  Future<EmployeeModel?> postEmployee(String nome, String setor, String cargo, String inscricao) async {
    try {
      Map<String, dynamic> request = {
        'nome': nome,
        'setor': setor,
        'cargo': cargo,
        'inscricao': inscricao
      };
      final url = '$API_URL/funcionario/cadastro';
      final response = await _dio.post(
        url,
        data: request,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        var responseData = response.data;
        var messageDaAPI = responseData['message']; //recuperar mensagem e tratar futuramente.
        return EmployeeModel.fromJson(response.data);
      } else {
        throw ApiException(menssagem: 'Erro ao enviar dados do funcionário');
      }
    } on DioError catch (dioError) {
      throw ApiException(menssagem: dioError.message ?? erroPost);
    } catch (error, stacktrace) {
      log(erroPost, error: error, stackTrace: stacktrace);
      throw ApiException(menssagem: erro);
    }
  }

  @override
  Future<EmployeeModel?> delEmployee(int employeeId) async {
    print(token);
    try {
      final url = '$API_URL/funcionario/excluir/$employeeId';
      final response = await _dio.delete(
        url,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        return EmployeeModel.fromJson(response.data);
      } else {
        throw ApiException(menssagem: 'Erro ao deletar funcionário');
      }
    } on DioError catch (dioError) {
      throw ApiException(menssagem: dioError.message ?? 'Erro ao deletar dados');
    } catch (error, stacktrace) {
      log('Erro ao deletar dados', error: error, stackTrace: stacktrace);
      throw ApiException(menssagem: 'Erro ao deletar dados');
    }
  }

  @override
  Future<EmployeeModel?> upEmployee(EmployeeModel employeeModel) async {

    try {
      final url = '$API_URL/funcionario/alterar';
      final response = await _dio.put(
        url,
        data: employeeModel.toJson(),
          options: Options(
              headers: {
                'Authorization': 'Bearer $token',
                'Content-Type': 'application/json',
              },
          ),
      );


      if (response.statusCode == 200) {
        return EmployeeModel.fromJson(response.data);
      } else {
        throw ApiException(menssagem: 'Erro ao atualizar funcionário');
      }
    } catch (error, stacktrace) {
      log(erroUp, error: error, stackTrace: stacktrace);
      throw ApiException(menssagem: erro);
    }
  }

  @override
  Future<List<EmployeeModel>> getAllEmployees() async {
    try {
      final url = '$API_URL/funcionario';
      final response = await _dio.get(
        url,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

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
