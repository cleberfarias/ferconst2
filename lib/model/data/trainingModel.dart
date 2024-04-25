

import 'dart:convert';

class TrainingModel{

  final int id;
  final String nome;
  final String descricao;
  final DateTime inicio;
  final DateTime fim;

  TrainingModel({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.fim,
    required this.inicio,
  });

  //DIO
  factory TrainingModel.fromMap(Map<String, dynamic>map){
    return TrainingModel(
      id:map['id'],
      nome:map['nome'],
      descricao:map['descricao'],
      fim: map['map'],
      inicio:map['inicio']
    );
  }

  //HTTP
  factory TrainingModel.fromJson(String source) =>
      TrainingModel.fromMap(json.decode(source));



}