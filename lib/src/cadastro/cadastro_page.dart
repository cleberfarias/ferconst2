import 'package:ferconst/src/cursoPorFuncionario/cursoPorFuncion%C3%A1rio.dart';
import 'package:flutter/material.dart';
import 'package:ferconst/src/cadastroCurso/cadastroCruso.dart';
import 'package:ferconst/src/home/homePage.dart';
import 'package:ferconst/src/login/login_page.dart';
import 'package:ferconst/src/relatorio/relatorio.dart';
import 'package:ferconst/src/status/status_page.dart';
import '../../model/repositories/implementations/dio_api_repository.dart';
import '../../presentation/controllers/employee_controller.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class CadastroPage extends StatefulWidget {
  List<Map<String, String>> registros = [];

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController matriculaController = TextEditingController();
  TextEditingController cargoController = TextEditingController();
  TextEditingController setorController = TextEditingController();
  TextEditingController treinamentoController = TextEditingController();
  TextEditingController inscricaoController = TextEditingController();
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
        inscricaoController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
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
                        MaterialPageRoute(builder: (context) => RelatorioPage()),
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
                        Text(
                          'Data da inscrição:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        TextFormField(
                          readOnly: true,
                          controller: inscricaoController,
                          decoration: InputDecoration(
                            hintText: 'Escolha uma data',
                            labelText: 'Data da inscrição',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            suffixIcon: IconButton(
                              onPressed: _showDatePicker,
                              icon: Icon(Icons.search),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'Nome:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        TextField(
                          controller: nomeController,
                          decoration: InputDecoration(
                            hintText: 'Digite o nome',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'Cargo:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        TextField(
                          controller: cargoController,
                          decoration: InputDecoration(
                            hintText: 'Digite o cargo',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Setor:',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8.0),
                                  DropdownButtonFormField<String>(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    items: [
                                      DropdownMenuItem<String>(
                                        value: 'Tecnologia da Informação',
                                        child: Text('Tecnologia da Informação'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Administração',
                                        child: Text('Administração'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Almoxarifado',
                                        child: Text('Almoxarifado'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Recursos Humanos',
                                        child: Text('Recursos Humanos'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Fábrica',
                                        child: Text('Fábrica'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Contabilidade',
                                        child: Text('Contabilidade'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Direção',
                                        child: Text('Direção'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Jurídico',
                                        child: Text('Jurídico'),
                                      ),
                                    ],
                                    onChanged: (String? value) {
                                      setState(() {
                                        setorController.text = value ?? '';
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                try {
                                  await _employeeController.onPostEmployee(
                                    nomeController.text,
                                    setorController.text,
                                    cargoController.text,
                                    inscricaoController.text,
                                  );

                                  nomeController.clear();
                                  setorController.clear();
                                  cargoController.clear();
                                  inscricaoController.clear();

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Cadastro realizado com sucesso!'),
                                    ),
                                  );
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Erro ao enviar o cadastro: $e'),
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
