import 'package:ferconst/src/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

import '../../model/data/employeeModel.dart';
import '../../model/repositories/errors/api_exception.dart';
import '../../model/repositories/implementations/dio_api_repository.dart';
import '../../presentation/controllers/employee_controller.dart';
import '../../utils/token.dart';
import '../widgets/config_employees.dart';

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
  EmployeeModel? _selectedEmployee;

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  void _initializeController() async {
    final token = await getToken();
    setState(() {
      _employeeController =
          EmployeeController(DioApiRepository(dio: Dio(), token: token ?? ''));
    });
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

  void _openConfigEmployeesDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ConfigEmployees(onSelected: (employee) {
          setState(() {
            _selectedEmployee = employee;
          });
        });
      },
    );
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
          // Menu widget
          Menu(),
          // Rest
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
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Data da inscrição:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8.0),
                                  TextFormField(
                                    readOnly: true,
                                    controller: inscricaoController,
                                    decoration: InputDecoration(
                                      hintText: 'Escolha uma data',
                                      labelText: 'Data da inscrição',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: _showDatePicker,
                                        icon: Icon(Icons.search),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20.0),
                            Expanded(
                              flex: 9,
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
                          ],
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
                        Row(
                          children: [
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
                        ElevatedButton(
                          onPressed: _openConfigEmployeesDialog,
                          child: Text('Config. Funcionário'),
                        ),
                        if (_selectedEmployee != null)
                          Text(
                            'Funcionário Selecionado: ${_selectedEmployee!.nome}',
                            style: TextStyle(fontWeight: FontWeight.bold),
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
                                      content: Text(
                                          'Cadastro realizado com sucesso!'),
                                    ),
                                  );
                                } on ApiException catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'Cadastro realizado - Erro interno: ${e.menssagem}'),
                                    ),
                                  );
                                  print(
                                      "Erro ao enviar o cadastro: ${e.menssagem}");
                                } catch (e) {
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
