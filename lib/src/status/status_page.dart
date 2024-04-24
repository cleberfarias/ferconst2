import 'package:flutter/material.dart';

class StatusPage extends StatefulWidget {
  final String nome;
  final String cargo;
  final String setor;
  final String treinamento;
  final String dataConclusao;
  final String observacao;

  StatusPage({
    required this.nome,
    required this.cargo,
    required this.setor,
    required this.treinamento,
    required this.dataConclusao,
    required this.observacao,
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
      _buildDataRow(widget.nome, widget.cargo, widget.setor, widget.treinamento,
          widget.dataConclusao, widget.observacao)
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
            width: MediaQuery.of(context).size.width * 0.08,
            color: Color(0xFF6E92B4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                _buildMenuItem(Icons.home, 'Home', () {
                  // Lógica para o item 1 do menu
                }),
                _buildMenuItem(Icons.access_time, 'Tempo', () {
                  // Lógica para o item 2 do menu
                }),
                _buildMenuItem(Icons.chat, 'Chat', () {
                  // Lógica para o item 3 do menu
                }),
                _buildMenuItem(Icons.settings, 'Config.', () {
                  // Lógica para o item 4 do menu
                }),
                _buildMenuItem(Icons.person, 'Perfil', () {
                  // Lógica para o item 5 do menu
                }),
                _buildMenuItem(Icons.exit_to_app, 'Sair', () {
                  // Lógica para o item 6 do menu
                }),
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
        onChanged: (query) {
          _filterRows(query);
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'Pesquisar funcionário',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  void _filterRows(String query) {
    setState(() {
      _filteredRows.clear(); // Limpa a lista de linhas filtradas

      // Adiciona as linhas correspondentes à consulta de pesquisa
      if (query.isNotEmpty) {
        _filteredRows.add(_buildDataRow(
          widget.nome,
          widget.cargo,
          widget.setor,
          widget.treinamento,
          widget.dataConclusao,
          widget.observacao,
        ));
      }
    });
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
}
