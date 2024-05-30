import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ferconst/model/data/userModel.dart';
import 'package:ferconst/model/repositories/api_repository.dart';
import 'package:ferconst/model/repositories/errors/api_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioApiRepositoryUser implements ApiRepositoryUser {
  final String erro = "Erro ao carregar o Training";
  final String erroGet = "Erro ao fazer o get no Training";
  final String erroPost = "Erro ao enviar dados";

  final Dio _dio;

  DioApiRepositoryUser({required Dio dio}) : _dio = dio;

  @override
  Future<UserModel> getToke(String login, String token) {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> postLogin(String login, String senha) async {
    try {
      Map<String, dynamic> request = {
        'login': login,
        'senha': senha,
      };

      final url = '$API_URL/autenticacao/login';
      final response = await _dio.post(url, data: request);

      if (response.statusCode == 200) {
        // Supondo que a resposta é um token em texto plano
        String token = response.data;

        // Criar uma instância de UserModel com os valores recebidos
        final user = UserModel(
          login: login,
          senha: senha,
          tipo: '',
          token: token,
        );

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', user.token);

        return user;
      } else {
        throw ApiException(menssagem: 'Erro ao enviar login');
      }
    } catch (error, stacktrace) {
      log(erroPost, error: error, stackTrace: stacktrace);
      throw ApiException(menssagem: erro);
    }
  }
}
