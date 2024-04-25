
import 'dart:ffi';

import '../data/EmployeeModel.dart';

const String API_URL = "http://localhost:8080/usuario";

//caso um dos modelos http ou dio pare, podemos alterar com essa abstract
abstract class ApiRepository{
  Future<EmployeeModel?> getEmployee(Long employeeId);
}