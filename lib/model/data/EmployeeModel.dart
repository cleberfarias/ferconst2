import 'dart:ffi';
import 'dart:convert';

//class base para converter objetos atributos para json e json para atributos - comunicação.

class EmployeeModel {
  //atributos para API
  final int id;
  final String nome;
  final String email;
  final String senha;
  final String setor;
  final String cargo;
  final String inscricao;

  EmployeeModel({
    //required obrigatório
    required this.id,
    required this.nome,
    required this.email,
    required this.senha,
    required this.setor,
    required this.cargo,
    required this.inscricao,
  });

  //DIO transforma direto de JSON para MAP entao só precisamos transformar na factory para nosso modelo
  factory EmployeeModel.fromMap(Map<String,dynamic> map){ //dynamic pq n sabemos qual valor voltará do json
    return EmployeeModel(
      //images: List<String>.from({map['images' as Lista})
        id: map['id'],
        nome: map['nome'],
        email: map['email'],
        senha: map['senha'],
        setor: map['setor'],
        cargo: map['cargo'],
        inscricao: map['inscricao']
    );
  }

  //HTTP necessário transformar em MAP e depois para o modelo da class
  factory EmployeeModel.fromJson(String source) =>
      EmployeeModel.fromMap(json.decode(source));
}
