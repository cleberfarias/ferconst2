import 'package:ferconst/src/cadastro/cadastro_page.dart';
import 'package:ferconst/src/cadastroCurso/cadastroCruso.dart';
import 'package:ferconst/src/cursoPorFuncionario/cursoPorFuncion%C3%A1rio.dart';
import 'package:ferconst/src/home/homePage.dart';
import 'package:ferconst/src/login/login_page.dart';
import 'package:ferconst/src/status/status_page.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RelatorioPage extends StatefulWidget {
  RelatorioPage({Key? key}) : super(key: key);

  @override
  _RelatorioPageState createState() => _RelatorioPageState();
}

class _RelatorioPageState extends State {
  int index = 0;
  int totalCursoConcluido = 50;
  int totalCursoNaoConcluido = 10;
  int totalCursoEmAndamento = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6E92B4),
        title: Text('Relatório'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Row(
        children: [
          // Menu bar
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
                SizedBox(height: 8),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CadastroPage()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(Icons.person_add, size: 24),
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
                        MaterialPageRoute(
                            builder: (context) => CadastroCursoPage()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(Icons.format_list_bulleted_add, size: 24),
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
                        MaterialPageRoute(
                            builder: (context) => Cursoporfuncionario()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(Icons.check, size: 24),
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
                          Icon(Icons.format_shapes, size: 24),
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
                        MaterialPageRoute(
                            builder: (context) => RelatorioPage()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(Icons.insert_chart, size: 24),
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
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(Icons.login, size: 24),
                        ],
                      ),
                    ),
                  ),
                ),
                // Adicione os outros ícones e suas navegações aqui
              ],
            ),
          ), // ... other menu items ...

          // Rest of the page content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildContador('Total de Cursos Concluídos',
                              totalCursoConcluido),
                          _buildContador('Total de Cursos em Andamento',
                              totalCursoEmAndamento),
                          _buildContador('Total de Cursos Não Concluídos',
                              totalCursoNaoConcluido),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  Text(
                    'Gráfico:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  _buildGrafico(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContador(String label, int valor) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 8),
        Text(
          valor.toString(),
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildGrafico() {
    return Column(
      children: [
        AspectRatio(
          aspectRatio:
              5.8, // Ajuste o aspectRatio para aumentar o tamanho do gráfico
          child: PieChart(
            PieChartData(
              sectionsSpace: 5,
              centerSpaceRadius: 60,
              sections: _loadCursos(),
              pieTouchData: PieTouchData(
                touchCallback:
                    (FlTouchEvent touch, PieTouchResponse? response) {
                  setState(() {
                    index = response?.touchedSection?.touchedSectionIndex ?? 0;
                  });
                },
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
        _buildLegenda(),
      ],
    );
  }

  Widget _buildLegenda() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Legenda:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          itemCount: 3, // Número de seções do gráfico
          itemBuilder: (context, index) {
            return Row(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  color: _getCor(index),
                ),
                SizedBox(width: 8),
                Text(
                  _getTitulo(index),
                  style: TextStyle(fontSize: 14),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Color _getCor(int index) {
    switch (index) {
      case 0:
        return Colors.green;
      case 1:
        return Colors.red;
      case 2:
        return Colors.blue;
      default:
        return Colors.transparent;
    }
  }

  String _getTitulo(int index) {
    switch (index) {
      case 0:
        return 'Concluídos';
      case 1:
        return 'Em Andamento';
      case 2:
        return 'Não Concluídos';
      default:
        return '';
    }
  }

  List<PieChartSectionData> _loadCursos() {
    double totalCursos =
        (totalCursoConcluido + totalCursoNaoConcluido + totalCursoEmAndamento)
            .toDouble();
    return [
      PieChartSectionData(
        value: totalCursoConcluido.toDouble(),
        color: Colors.green,
        title:
            '${(totalCursoConcluido / totalCursos * 100).toStringAsFixed(2)}%',
        radius: 60,
      ),
      PieChartSectionData(
        value: totalCursoNaoConcluido.toDouble(),
        color: Colors.red,
        title:
            '${(totalCursoNaoConcluido / totalCursos * 100).toStringAsFixed(2)}%',
        radius: 60,
      ),
      PieChartSectionData(
        value: totalCursoEmAndamento.toDouble(),
        color: Colors.blue,
        title:
            '${(totalCursoEmAndamento / totalCursos * 100).toStringAsFixed(2)}%',
        radius: 60,
      ),
    ];
  }
}
