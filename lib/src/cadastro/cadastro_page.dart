import 'package:ferconst/src/home/homePage.dart';
import 'package:flutter/material.dart';
import 'package:ferconst/src/status/status_page.dart';

import '../../model/repositories/implementations/dio_api_repository.dart';
import '../../presentation/controllers/employee_controller.dart';
import 'package:dio/dio.dart';

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
  TextEditingController dataConclusaoController = TextEditingController();
  TextEditingController observacaoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  late EmployeeController _employeeController;

  @override
  void initState() {
    super.initState();
    _employeeController = EmployeeController(DioApiRepository(dio: Dio()));
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
                          'Data:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        Container(
                          width: 120.0,
                          child: TextField(
                            controller: dataConclusaoController,
                            decoration: InputDecoration(
                              hintText: 'dd/mm/aaaa',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
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
                                    maxLines: null,
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
                                    'E-mail:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8.0),
                                  TextField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      hintText: 'Digite o e-mail',
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
                                    'Senha:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8.0),
                                  TextField(
                                    controller: senhaController,
                                    obscureText: true, // Para ocultar a senha
                                    decoration: InputDecoration(
                                      hintText: 'Digite a senha',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                    'Cargo:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8.0),
                                  TextField(
                                    controller: cargoController,
                                    decoration: InputDecoration(
                                      hintText: 'Digite o cargo',
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
                                    'Setor:',
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
                                      // Lógica para lidar com a mudança de valor
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
                        Text(
                          'Treinamentos:',
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
                              value: 'Assédio',
                              child: Text('Assédio'),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Fraude',
                              child: Text('Fraude'),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Conduta',
                              child: Text('Conduta'),
                            ),
                          ],
                          onChanged: (String? value) {
                            // Lógica para lidar com a mudança de valor
                            setState(() {
                              treinamentoController.text = value ?? '';
                            });
                          },
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
                                  // Chame o método onPostEmployee e passe os dados do formulário
                                  await _employeeController.onPostEmployee(
                                    nomeController.text,
                                    emailController.text,
                                    senhaController.text,
                                    setorController.text,
                                    cargoController.text,
                                  );

                                  // Limpe os controladores de texto para limpar o formulário
                                  nomeController.clear();
                                  emailController.clear();
                                  senhaController.clear();
                                  setorController.clear();
                                  cargoController.clear();

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
