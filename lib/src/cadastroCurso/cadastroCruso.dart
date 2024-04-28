import 'package:ferconst/src/login/login_page.dart';
import 'package:ferconst/src/relatorio/relatorio.dart';
import 'package:flutter/material.dart';
import 'package:ferconst/src/home/homePage.dart';
import 'package:ferconst/src/status/status_page.dart';
import 'package:ferconst/src/cadastro/cadastro_page.dart';

class CadastroCursoPage extends StatefulWidget {
  List<Map<String, String>> registros = [];

  @override
  _CadastroCursoPageState createState() => _CadastroCursoPageState();
}

class _CadastroCursoPageState extends State<CadastroCursoPage> {
  String? _selectedTraining;
  List<String> _selectedTrainings = [];

  TextEditingController _searchController = TextEditingController();

  bool _showEmployeeDetails = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Cursos'),
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
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Data Inicio:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8.0),
                                  Container(
                                    width: 120.0,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'dd/mm/aaaa',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Data Fim:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8.0),
                                  Container(
                                    width: 120.0,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'dd/mm/aaaa',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'Matricula:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextField(
                            controller: _searchController,
                            onChanged: (value) {
                              // Aqui você pode verificar se a matrícula foi encontrada
                              // e atualizar a variável _showEmployeeDetails conforme necessário
                              if (value == '12345') {
                                setState(() {
                                  _showEmployeeDetails = true;
                                });
                              } else {
                                setState(() {
                                  _showEmployeeDetails = false;
                                });
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Buscar',
                              suffixIcon: IconButton(
                                icon: Icon(Icons.search),
                                onPressed: () {
                                  // Função de busca aqui
                                  // Você pode usar _searchController.text para obter o texto digitado
                                  // e realizar a busca com base nesse texto
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        if (_showEmployeeDetails)
                          SizedBox(
                            height: 20,
                          ),
                        if (_showEmployeeDetails)
                          DataTable(
                            columns: [
                              DataColumn(label: Text('Nome')),
                              DataColumn(label: Text('Matrícula')),
                              DataColumn(label: Text('Cargo')),
                              DataColumn(label: Text('Setor')),
                            ],
                            rows: [
                              DataRow(cells: [
                                DataCell(Text('Cleber Farias')),
                                DataCell(Text('12345')),
                                DataCell(Text('Dev')),
                                DataCell(Text('TI')),
                              ]),
                            ],
                          ),
                        SizedBox(height: 20.0),
                        Text(
                          'Treinamentos:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        Wrap(
                          spacing: 20.0,
                          runSpacing: 10.0,
                          children: [
                            buildCheckbox('Segurança no Trabalho'),
                            buildCheckbox('Saúde Mental'),
                            buildCheckbox('Gestão do Tempo e Produtividade'),
                            buildCheckbox('Assédio'),
                            buildCheckbox('Fraude'),
                            buildCheckbox('Conduta'),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'Observação:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        Container(
                          width: double.infinity,
                          child: TextField(
                            maxLines: 10,
                            decoration: InputDecoration(
                              hintText:
                                  'Descreva de forma resumida sobre o curso que você fez.',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                // Chame o método onPostEmployee para enviar os dados do formulário
                                try {
                                  // Exiba uma mensagem de sucesso
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'Cadastro realizado com sucesso!'),
                                    ),
                                  );
                                } catch (e) {
                                  // Se ocorrer um erro ao enviar os dados, exiba uma mensagem de erro
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text('Erro ao enviar o cadastro: $e'),
                                    ),
                                  );
                                  print("Erro ao enviar o cadastro: $e");
                                }
                              },
                              child: Text('Enviar'),
                            ),
                          ],
                        ),
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

  Widget buildCheckbox(String title) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: _selectedTrainings.contains(title),
          onChanged: (bool? value) {
            setState(() {
              if (value!) {
                _selectedTrainings.add(title);
              } else {
                _selectedTrainings.remove(title);
              }
            });
          },
        ),
        Text(title),
      ],
    );
  }
}
