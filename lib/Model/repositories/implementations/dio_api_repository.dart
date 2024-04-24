
import 'dart:developer';

import 'package:dio/dio.dart';
import 'dart:ffi';

import 'package:ferconst/Model/data/EmployeeModel.dart';
import 'package:ferconst/Model/repositories/api_repository.dart';
import 'package:ferconst/Model/repositories/errors/api_exception.dart';

class DioApiRepository implements ApiRepository{

  final Dio _dio;

  DioApiRepository({required Dio dio}) : _dio = dio;


  @override
  Future<EmployeeModel?> getPost(Long postId) async {
    try{
      final url = '$API_URL/posts/$postId'; //recuperando id do post
      final response = await _dio.get(url);

      return EmployeeModel.fromMap(response.data);
    } on DioError catch(dioError){
      throw ApiException(menssagem: dioError.message ?? "Erro ao caregar o POST");
    }catch(error, stacktrace){
      log("Erro ao fazer get d post;", error: error, stackTrace: stacktrace);
      throw ApiException(menssagem: "Erro ao carregar POST");
    }
  }

}