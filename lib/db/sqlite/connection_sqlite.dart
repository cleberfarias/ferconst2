

import 'package:ferconst/db/sqlite/scriptv1.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';



class ConnectionSqLite{

  static Database? _db = null;


  static Future <Database?> get() async {
    if(_db==null){
      var path = join(await getDatabasesPath(), "/home/alexsanderprates/bancoTeste.db"); //altere para sua home para salvar o banco embarcado

      _db = await openDatabase(
        path,
        version: 1,
        onCreate:(db,v){ //existe o banco? se nao executa isso
          db.execute(createTableFuncionario);
          db.execute(createTableTreinamento);
          db.execute(createTableFuncionarioTreinamento);
        },
        //onUpgrade: , // função anonima para alteração do script db

      );
    }
    return _db;
  }


}