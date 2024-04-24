

import 'dart:ffi';

import 'package:ferconst/Model/data/EmployeeModel.dart';
import 'package:ferconst/Model/repositories/api_repository.dart';
import 'package:http/http.dart';

class HttpApiRepository implements ApiRepository{

  final Client _client;

  HttpApiRepository({required Client client}) : _client = client;

  @override
  Future<EmployeeModel?> getPost(Long postId) async {
    try{
      final url = '$API_URL/posts/$postId';
      final response = await _client.get(Uri.parse(url));

      if(response.statusCode ==200){
        return EmployeeModel.fromJson(response.body);
      }
    }catch(){

    }
  }

}