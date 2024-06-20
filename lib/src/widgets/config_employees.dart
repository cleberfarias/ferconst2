import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../../model/data/employeeModel.dart';
import '../../model/repositories/errors/api_exception.dart';
import '../../model/repositories/implementations/dio_api_repository.dart';
import '../../presentation/controllers/employee_controller.dart';
import '../../utils/token.dart';

class ConfigEmployees extends StatefulWidget {
  final Function(EmployeeModel?) onSelected;

  ConfigEmployees({required this.onSelected});

  @override
  _ConfigEmployeesState createState() => _ConfigEmployeesState();
}

class _ConfigEmployeesState extends State<ConfigEmployees> {
  late EmployeeController _employeeController;
  List<EmployeeModel>? _employees;
  EmployeeModel? _selectedEmployee;
  TextEditingController nomeController = TextEditingController();
  TextEditingController cargoController = TextEditingController();
  TextEditingController setorController = TextEditingController();

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
      _loadEmployees();
    });

  }

  void _loadEmployees() async {
    List<EmployeeModel>? employees = await _employeeController.onGetEmployees();
    setState(() {
      _employees = employees;
    });
  }

  void _deleteEmployee() async {
    if (_selectedEmployee != null) {
      try {
        bool success = await _employeeController.onDeleteEmployee(_selectedEmployee!.id);
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Funcionário deletado com sucesso')),
          );
          _loadEmployees();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Erro ao deletar funcionário')),
          );
        }
      } on ApiException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro interno: ${e.menssagem}'),
          ),
        );
        print("Erro ao deletar funcionário: ${e.menssagem}");
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao deletar funcionário: $e'),
          ),
        );
        print("Erro ao deletar funcionário: $e");
      }
    }
  }

  void _updateEmployee() async {
    if (_selectedEmployee != null) {
      EmployeeModel updatedEmployee = EmployeeModel(
        id: _selectedEmployee!.id,
        nome: nomeController.text,
        cargo: cargoController.text,
        setor: setorController.text, inscricao: '',
      );

      bool success = await _employeeController.onUpdateEmployee(updatedEmployee);
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Funcionário atualizado com sucesso')),
        );
        _loadEmployees();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao atualizar funcionário')),
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Configurar Funcionário'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selecionar Funcionário:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            _employees == null
                ? CircularProgressIndicator()
                : DropdownButtonFormField<EmployeeModel>(
              value: _selectedEmployee,
              onChanged: (EmployeeModel? value) {
                setState(() {
                  _selectedEmployee = value;
                  nomeController.text = value?.nome ?? '';
                  cargoController.text = value?.cargo ?? '';
                  setorController.text = value?.setor ?? '';
                  widget.onSelected(value);
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
            Text(
              'Setor:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            DropdownButtonFormField<String>(
              value: setorController.text.isEmpty ? null : setorController.text,
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
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            _updateEmployee();
            Navigator.of(context).pop();
          },
          child: Text('Alterar'),
        ),
        ElevatedButton(
          onPressed: () {
            _deleteEmployee();
            Navigator.of(context).pop();
          },
          child: Text('Deletar'),
        ),
      ],
    );
  }
}
