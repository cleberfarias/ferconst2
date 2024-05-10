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
    // rota do usuario
    var responseUsuarios = await http.get(Uri.parse(_routers.rotaUsuario));
    var dataUsuarios = json.decode(responseUsuarios.body);

    // roda treinamento
    var responseTreinamentos = await http.get(Uri.parse(_routers.rotaTreinamento));
    var dataTreinamentos = json.decode(responseTreinamentos.body);

    // rota tabela vinculaçoes
    var responseUsuarioTreinamento = await http.get(Uri.parse(_routers.rotaUsuarioTreinamento));
    var dataUsuarioTreinamento = json.decode(responseUsuarioTreinamento.body);

    // SQLite embarcado
    await db.transaction((txn) async {
      // usuario - recuperando json e insert no embarcado
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
