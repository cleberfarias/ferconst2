import 'package:ferconst/model/repositories/errors/api_exception.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../../model/data/trainingModel.dart';
import '../../model/repositories/implementations/dio_api_repository_training.dart';
import '../../presentation/controllers/training_controller.dart';
import '../../utils/token.dart';

class ConfigTrainings extends StatefulWidget {
  final Function(TrainingModel?) onSelected;

  ConfigTrainings({required this.onSelected});

  @override
  _ConfigTrainingsState createState() => _ConfigTrainingsState();
}

class _ConfigTrainingsState extends State<ConfigTrainings> {
  late TrainingController _trainingController;
  List<TrainingModel>? _trainings;
  TrainingModel? _selectedTraining;

  TextEditingController nomeController = TextEditingController();
  TextEditingController classificacaoController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  void _initializeController() async {
    final token = await getToken();
    setState(() {
      _trainingController = TrainingController(
        DioApiRepositoryTraining(dio: Dio(), token: token ?? ''),
      );
    });
    _loadTrainings();
  }

  void _loadTrainings() async {
    List<TrainingModel>? trainings = await _trainingController.onGetAllTraining();
    setState(() {
      _trainings = trainings;
    });
  }

  void _deleteTraining() async{
    if(_selectedTraining != null){
      try{

        bool success = await _trainingController.onDeleteTraining(_selectedTraining!.id);
        if(success){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Treinamento deletado com sucesso')),
          );
          _loadTrainings();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Erro ao deletar Treinamento')),
          );
        }

      } on ApiException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro interno: ${e.menssagem}'),
          ),
        );
        print("Erro ao deletar treinamento: ${e.menssagem}");
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao deletar treinamento: $e'),
          ),
        );
        print("Erro ao deletar treinamento: $e");
      }
    }
  }

  void _updateTraining() async {
    if (_selectedTraining != null) {
      TrainingModel updateTrainig = TrainingModel(
          id: _selectedTraining!.id,
          nome: nomeController.text,
          classificacao: classificacaoController.text,
          fim: _selectedTraining!.fim,
          inicio: _selectedTraining!.inicio,
          descricao: descricaoController.text
      );
      bool success = await _trainingController.onUpdateTraining(updateTrainig);
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Treinamento alterado com sucesso')),
        );
        _loadTrainings();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao atualizar treinamento')),
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Configurar Treinamento'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Treinamentos:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            _trainings == null
                ? CircularProgressIndicator()
                : DropdownButtonFormField<TrainingModel>(
              value: _selectedTraining,
              onChanged: (TrainingModel? value) {
                setState(() {
                  _selectedTraining = value;
                  nomeController.text = value?.nome ?? '';
                  classificacaoController.text = value?.classificacao ?? '';
                  descricaoController.text = value?.descricao ?? '';
                  widget.onSelected(value);
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
              'Classificação:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            DropdownButtonFormField<String>(
              value: classificacaoController.text.isEmpty ? null : classificacaoController.text,
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
                setState(() {
                  classificacaoController.text =
                      value ?? '';
                });
              },
            ),
            SizedBox(height: 20.0),
            Text(
              'Descrição:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Container(
              width: double.infinity,
              child: TextField(
                controller: descricaoController,
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: 'Descreva o que deve abordar no curso.',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
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
            _updateTraining();
            Navigator.of(context).pop();
          },
          child: Text('Alterar'),
        ),
        ElevatedButton(
          onPressed: () {
            _deleteTraining();
            Navigator.of(context).pop();
          },
          child: Text('Deletar'),
        ),
      ],
    );
  }
}
