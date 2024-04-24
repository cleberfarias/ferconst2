
import 'dart:ffi';

import '../data/EmployeeModel.dart';

const String API_URL = "http: LOCAL API SPRING AQUI";

//caso um dos modelos http ou dio pare, podemos alterar com essa abstract
abstract class ApiRepository{
  Future<EmployeeModel?> getPost(Long postId);
}