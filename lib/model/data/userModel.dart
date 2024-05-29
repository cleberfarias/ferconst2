import 'dart:convert';

class UserModel {

  final String login;
  final String senha;
  final String tipo;
  final String token;

  UserModel({

  required this.login,
  required this.senha,
  required this.tipo,
  required this.token,

  });
  factory UserModel.fromMap(Map<String,dynamic> map){
    return UserModel(
        login: map['login'],
        senha: map['senha'],
        tipo: map['tipo'],
        token: map['token']
    );

  }

  factory UserModel.fromJson(String source)=>
      UserModel.fromMap(json.decode(source));
}