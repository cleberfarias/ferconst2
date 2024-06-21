import 'package:ferconst/db/utils/routers.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'package:ferconst/utils/token.dart';

class DatabaseUpdater {

  static Future<void> syncData(Database db) async {

    final String? token = await getToken();
    if(token == null) {
      throw Exception('Login inválido');
    }
    final headers = {
      'Authorization': 'Bearer $token',
    };

    // Verificar IDs
    var lastEmployeeId = Sqflite.firstIntValue(await db.rawQuery('SELECT MAX(id) FROM funcionario')) ?? 0;
    var lastTreinamentoId = Sqflite.firstIntValue(await db.rawQuery('SELECT MAX(id) FROM treinamento')) ?? 0;

    var responseFuncionarios = await http.get(Uri.parse("http://localhost:8080/funcionario?idGreaterThan=$lastEmployeeId"), headers: headers);
    var dataFuncionarios = json.decode(responseFuncionarios.body);

    var responseTreinamentos = await http.get(Uri.parse("http://localhost:8080/treinamento?idGreaterThan=$lastTreinamentoId"), headers: headers);
    var dataTreinamentos = json.decode(responseTreinamentos.body);

    var responseFuncionarioTreinamento = await http.get(Uri.parse("http://localhost:8080/funcionariotreinamento"), headers: headers);
    var dataFuncionarioTreinamento = json.decode(responseFuncionarioTreinamento.body);

    await db.transaction((txn) async {

      await txn.execute('DELETE FROM funcionario');
      await txn.execute('DELETE FROM treinamento');
      await txn.execute('DELETE FROM funcionario_treinamento');

      for (var funcionario in dataFuncionarios) {
        await txn.rawInsert(
            'INSERT INTO funcionario(id, nome, setor, cargo, inscricao) VALUES(?, ?, ?, ?, ?)',
            [funcionario['id'], funcionario['nome'], funcionario['setor'], funcionario['cargo'], funcionario['inscricao']]
        );
      }

      for (var treinamento in dataTreinamentos) {
        await txn.rawInsert(
            'INSERT INTO treinamento(id, nome, classificacao, inicio, fim, descricao) VALUES(?, ?, ?, ?, ?, ?)',
            [treinamento['id'], treinamento['nome'], treinamento['classificacao'], treinamento['inicio'], treinamento['fim'], treinamento['descricao']]
        );
      }

      for (var funcionarioTreinamento in dataFuncionarioTreinamento) {
        await txn.rawInsert(
            'INSERT INTO funcionario_treinamento(funcionario_id, treinamento_id) VALUES(?, ?)',
            [funcionarioTreinamento['funcionarioDTO']['id'], funcionarioTreinamento['treinamentoDTO']['id']]
        );
      }
    });
  }
}
