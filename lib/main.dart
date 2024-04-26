import 'package:ferconst/src/relatorio/relatorio.dart';
import 'package:ferconst/src/status/api_status_page.dart';
import 'package:flutter/material.dart';
import 'package:ferconst/src/login/login_page.dart';
import 'package:ferconst/src/cadastro/cadastro_page.dart';
// Importe a página ApiStatusPage

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
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text('Acessar'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CadastroPage()),
                  );
                },
                child: Text('Cadastro de Funcionários'),
              ),
              ElevatedButton(
                // Adiciona um botão para acessar a ApiStatusPage
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ApiStatusPage()),
                  );
                },
                child: Text('Status da API'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RelatorioPage()),
                  );
                },
                child: Text('Relatorio'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
