

import 'dart:convert';

class TrainingModel{

  final int id;
  final String nome;
  final String classificacao;
  final String inicio;
  final String fim;
  final String descricao;

  TrainingModel({
    required this.id,
    required this.nome,
    required this.classificacao,
    required this.fim,
    required this.inicio,
    required this.descricao,
  });

  //DIO
  factory TrainingModel.fromMap(Map<String, dynamic>map){
    return TrainingModel(
      id:map['id'],
      nome:map['nome'],
      classificacao:map['classificacao'],
      fim: map['fim'],
      inicio:map['inicio'],
      descricao:map['descricao']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'classificacao': classificacao,
      'fim': fim,
      'inicio': inicio,
      'descricao': descricao,
    };
  }

  //HTTP
  factory TrainingModel.fromJson(String source) =>
      TrainingModel.fromMap(json.decode(source));


}