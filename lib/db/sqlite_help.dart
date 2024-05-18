import 'package:ferconst/db/sqlite/connection_sqlite.dart';
import 'package:ferconst/db/utils/routers.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sqflite/sqflite.dart';


class DatabaseHelper {

  final ConnectionSqLite _connectionSqLite;

  final Routers _routers;

  DatabaseHelper(this._connectionSqLite, this._routers);

  Future<void> syncData(Database db) async {
    // rota do funcionario
    var responseFuncionario = await http.get(Uri.parse(_routers.rotaFuncionario));
    var dataFuncionarios = json.decode(responseFuncionario.body);

    // roda treinamento
    var responseTreinamentos = await http.get(Uri.parse(_routers.rotaTreinamento));
    var dataTreinamentos = json.decode(responseTreinamentos.body);

    // rota tabela vinculaçoes
    var responseFuncionarioTreinamento = await http.get(Uri.parse(_routers.rotaFuncionarioTreinamento));
    var dataFuncionarioTreinamento = json.decode(responseFuncionarioTreinamento.body);

    // SQLite embarcado
    await db.transaction((txn) async {
      // funcionario - recuperando json e insert no embarcado
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
