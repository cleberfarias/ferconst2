import 'package:ferconst/src/relatorio/relatorio.dart';
import 'package:ferconst/src/status/api_status_page.dart';
import 'package:ferconst/src/status/status_page.dart';
import 'package:flutter/material.dart';
import 'package:ferconst/src/login/login_page.dart';
import 'package:ferconst/src/cadastro/cadastro_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desktop App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6E92B4),
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/logo.png"),
            fit: BoxFit.contain,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                icon: Icon(Icons.login, size: 40), // Ícone de login
                label: Text('Acessar'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CadastroPage()),
                  );
                },
                icon: Icon(Icons.person_add, size: 40), // Ícone de cadastro
                label: Text('Cadastro de Funcionários'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ApiStatusPage()),
                  );
                },
                icon: Icon(Icons.network_check,
                    size: 40), // Ícone de status da API
                label: Text('Status da API'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RelatorioPage()),
                  );
                },
                icon: Icon(Icons.description, size: 40), // Ícone de relatório
                label: Text('Relatório'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
