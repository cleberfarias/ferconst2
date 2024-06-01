import 'package:ferconst/db/sqlite/connection_sqlite.dart';
import 'package:ferconst/db/utils/routers.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'package:ferconst/utils/token.dart';

class DatabaseHelper {
  final ConnectionSqLite _connectionSqLite;
  final Routers _routers;

  DatabaseHelper(this._connectionSqLite, this._routers);

  Future<void> syncData() async {
    final String? token = await getToken();
    if (token == null) {
      throw Exception('Login inválido');
    }
    final headers = {
      'Authorization': 'Bearer $token',
    };

    var responseFuncionario = await http.get(Uri.parse(_routers.rotaFuncionario), headers: headers);
    var dataFuncionarios = json.decode(utf8.decode(responseFuncionario.bodyBytes));

    var responseTreinamentos = await http.get(Uri.parse(_routers.rotaTreinamento), headers: headers);
    var dataTreinamentos = json.decode(utf8.decode(responseTreinamentos.bodyBytes));

    var responseFuncionarioTreinamento = await http.get(Uri.parse(_routers.rotaFuncionarioTreinamento), headers: headers);
    var dataFuncionarioTreinamento = json.decode(utf8.decode(responseFuncionarioTreinamento.bodyBytes));

    Database? db = await ConnectionSqLite.get();
    if (db != null) {
      await db.transaction((txn) async {
        // Funcionario - recuperando json e insert no embarcado
        for (var funcionario in dataFuncionarios) {
          await txn.rawInsert(
              'INSERT INTO Funcionario(id, nome, setor, cargo, inscricao) VALUES(?, ?, ?, ?, ?)',
              [funcionario['id'], funcionario['nome'], funcionario['setor'], funcionario['cargo'], funcionario['inscricao']]
          );
        }

        for (var treinamento in dataTreinamentos) {
          await txn.rawInsert(
              'INSERT INTO Treinamento(id, nome, classificacao, inicio, fim, descricao) VALUES(?, ?, ?, ?, ?, ?)',
              [treinamento['id'], treinamento['nome'], treinamento['classificacao'], treinamento['inicio'], treinamento['fim'], treinamento['descricao']]
          );
        }

        for (var funcionarioTreinamento in dataFuncionarioTreinamento) {
          await txn.rawInsert(
              'INSERT INTO Funcionario_Treinamento(funcionario_id, treinamento_id) VALUES(?, ?)',
              [funcionarioTreinamento['funcionarioDTO']['id'], funcionarioTreinamento['treinamentoDTO']['id']]
          );
        }
      });
    }
  }
}
