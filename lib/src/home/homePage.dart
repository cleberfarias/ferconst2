import 'package:ferconst/src/cadastro/cadastro_page.dart';
import 'package:ferconst/src/cadastroCurso/cadastroCruso.dart';
import 'package:ferconst/src/login/login_page.dart';
import 'package:ferconst/src/relatorio/relatorio.dart';
import 'package:ferconst/src/status/api_status_page.dart';
import 'package:ferconst/src/status/status_page.dart';
import 'package:flutter/material.dart';

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
                  MaterialPageRoute(builder: (context) => CadastroCursoPage()),
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
                  MaterialPageRoute(builder: (context) => ApiStatusPage()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.network_check, size: 80), // Ícone de status da API
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
                  Icon(Icons.format_shapes, size: 80), // Ícone de relatório
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
                  MaterialPageRoute(builder: (context) => RelatorioPage()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.insert_chart, size: 80), // Ícone de relatório
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
    );
  }
}
