

import 'dart:developer';
import 'dart:ffi';

import 'package:ferconst/Model/data/EmployeeModel.dart';
import 'package:ferconst/Model/repositories/api_repository.dart';
import 'package:http/http.dart';

import '../errors/api_exception.dart';

class HttpApiRepository implements ApiRepository{

  final Client _client;

  HttpApiRepository({required Client client}) : _client = client;

  @override
  Future<EmployeeModel?> getPost(Long postId) async {
    try{
      final url = '$API_URL/posts/$postId'; //recuperando id do post
      final response = await _client.get(Uri.parse(url));

      if(response.statusCode ==200){
        return EmployeeModel.fromJson(response.body);
      } else {
        throw ApiException(menssagem: "Erro ao carregar POST");
      }
    }catch(error, stacktrace){
      log("Erro ao fazer get d post;", error: error, stackTrace: stacktrace);
      throw ApiException(menssagem: "Erro ao carregar POST");
    }
  }

}