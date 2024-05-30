import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:ferconst/src/home/homePage.dart';
import 'package:ferconst/src/recuperarSenha/recuperarSenha.dart';
import 'package:ferconst/model/repositories/implementations/dio_api_repositoy_user.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  final DioApiRepositoryUser _userRepository = DioApiRepositoryUser(dio: Dio());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        toolbarHeight: 50.0,
        backgroundColor: Color(0xFF6E92B4),
      ),
      body: Container(
        color: Color(0xFF6E92B4),
        child: Stack(
          children: [
            Positioned.fill(
              child: Center(
                child: Container(
                  width: 400.0,
                  height: 400.0,
                  alignment: Alignment.center,
                  child: Card(
                    elevation: 6.0,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextField(
                            controller: usuarioController,
                            decoration: InputDecoration(
                              hintText: 'Usuário',
                              filled: true,
                              fillColor: Colors.transparent,
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Image.asset(
                                  'assets/do-utilizador.png',
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          TextField(
                            controller: senhaController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Senha',
                              filled: true,
                              fillColor: Colors.transparent,
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Image.asset(
                                  'assets/cadeado.png',
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          ElevatedButton(
                            onPressed: () async {
                              try {
                                final user = await _userRepository.postLogin(
                                  usuarioController.text,
                                  senhaController.text,
                                );
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => Homepage()),
                                );
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Erro ao fazer login: $e'),
                                  ),
                                );
                                print("Erro ao fazer login: $e");
                              }
                            },
                            child: Text('Login'),
                          ),
                          SizedBox(height: 20.0),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => RecuperarSenhaPage()),
                                );
                              },
                              child: Text(
                                'Esqueceu a senha?',
                                style: TextStyle(color: Colors.blue),
                              ),
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
      ),
    );
  }
}
