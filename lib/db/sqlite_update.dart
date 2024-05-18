import 'package:ferconst/db/utils/routers.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sqflite/sqflite.dart';

class DatabaseUpdater {

  static Future<void> syncData(Database db) async {
    //verificado id


    var lastEmployeeId = Sqflite.firstIntValue(await db.rawQuery('SELECT MAX(id) FROM Funcionario')) ?? 0;
    var lastTreinamentoId = Sqflite.firstIntValue(await db.rawQuery('SELECT MAX(id) FROM Treinamento')) ?? 0;

    var responseFuncionarios = await http.get(Uri.parse("http://localhost:8080/funcionario?idGreaterThan=$lastEmployeeId"));
    var dataFuncionarios = json.decode(responseFuncionarios.body);

    var responseTreinamentos = await http.get(Uri.parse("http://localhost:8080/treinamento?idGreaterThan=$lastTreinamentoId"));
    var dataTreinamentos = json.decode(responseTreinamentos.body);

    var responseFuncionarioTreinamento = await http.get(Uri.parse("http://localhost:8080/funcionariotreinamento"));
    var dataFuncionarioTreinamento = json.decode(responseFuncionarioTreinamento.body);

    //sqlite conexão
    await db.transaction((txn) async {
      dataFuncionarios.forEach((funcionario) async {
        await txn.rawInsert(
            'INSERT INTO Funcionario(id, nome, setor, cargo, inscricao) VALUES(?, ?, ?, ?, ?)',
            [funcionario['id'], funcionario['nome'], funcionario['setor'], funcionario['cargo'],funcionario['inscricao']]);
      });

      dataTreinamentos.forEach((treinamento) async {
        await txn.rawInsert(
            'INSERT INTO Treinamento(id, nome, classificacao, inicio, fim,  descricao) VALUES(?, ?, ?, ?, ?, ?)',
            [treinamento['id'], treinamento['nome'], treinamento['descricao'], treinamento['inicio'], treinamento['fim'], treinamento['classificacao']]);
      });

      dataFuncionarioTreinamento.forEach((funcionarioTreinamento) async {
        await txn.rawInsert(
            'INSERT INTO funcionario_treinamento(funcionario_id, treinamento_id) VALUES(?, ?)',
            [funcionarioTreinamento['funcionarioDTO']['id'], funcionarioTreinamento['treinamentoDTO']['id']]
        );
      });
    });
  }
}
