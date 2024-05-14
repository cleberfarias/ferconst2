import 'package:flutter/material.dart';
import 'package:ferconst/src/home/homePage.dart';
import 'package:ferconst/src/cadastro/cadastro_page.dart';
import 'package:ferconst/src/cadastroCurso/cadastroCruso.dart';
import 'package:ferconst/src/login/login_page.dart';
import 'package:ferconst/src/relatorio/relatorio.dart';
import 'package:ferconst/src/status/status_page.dart';

class Cursoporfuncionario extends StatefulWidget {
  @override
  _CursoporfuncionarioState createState() => _CursoporfuncionarioState();
}

class _CursoporfuncionarioState extends State<Cursoporfuncionario> {
  String matricula = '';
  String nome = '';
  List<String> cursos = [];
  List<String> datasInicio = [];
  bool isMenuExpanded = false;

  void buscarFuncionario() {
    switch (matricula) {
      case '12345':
        setState(() {
          nome = 'Cleber Delgado';
          cursos = ['Fraude', 'Assédio'];
          datasInicio = ['13/05/2024', '10/05/2024'];
        });
        break;
      case '54321':
        setState(() {
          nome = 'Alexsander Prates';
          cursos = ['Discriminação'];
          datasInicio = ['13/05/2024'];
        });
        break;
      case '11111':
        setState(() {
          nome = 'Pedro Ferreira';
          cursos = ['Segurança no Trabalho', 'Conduta'];
          datasInicio = ['20/05/2024', '20/04/2024'];
        });
        break;
      default:
        setState(() {
          nome = '';
          cursos = [];
          datasInicio = [];
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Curso Por Funcionário'),
        backgroundColor: Color(0xFF6E92B4),
      ),
      body: Row(
        children: [
          MouseRegion(
            onEnter: (_) {
              setState(() {
                isMenuExpanded = true;
              });
            },
            onExit: (_) {
              setState(() {
                isMenuExpanded = false;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: isMenuExpanded ? 250 : 60,
              color: Color(0xFF6E92B4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  SizedBox(
                    width: isMenuExpanded ? 250 : 60,
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Homepage(),
                              ),
                            );
                          },
                          icon: Row(
                            children: [
                              Icon(Icons.home, size: 24),
                              if (isMenuExpanded) ...[
                                SizedBox(width: 8),
                                Text(
                                  'Home',
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CadastroPage(),
                              ),
                            );
                          },
                          icon: Row(
                            children: [
                              Icon(Icons.person_add, size: 24),
                              if (isMenuExpanded) ...[
                                SizedBox(width: 8),
                                Text(
                                  'Cadastro de Funcionários',
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CadastroCursoPage(),
                              ),
                            );
                          },
                          icon: Row(
                            children: [
                              Icon(Icons.format_list_bulleted_add, size: 24),
                              if (isMenuExpanded) ...[
                                SizedBox(width: 8),
                                Text(
                                  'Cadastro de Curso',
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StatusPage(),
                              ),
                            );
                          },
                          icon: Row(
                            children: [
                              Icon(Icons.format_shapes, size: 24),
                              if (isMenuExpanded) ...[
                                SizedBox(width: 8),
                                Text(
                                  'Status Curso',
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RelatorioPage(),
                              ),
                            );
                          },
                          icon: Row(
                            children: [
                              Icon(Icons.insert_chart, size: 24),
                              if (isMenuExpanded) ...[
                                SizedBox(width: 8),
                                Text(
                                  'Relatório',
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          icon: Row(
                            children: [
                              Icon(Icons.login, size: 24),
                              if (isMenuExpanded) ...[
                                SizedBox(width: 8),
                                Text(
                                  'Sair',
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Campo de Matrícula
                    Container(
                      width: 250,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            matricula = value;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Matrícula',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: 10), // Espaçamento vertical entre os elementos
                    // Botão de Busca
                    ElevatedButton(
                      onPressed: () {
                        buscarFuncionario();
                      },
                      child: Text('Buscar'),
                    ),
                    SizedBox(height: 20),
                    // Card flutuante com a tabela de resultados
                    if (nome.isNotEmpty)
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: DataTable(
                            columns: [
                              DataColumn(label: Text('Nome')),
                              DataColumn(label: Text('Curso')),
                              DataColumn(label: Text('Data de Início')),
                            ],
                            rows: [
                              DataRow(cells: [
                                DataCell(Text(nome)),
                                DataCell(Text(cursos[0])),
                                DataCell(Text(datasInicio[0])),
                              ]),
                              if (cursos.length > 1)
                                DataRow(cells: [
                                  DataCell(Text('')),
                                  DataCell(Text(cursos[1])),
                                  DataCell(Text(datasInicio[1])),
                                ]),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
