import 'package:ferconst/src/login/login_page.dart';
import 'package:ferconst/src/relatorio/relatorio.dart';
import 'package:flutter/material.dart';
import 'package:ferconst/src/home/homePage.dart';
import 'package:ferconst/src/status/status_page.dart';
import 'package:ferconst/src/cadastro/cadastro_page.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import '../../model/repositories/implementations/dio_api_repository.dart';
import '../../presentation/controllers/employee_controller.dart';

class CadastroCursoPage extends StatefulWidget {
  List<Map<String, String>> registros = [];

  @override
  _CadastroCursoPageState createState() => _CadastroCursoPageState();
}

class _CadastroCursoPageState extends State<CadastroCursoPage> {

  TextEditingController nomeController = TextEditingController();
  TextEditingController dataInicioController = TextEditingController();
  TextEditingController dataFimController = TextEditingController();
  TextEditingController classificacaoController = TextEditingController();
  TextEditingController observacaoController = TextEditingController();


  late EmployeeController _employeeController;
  @override
  void initState() {
    super.initState();
    _employeeController = EmployeeController(DioApiRepository(dio: Dio()));
  }

  void _showDatePicker() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1960),
      lastDate: DateTime(2035),
    );
    if (picked != null) {
      setState(() {
        dataInicioController.text = DateFormat('dd/MM/yyyy').format(picked);
        dataFimController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

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
                                    'Data início:',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8.0),
                                  TextFormField(
                                    readOnly: true, // Para impedir que o usuário edite diretamente
                                    controller: TextEditingController(
                                      text: dataInicioController.text,
                                      /*? DateFormat('dd/MM/yyyy').for
                                : '', // data String só para mostrar no input*/
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'Escolha uma data',
                                      labelText: 'Data início',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: _showDatePicker,
                                        icon: Icon(Icons.search), //lupa
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
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8.0),
                                  TextFormField(
                                    readOnly: true, // Para impedir que o usuário edite diretamente
                                    controller: TextEditingController(
                                      text: dataFimController.text,
                                      /*? DateFormat('dd/MM/yyyy').for
                                : '', // data String só para mostrar no input*/
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'Escolha uma data',
                                      labelText: 'Data fim curso',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: _showDatePicker,
                                        icon: Icon(Icons.search), //lupa
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nome:',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8.0),
                                  TextField(
                                    controller: nomeController,
                                    decoration: InputDecoration(
                                      hintText: 'Digite o nome',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Classificação:',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8.0),
                                  DropdownButtonFormField<String>(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    items: [
                                      DropdownMenuItem<String>(
                                        value: 'Segurança do Trabalho',
                                        child: Text('Segurança do Trabalho'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Saúde Mental',
                                        child: Text('Saúde Mental'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Gestão de Tempo e Produtividade',
                                        child: Text('Gestão de Tempo e Produtividade'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Assédio',
                                        child: Text('Assédio'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Fraude',
                                        child: Text('Fraude'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Conduta',
                                        child: Text('Fraude'),
                                      ),
                                    ],
                                    onChanged: (String? value) {
                                      // Lógica para lidar com a mudança de valor
                                      setState(() {
                                        classificacaoController.text = value ?? '';
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
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
                            controller: observacaoController,
                            maxLines: 10,
                            decoration: InputDecoration(
                              hintText: 'Descreva o que deve abordar no curso.',
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
                                  // Chame o método onPostEmployee e passe os dados do formulário
                                  /*await _employeeController.onPostEmployee(
                                    nomeController.text,
                                    dataInicioController.text,
                                    dataFimController.text,
                                    classificacaoController.text,
                                    observacaoController.text,
                                  );*/

                                  // Limpe os controladores de texto para limpar o formulário
                                  nomeController.clear();
                                  dataInicioController.clear();
                                  dataFimController.clear();
                                  classificacaoController.clear();
                                  observacaoController.clear();

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
}
