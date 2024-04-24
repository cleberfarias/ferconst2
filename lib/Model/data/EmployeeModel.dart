import 'dart:ffi';
import 'dart:convert';

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

  //DIO transforma direto de JSON para MAP entao só precisamos transformar na factory para nosso modelo
  factory EmployeeModel.fromMap(Map<String,dynamic> map){
    return EmployeeModel(
        id: map['id'],
        nome: map['nome'],
        email: map['email'],
        senha: map['senha'],
        setor: map['setor'],
        cargo: map['cargo']
    );
  }

  //HTTP necessário transformar em MAP e depois para o modelo da class
  factory EmployeeModel.fromJson(String source) =>
      EmployeeModel.fromMap(json.decode(source));
}