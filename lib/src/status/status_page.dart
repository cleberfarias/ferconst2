import 'package:flutter/material.dart';
import 'package:ferconst/src/home/homePage.dart';

import '../../db/sqlite/connection_sqlite.dart';
import '../../db/sqlite_selects.dart';
import '../../model/data/employeeModel.dart';


class StatusPage extends StatefulWidget {
  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  late List<DataRow> _filteredRows = []; // Lista de linhas filtradas
  late TextEditingController _searchController =
  TextEditingController(); // Controlador de pesquisa
  DatabaseSelects _dbSelects = DatabaseSelects(ConnectionSqLite());

  @override
  void initState() {
    super.initState();
    _carregarDadosTabela();
  }

  Future<void> _carregarDadosTabela() async {
    // todos usuário e treinamento
    List<Map<String, dynamic>>? userTrainingData =
    await _dbSelects.getUserTrainingData();

    if (userTrainingData != null) {
      _filteredRows.clear();
      for (var data in userTrainingData) {
        _filteredRows.add(_buildDataRow(
          data['usuario_nome'],
          data['usuario_cargo'],
          data['usuario_setor'],
          data['treinamento_nome'],
          data['treinamento_inicio'],
          data['treinamento_fim'],
        ));
      }
      setState(() {});
    }
  }

  Future<void> _pesquisarUsuarios(String query) async {
    if (query.isEmpty) {
      // carregar todos
      _carregarDadosTabela();
    } else {

      List<EmployeeModel>? usuarios = await _dbSelects.getUsers();
      if (usuarios != null) {
        // usuários consulta
        usuarios = usuarios.where((usuario) =>
            usuario.nome.toLowerCase().contains(query.toLowerCase())).toList();

        // Atualizar
        _filteredRows.clear();
        for (var usuario in usuarios) {
          // treinamentos associados
          List<Map<String, dynamic>>? trainings = await _dbSelects.getUserTrainingData();
          if (trainings != null) {
            for (var training in trainings) {
              if (training['usuario_nome'] == usuario.nome) {
                _filteredRows.add(_buildDataRow(
                  usuario.nome,
                  usuario.cargo,
                  usuario.setor,
                  training['treinamento_nome'],
                  training['treinamento_inicio'],
                  training['treinamento_fim'],
                ));
              }
            }
          }
        }
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Status do Curso'),
        toolbarHeight: 80.0,
        backgroundColor: Color(0xFF6E92B4),
      ),
      body: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.05,
            color: Color(0xFF6E92B4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Homepage()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(Icons.home, size: 24),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Card(
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildPesquisaTextField(),
                        SizedBox(height: 20.0),
                        _buildTabela(_filteredRows),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPesquisaTextField() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: TextField(
        controller: _searchController,
        onChanged: (query) {
          _pesquisarUsuarios(query);
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'Pesquisar funcionário',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  DataRow _buildDataRow(
      String nome, String cargo, String setor, String treinamento, String inicio, String fim) {
    return DataRow(cells: [
      DataCell(Text(nome)),
      DataCell(Text(cargo)),
      DataCell(Text(setor)),
      DataCell(Text(treinamento)),
      DataCell(Text(inicio)),
      DataCell(Text(fim)),
    ]);
  }

  Widget _buildTabela(List<DataRow> rows) {
    if (rows.isEmpty) {
      rows.add(_buildEmptyDataRow());
    }

    return Center(
      child: DataTable(
        columns: [
          DataColumn(label: Text('Nome')),
          DataColumn(label: Text('Cargo')),
          DataColumn(label: Text('Setor')),
          DataColumn(label: Text('Treinamento')),
          DataColumn(label: Text('Data Inicio')),
          DataColumn(label: Text('Data Fim')),
        ],
        rows: rows,
      ),
    );
  }

  DataRow _buildEmptyDataRow() {
    return DataRow(cells: [
      DataCell(Text('')),
      DataCell(Text('')),
      DataCell(Text('')),
      DataCell(Text('')),
      DataCell(Text('')),
      DataCell(Text('')),
    ]);
  }
}
