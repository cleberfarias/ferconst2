import 'package:ferconst/src/cadastro/cadastro_page.dart';
import 'package:ferconst/src/cadastroCurso/cadastroCruso.dart';
import 'package:ferconst/src/cursoPorFuncionario/cursoPorFuncionario.dart';
import 'package:ferconst/src/login/login_page.dart';
import 'package:ferconst/src/relatorio/relatorio.dart';
import 'package:ferconst/src/widgets/menu.dart';

import 'package:flutter/material.dart';
import 'package:ferconst/src/home/homePage.dart';

import '../../db/sqlite/connection_sqlite.dart';
import '../../db/sqlite_selects.dart';
import '../../model/data/employeeModel.dart';
import '../../utils/calculoTreinamento.dart';

class StatusPage extends StatefulWidget {
  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  late List<DataRow> _filteredRows = [];
  late TextEditingController _searchController = TextEditingController();
  DatabaseSelects _dbSelects = DatabaseSelects(ConnectionSqLite());

  @override
  void initState() {
    super.initState();
    _carregarDadosTabela();
  }

  Future<void> _carregarDadosTabela() async {
    // todos
    List<Map<String, dynamic>>? userTrainingData =
        await _dbSelects.getEmployeeTrainingData();

    if (userTrainingData != null) {
      _filteredRows.clear();
      for (var data in userTrainingData) {
        int employeeId = data['funcionario_id']; //id funcionario
        List<Map<String, dynamic>>? trainings =
            await _dbSelects.getEmployeeTrainings(employeeId);

        if (trainings != null) {
          for (var training in trainings) {
            _filteredRows.add(_buildDataRow(
              data['funcionario_nome'],
              data['funcionario_cargo'],
              data['funcionario_setor'],
              training['treinamento_nome'],
              training['treinamento_inicio'],
              training['treinamento_fim'],
            ));
          }
        }
      }
      setState(() {});
    }
  }

  Future<void> _pesquisarUsuarios(String query) async {
    if (query.isEmpty) {
      _carregarDadosTabela();
    } else {
      List<EmployeeModel>? funcionarios = await _dbSelects.getEmployees();
      if (funcionarios != null) {
        _filteredRows.clear(); // Limpa

        for (var funcionario in funcionarios) {
          if (funcionario.nome.toLowerCase().contains(query.toLowerCase())) {
            List<Map<String, dynamic>>? trainings =
                await _dbSelects.getEmployeeTrainings(funcionario.id);

            if (trainings != null && trainings.isNotEmpty) {
              for (var training in trainings) {
                _filteredRows.add(_buildDataRow(
                  funcionario.nome,
                  funcionario.cargo,
                  funcionario.setor,
                  training['treinamento_nome'],
                  training['treinamento_inicio'],
                  training['treinamento_fim'],
                ));
              }
            } else {
              _filteredRows.add(_buildEmptyDataRow());
            }
          }
        }
        setState(() {}); //Atualizar
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
          // Menu widget
          Menu(),
          // Rest
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

  DataRow _buildDataRow(String nome, String cargo, String setor,
      String treinamento, String inicio, String fim) {
    String status = CalculoTreinamento.calcularStatus(fim);
    return DataRow(cells: [
      DataCell(Text(nome)),
      DataCell(Text(cargo)),
      DataCell(Text(setor)),
      DataCell(Text(treinamento)),
      DataCell(Text(inicio)),
      DataCell(Text(fim)),
      DataCell(Text(status)),
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
          DataColumn(label: Text('Status')),
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
      DataCell(Text('')),
    ]);
  }
}
