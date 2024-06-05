import 'package:ferconst/model/data/employeeModel.dart';
import 'package:ferconst/model/data/trainingModel.dart';
import 'package:ferconst/model/repositories/implementations/dio_api_repository.dart';
import 'package:ferconst/model/repositories/implementations/dio_api_repository_training.dart';
import 'package:ferconst/model/repositories/implementations/dio_api_repository_funcionariotreinamento.dart';
import 'package:ferconst/src/cadastro/cadastro_page.dart';
import 'package:ferconst/src/cadastroCurso/cadastroCruso.dart';
import 'package:ferconst/src/login/login_page.dart';
import 'package:ferconst/src/relatorio/relatorio.dart';
import 'package:ferconst/src/status/status_page.dart';
import 'package:ferconst/src/home/homePage.dart';
import 'package:ferconst/src/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../../utils/token.dart';

import '../../presentation/controllers/employee_controller.dart';
import '../../presentation/controllers/training_controller.dart';

class Cursoporfuncionario extends StatefulWidget {
  @override
  _CursoporfuncionarioState createState() => _CursoporfuncionarioState();
}

class _CursoporfuncionarioState extends State<Cursoporfuncionario> {
  bool isMenuExpanded = false;
  late EmployeeController _employeeController;
  late TrainingController _trainingController;
  List<EmployeeModel>? _employees;
  List<TrainingModel>? _trainings;
  EmployeeModel? _selectedEmployee;
  TrainingModel? _selectedTraining;
  final Dio _dio = Dio();

  @override
  void initState() {
    super.initState();

    _initializeControllers();
  }

  void _initializeControllers() async {
    final token = await getToken();
    _employeeController =
        EmployeeController(DioApiRepository(dio: Dio(), token: token ?? ''));
    _trainingController = TrainingController(
        DioApiRepositoryTraining(dio: Dio(), token: token ?? ''));
    _loadEmployees();
    _loadTrainings();
  }

  void _loadEmployees() async {
    List<EmployeeModel>? employees = await _employeeController.onGetEmployees();
    setState(() {
      _employees = employees;
    });
  }

  void _loadTrainings() async {
    List<TrainingModel>? trainings =
        await _trainingController.onGetAllTraining();
    setState(() {
      _trainings = trainings;
    });
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
          // Menu widget
          Menu(),
          // Rest
          Expanded(
            child: Center(
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
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Funcionários:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        DropdownButtonFormField<EmployeeModel>(
                          value: _selectedEmployee,
                          onChanged: (EmployeeModel? value) {
                            setState(() {
                              _selectedEmployee = value;
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          items: _employees?.map((employee) {
                                return DropdownMenuItem<EmployeeModel>(
                                  value: employee,
                                  child: Text(employee.nome),
                                );
                              }).toList() ??
                              [],
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'Treinamentos:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        DropdownButtonFormField<TrainingModel>(
                          value: _selectedTraining,
                          onChanged: (TrainingModel? value) {
                            setState(() {
                              _selectedTraining = value;
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          items: _trainings?.map((training) {
                                return DropdownMenuItem<TrainingModel>(
                                  value: training,
                                  child: Text(training.nome),
                                );
                              }).toList() ??
                              [],
                        ),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () {
                            vincularFuncionarioNoTreinamento(
                              context: context,
                              selectedEmployee: _selectedEmployee,
                              selectedTraining: _selectedTraining,
                            );
                          },
                          child: Text('Vincular'),
                        ),
                        SizedBox(height: 20),
                        Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text('Additional Information or Actions'),
                          ),
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
