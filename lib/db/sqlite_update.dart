import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sqflite/sqflite.dart';

class DatabaseUpdater {
  static Future<void> syncData(Database db) async {
    //verificado id
    var lastUserId = Sqflite.firstIntValue(await db.rawQuery('SELECT MAX(id) FROM Usuario')) ?? 0;
    var lastTreinamentoId = Sqflite.firstIntValue(await db.rawQuery('SELECT MAX(id) FROM Treinamento')) ?? 0;

    var responseUsuarios = await http.get(Uri.parse("http://localhost:8080/usuario?idGreaterThan=$lastUserId"));
    var dataUsuarios = json.decode(responseUsuarios.body);

    var responseTreinamentos = await http.get(Uri.parse("http://localhost:8080/treinamento?idGreaterThan=$lastTreinamentoId"));
    var dataTreinamentos = json.decode(responseTreinamentos.body);

    var responseUsuarioTreinamento = await http.get(Uri.parse("http://localhost:8080/usuariotreinamento"));
    var dataUsuarioTreinamento = json.decode(responseUsuarioTreinamento.body);

    //sqlite conexão
    await db.transaction((txn) async {
      dataUsuarios.forEach((usuario) async {
        await txn.rawInsert(
            'INSERT INTO Usuario(id, nome, email, senha, setor, cargo, inscricao) VALUES(?, ?, ?, ?, ?, ?, ?)',
            [usuario['id'], usuario['nome'], usuario['email'], usuario['senha'], usuario['setor'], usuario['cargo'],usuario['inscricao']]);
      });

      dataTreinamentos.forEach((treinamento) async {
        await txn.rawInsert(
            'INSERT INTO Treinamento(id, nome, classificacao, inicio, fim,  descricao) VALUES(?, ?, ?, ?, ?, ?)',
            [treinamento['id'], treinamento['nome'], treinamento['descricao'], treinamento['inicio'], treinamento['fim'], treinamento['classificacao']]);
      });

      dataUsuarioTreinamento.forEach((usuarioTreinamento) async {
        await txn.rawInsert(
            'INSERT INTO usuario_treinamento(usuario_id, treinamento_id) VALUES(?, ?)',
            [usuarioTreinamento['usuarioDTO']['id'], usuarioTreinamento['treinamentoDTO']['id']]
        );
      });
    });
  }
}
