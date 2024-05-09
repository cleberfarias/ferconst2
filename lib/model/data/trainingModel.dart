

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
      classificacao: map['classificacao'],
      fim: map['map'],
      inicio:map['inicio'],
      descricao:map['descricao']
    );
  }

  //HTTP
  factory TrainingModel.fromJson(String source) =>
      TrainingModel.fromMap(json.decode(source));


}