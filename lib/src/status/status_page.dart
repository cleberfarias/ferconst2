import 'package:ferconst/src/home/homePage.dart';
import 'package:ferconst/src/login/login_page.dart';
import 'package:flutter/material.dart';

class StatusPage extends StatefulWidget {
  final String? nome; // Parâmetro opcional com valor padrão nulo
  final String? cargo; // Parâmetro opcional com valor padrão nulo
  final String? setor; // Parâmetro opcional com valor padrão nulo
  final String? treinamento; // Parâmetro opcional com valor padrão nulo
  final String? dataConclusao; // Parâmetro opcional com valor padrão nulo
  final String? observacao; // Parâmetro opcional com valor padrão nulo

  StatusPage({
    this.nome,
    this.cargo,
    this.setor,
    this.treinamento,
    this.dataConclusao,
    this.observacao,
  });

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  late List<DataRow> _filteredRows; // Lista de linhas filtradas
  late TextEditingController _searchController; // Controlador de pesquisa

  @override
  void initState() {
    super.initState();
    _filteredRows = [
      _buildDataRow(
        widget.nome ?? "", // Use o valor padrão se for nulo
        widget.cargo ?? "",
        widget.setor ?? "",
        widget.treinamento ?? "",
        widget.dataConclusao ?? "",
        widget.observacao ?? "",
      )
    ];
    _searchController = TextEditingController();
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
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StatusPage()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(Icons.tab, size: 24),
                        ],
                      ),
                    ),
                  ),
                ),
                // Adicione os outros ícones e suas navegações aqui
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

  Widget _buildMenuItem(IconData icon, String label, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 24),
              SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPesquisaTextField() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: TextField(
        controller: _searchController,
        onChanged: (query) {},
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'Pesquisar funcionário',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  DataRow _buildDataRow(String nome, String cargo, String setor,
      String treinamento, String dataConclusao, String observacao) {
    return DataRow(cells: [
      DataCell(Text(nome)),
      DataCell(Text(cargo)),
      DataCell(Text(setor)),
      DataCell(Text(treinamento)),
      DataCell(Text(dataConclusao)),
      DataCell(Text(observacao)),
    ]);
  }

  Widget _buildTabela(List<DataRow> rows) {
    if (rows.isEmpty) {
      // Se não houver linhas, adicione uma única linha com células vazias
      rows.add(_buildEmptyDataRow());
    }

    return Center(
      child: DataTable(
        columns: [
          DataColumn(label: Text('Nome')),
          DataColumn(label: Text('Cargo')),
          DataColumn(label: Text('Setor')),
          DataColumn(label: Text('Treinamento')),
          DataColumn(label: Text('Data de Conclusão')),
          DataColumn(label: Text('Observação')),
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
