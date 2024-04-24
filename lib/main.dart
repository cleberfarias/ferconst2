import 'package:flutter/material.dart';
import 'package:ferconst/src/cadastro/cadastro_page.dart';
import 'package:ferconst/src/login/login_page.dart';
import 'package:ferconst/src/status/status_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desktop App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CadastroPage(), // Definindo a LoginPage como a página inicial
    );
  }
}
