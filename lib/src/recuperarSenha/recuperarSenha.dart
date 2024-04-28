import 'package:ferconst/src/cadastro/cadastro_page.dart';
import 'package:ferconst/src/cadastroCurso/cadastroCruso.dart';
import 'package:ferconst/src/login/login_page.dart';
import 'package:ferconst/src/relatorio/relatorio.dart';
import 'package:flutter/material.dart';
import 'package:ferconst/src/home/homePage.dart';
import 'package:ferconst/src/status/status_page.dart';

class RecuperarSenhaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recuperar Senha'),
        backgroundColor: Color(0xFF6E92B4), // Cor de fundo da AppBar
      ),
      body: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.05,
            color: Color(0xFF6E92B4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Homepage()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(Icons.home, size: 24),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 8),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CadastroPage()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(Icons.person_add, size: 24),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CadastroCursoPage()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(Icons.format_list_bulleted_add, size: 24),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StatusPage()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(Icons.format_shapes, size: 24),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 8),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RelatorioPage()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(Icons.insert_chart, size: 24),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(Icons.login, size: 24),
                        ],
                      ),
                    ),
                  ),
                ),
                // Adicione os outros ícones e suas navegações aqui
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Digite seu e-mail para recuperar a senha:',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'E-mail',
                        filled: true,
                        fillColor: Colors.transparent,
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        // Lógica para enviar e-mail de recuperação de senha
                      },
                      child: Text('Enviar E-mail'),
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
