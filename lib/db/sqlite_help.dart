import 'package:ferconst/db/sqlite/connection_sqlite.dart';
import 'package:ferconst/db/sqlite/scriptv1.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sqflite/sqflite.dart';


class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database? _db;

  DatabaseHelper.internal();

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await ConnectionSqLite.get(); // obter o banco de dados
    return _db;
  }

  Future<void> initDb() async {
    Database? db = await ConnectionSqLite.get(); // obter o banco de dados
    if (db != null) {
      await _onCreate(db, 1); // versão
    }
  }

  Future<void> _onCreate(Database db, int newVersion) async {
    await db.execute(createTableUsuario);
    await db.execute(createTableTreinamento);
    await db.execute(createTableUsuarioTreinamento);

    // sincronizando os dados com o PostgreSQL
    await syncData(db);
  }

  Future<void> syncData(Database db) async {
    // rota do usuario
    var responseUsuarios = await http.get(Uri.parse("http://localhost:8080/usuario"));
    var dataUsuarios = json.decode(responseUsuarios.body);

    // roda treinamento
    var responseTreinamentos = await http.get(Uri.parse("http://localhost:8080/treinamento"));
    var dataTreinamentos = json.decode(responseTreinamentos.body);

    // rota tabela vinculaçoes
    var responseUsuarioTreinamento = await http.get(Uri.parse("http://localhost:8080/usuariotreinamento"));
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
            'INSERT INTO Treinamento(id, nome, descricao, inicio, fim, classificacao) VALUES(?, ?, ?, ?, ?, ?)',
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

  /*Future<List<Map<String, dynamic>>> getUsuarioTreinamento() async {

    Database? dbClient = await db;
    var result = await dbClient!.query("--");
    return result;
  }*/
}
