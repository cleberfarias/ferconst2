import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ferconst/model/repositories/api_repository.dart';
import 'package:ferconst/model/repositories/errors/api_exception.dart';
import '../../data/trainingModel.dart';

class DioApiRepositoryTraining implements ApiRepositoryTraining {
  final String erro = "Erro ao carregar o Training";
  final String erroGet = "Erro ao fazer o get no Training";
  final String erroPost = "Erro ao enviar dados";
  final String erroDel = "Erro ao deletar dados";
  final String erroUp = "Erro ao alterar dados";
  final Dio _dio;
  final String token;

  DioApiRepositoryTraining({required Dio dio, required this.token}) : _dio = dio;

  @override
  Future<TrainingModel> getTraining(int trainingId) async {
    try {
      final url = '$API_URL/treinamento/$trainingId'; //recuperando id do training
      final response = await _dio.get(
        url,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      return TrainingModel.fromMap(response.data);
    } on DioError catch (dioError) {
      throw ApiException(menssagem: dioError.message ?? erro);
    } catch (error, stacktrace) {
      log(erroGet, error: error, stackTrace: stacktrace);
      throw ApiException(menssagem: erro);
    }
  }

  @override
  Future<TrainingModel> postTraining(String nome, String classificacao, String inicio, String fim, String descricao) async {
    try {
      Map<String, dynamic> request = {
        'nome': nome,
        'classificacao': classificacao,
        'inicio': inicio,
        'fim': fim,
        'descricao': descricao,
      };
      final url = '$API_URL/treinamento/cadastrar';
      final response = await _dio.post(
        url,
        data: request,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        var responseData = response.data;
        var messageDaAPI = responseData['message']; //recuperar mensagem e tratar futuramente.
        return TrainingModel.fromJson(response.data);
      } else {
        throw ApiException(menssagem: 'Erro ao enviar dados');
      }
    } on DioError catch (dioError) {
      throw ApiException(menssagem: dioError.message ?? erroPost);
    } catch (error, stacktrace) {
      log(erroPost, error: error, stackTrace: stacktrace);
      throw ApiException(menssagem: erro);
    }
  }

  @override
  Future<TrainingModel> delTraining(int trainingId) async {
    try {
      final url = '$API_URL/treinamento/excluir/$trainingId';
      final response = await _dio.delete(
        url,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        return TrainingModel.fromJson(response.data);
      } else {
        throw ApiException(menssagem: 'Erro ao deletar treinamento');
      }
    } on DioError catch (dioError) {
      throw ApiException(menssagem: dioError.message ?? 'Erro ao deletar dados');
    } catch (error, stacktrace) {
      log('Erro ao deletar dados', error: error, stackTrace: stacktrace);
      throw ApiException(menssagem: 'Erro ao deletar dados');
    }
  }

  @override
  Future<TrainingModel> upTraining(TrainingModel trainingModel) async {
    try {
      final url = '$API_URL/treinamento/alterar';
      final response = await _dio.put(
        url,
        data: trainingModel.toJson(),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        return TrainingModel.fromJson(response.data);
      } else {
        throw ApiException(menssagem: 'Erro ao atualizar treinamento');
      }
    } catch (error, stacktrace) {
      log(erroPost, error: error, stackTrace: stacktrace);
      throw ApiException(menssagem: erro);
    }
  }

  @override
  Future<List<TrainingModel>> getAllTraining() async {
    try {
      final url = '$API_URL/treinamento';
      final response = await _dio.get(
        url,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        List<dynamic> trainingDataList = response.data;
        List<TrainingModel> trainings = trainingDataList.map((data) => TrainingModel.fromMap(data)).toList();
        return trainings;
      } else {
        throw ApiException(menssagem: "Falha ao buscar treinamentos");
      }
    } catch (error, stacktrace) {
      log(erroPost, error: error, stackTrace: stacktrace);
      throw ApiException(menssagem: erro);
    }
  }
}
