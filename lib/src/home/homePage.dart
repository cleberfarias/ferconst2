import 'package:ferconst/src/cadastroCurso/cadastroCruso.dart';
import 'package:ferconst/src/cursoPorFuncionario/cursoPorFuncion%C3%A1rio.dart';
import 'package:flutter/material.dart';
import 'package:ferconst/src/cadastro/cadastro_page.dart';
import 'package:ferconst/src/login/login_page.dart';
import 'package:ferconst/src/relatorio/relatorio.dart';
import 'package:ferconst/src/status/status_page.dart';
import 'package:ferconst/src/status/api_status_page.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Color(0xFF6E92B4),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            // Coluna da imagem de logo
            Expanded(
              flex: 1, // Define a proporção do espaço ocupado pela coluna
              child: Image.asset('assets/logo.png'),
            ),
            SizedBox(width: 20), // Espaçamento entre as colunas
            // Coluna dos botões
            Expanded(
              flex: 2, // Define a proporção do espaço ocupado pela coluna
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CadastroPage()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person_add, size: 80), // Ícone de cadastro
                        SizedBox(
                            width:
                                20), // Espaçamento horizontal entre o ícone e o texto
                        Text('Cadastro de Funcionários'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20), // Espaçamento vertical entre os botões
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CadastroCursoPage()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.format_list_bulleted_add,
                            size: 80), // Ícone de cadastro
                        SizedBox(
                            width:
                                20), // Espaçamento horizontal entre o ícone e o texto
                        Text('Cadastro de Curso'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20), // Espaçamento vertical entre os botões
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Cursoporfuncionario()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check, size: 80), // Ícone de cadastro
                        SizedBox(
                            width:
                                20), // Espaçamento horizontal entre o ícone e o texto
                        Text('Curso por funcionário'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20), // Espaçamento vertical entre os botões
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ApiStatusPage()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.network_check,
                            size: 80), // Ícone de status da API
                        SizedBox(
                            width:
                                20), // Espaçamento horizontal entre o ícone e o texto
                        Text('Status da API'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20), // Espaçamento vertical entre os botões
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StatusPage()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.format_shapes,
                            size: 80), // Ícone de relatório
                        SizedBox(
                            width:
                                20), // Espaçamento horizontal entre o ícone e o texto
                        Text('Status Curso'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20), // Espaçamento vertical entre os botões
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RelatorioPage()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.insert_chart,
                            size: 80), // Ícone de relatório
                        SizedBox(
                            width:
                                20), // Espaçamento horizontal entre o ícone e o texto
                        Text('Relatório'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20), // Espaçamento vertical entre os botões
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.exit_to_app, size: 80), // Ícone de login
                        SizedBox(
                            width:
                                20), // Espaçamento horizontal entre o ícone e o texto
                        Text('Sair'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
