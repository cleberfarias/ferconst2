import 'dart:ffi';
import 'dart:convert';

EmployeeModel employeeModelJson(String str)=>
    EmployeeModel.fromJson(json.decode(str));

String employeeModelToJson(EmployeeModel data) => json.encode(data.toJson());

//class base para converter objetos atributos para json e json para atributos - comunicação.

class EmployeeModel {
  //atributos para API
  final Long id;
  final String nome;
  final String email;
  final String senha;
  final String setor;
  final String cargo;

  EmployeeModel({
    //required obrigatório
    required this.id,
    required this.nome,
    required this.email,
    required this.senha,
    required this.setor,
    required this.cargo,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      //converte atributo para formato json
      id: json["id"],
      nome: json["nome"],
      email: json["email"],
      senha: json["senha"],
      setor: json["setor"],
      cargo: json["cargo"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      //converte de jason para atributo
      "id": id,
      "nome": nome,
      "email": email,
      "senha": senha,
      "setor": setor,
      "cargo": cargo,
    };
  }
}
