// lib/utils/vincular_usuario.dart
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../data/employeeModel.dart';
import '../../data/trainingModel.dart';


Future<void> vincularUsuarioNoTreinamento({
  required BuildContext context,
  required EmployeeModel? selectedEmployee,
  required TrainingModel? selectedTraining,
}) async {
  if (selectedEmployee != null && selectedTraining != null) {
    try {
      var funcionarioTreinamentoDTO = {
        'usuarioEntity': {
          'id': selectedEmployee.id,
          'nome': selectedEmployee.nome,
          'setor': selectedEmployee.setor,
          'cargo': selectedEmployee.cargo,
        },
        'treinamentoEntity': {
          'id': selectedTraining.id,
          'nome': selectedTraining.nome,
          'descricao': selectedTraining.descricao,
          'inicio': selectedTraining.inicio,
          'fim': selectedTraining.fim,
        },
      };
      print(funcionarioTreinamentoDTO);
      Response response = await Dio().post(
        'http://localhost:8080/funcionariotreinamento/vincular',
        data: funcionarioTreinamentoDTO,
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Funcionário vinculado ao treinamento com sucesso!'),
          ),
        );
      } else {
        throw Exception('Erro ao vincular funcionário ao treinamento: ${response.data}');
      }
    } on DioError catch (dioError) {
      String errorMessage;
      if (dioError.response != null) {
        errorMessage =
        'Erro ao vincular funcionário ao treinamento: ${dioError.response!.statusCode} - ${dioError.response!.data}';
      } else {
        errorMessage = 'Erro ao vincular funcionário ao treinamento: ${dioError.message}';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao vincular funcionário ao treinamento: $error'),
        ),
      );
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Por favor, selecione um funcionário e um treinamento antes de vincular.'),
      ),
    );
  }
}
