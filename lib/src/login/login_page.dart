import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        toolbarHeight: 50.0, // Definindo a altura da AppBar
        backgroundColor: Color(0xFF6E92B4), // Cor de fundo da AppBar
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment:
                  Alignment.center, // Centraliza o conteúdo verticalmente
              color: Color(0xFF6E92B4), // Cor de fundo da página
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Container(
                    width: 600.0,
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 20,
                      right: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xFFD9D9D9),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Usuário',
                            filled: true,
                            fillColor: Colors.transparent,
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Image.asset(
                                'assets/do-utilizador.png', // Caminho da imagem do usuário
                                width: 24, // Largura da imagem
                                height: 24, // Altura da imagem
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Senha',
                            filled: true,
                            fillColor: Colors.transparent,
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Image.asset(
                                'assets/cadeado.png', // Caminho da imagem do cadeado
                                width: 24, // Largura da imagem
                                height: 24, // Altura da imagem
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () {
                            // Lógica para autenticar o usuário
                          },
                          child: Text('Login'),
                        ),
                        SizedBox(height: 20.0),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // Lógica para lidar com "Esqueceu a senha?"
                            },
                            child: Text(
                              'Esqueceu a senha?',
                              style: TextStyle(
                                  color: Colors.blue), // Cor do texto do link
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
          Container(
            color: Color(0xFF6E92B4),
            height: 50.0, // Altura do rodapé
          ),
        ],
      ),
    );
  }
}
