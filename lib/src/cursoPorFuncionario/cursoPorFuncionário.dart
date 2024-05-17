import 'package:flutter/material.dart';
import 'package:ferconst/src/home/homePage.dart';
import '../../model/data/employeeModel.dart';
import '../../model/data/trainingModel.dart';
import '../../model/repositories/implementations/dio_api_repository_usuariotreinamento.dart';
import '../../presentation/controllers/employee_controller.dart';
import '../../presentation/controllers/training_controller.dart';
import 'package:dio/dio.dart';
import 'package:ferconst/model/repositories/implementations/dio_api_repository.dart';
import 'package:ferconst/model/repositories/implementations/dio_api_repository_training.dart';

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

  @override
  void initState() {
    super.initState();
    _employeeController = EmployeeController(DioApiRepository(dio: Dio()));
    _trainingController = TrainingController(DioApiRepositoryTraining(dio: Dio()));
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
    List<TrainingModel>? trainings = await _trainingController.onGetAllTraining();
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
                    SizedBox(
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                            }).toList() ?? [],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                            }).toList() ?? [],
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        vincularUsuarioNoTreinamento(
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
