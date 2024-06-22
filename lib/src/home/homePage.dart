import 'package:flutter/material.dart';
import 'package:ferconst/src/cadastroCurso/cadastroCruso.dart';
import 'package:ferconst/src/cursoPorFuncionario/cursoPorFuncionario.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
              child: Wrap(
                spacing: 20, // Espaçamento horizontal entre os botões
                runSpacing: 20, // Espaçamento vertical entre os botões
                children: <Widget>[
                  _buildButton(context, Icons.person_add, 'Cadastro de Funcionários', CadastroPage(), Color(0xFF6E92B4)),
                  _buildButton(context, Icons.format_list_bulleted_add, 'Cadastro de Curso', CadastroCursoPage(), Color(0xFF6E92B4)),
                  _buildButton(context, Icons.check, 'Vinculações', Cursoporfuncionario(), Color(0xFF6E92B4)),
                  _buildButton(context, Icons.storage, 'Banco de Dados', ApiStatusPage(), Color(0xFF6E92B4)),
                  _buildButton(context, Icons.table_chart, 'Status Curso', StatusPage(), Color(0xFF6E92B4)),
                  _buildButton(context, Icons.insert_chart, 'Relatório', RelatorioPage(), Color(0xFF6E92B4)),
                  _buildButton(context, Icons.exit_to_app, 'Sair', LoginPage(), Color(0xFF6E92B4)),
                  _buildDisabledButton(context, Icons.settings, 'Configurações', 'Faça upgrade para ter acesso'),
                  _buildDisabledButton(context, Icons.support, 'Suporte Técnico', 'Faça upgrade para ter acesso'),
                  _buildDisabledButton(context, Icons.person_add, 'Criar Login', 'Faça upgrade para ter acesso'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, IconData icon, String label, Widget page, Color color) {
    return SizedBox(
      width: 150, // Largura do botão
      height: 150, // Altura do botão
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // Cor de fundo do botão
          elevation: 10.0, // Elevação do botão para simular o efeito de sombra do Card
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Bordas levemente arredondadas
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80, color: Colors.white), // Ícone do botão
            SizedBox(height: 10), // Espaçamento vertical entre o ícone e o texto
            Text(label, textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget _buildDisabledButton(BuildContext context, IconData icon, String label, String message) {
    return SizedBox(
      width: 150, // Largura do botão
      height: 150, // Altura do botão
      child: TextButton(
        onPressed: () {
          _showUpgradeMessage(context, message);
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.grey[300], // Cor de fundo desativada
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Bordas levemente arredondadas
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80, color: Colors.grey[600]), // Ícone do botão apagado
            SizedBox(height: 10), // Espaçamento vertical entre o ícone e o texto
            Text(label, textAlign: TextAlign.center, style: TextStyle(color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }

  void _showUpgradeMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Upgrade Necessário'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
