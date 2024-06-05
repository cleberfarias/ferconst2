import 'package:flutter/material.dart';
import 'package:ferconst/src/cadastro/cadastro_page.dart';
import 'package:ferconst/src/cadastroCurso/cadastroCruso.dart';
import 'package:ferconst/src/cursoPorFuncionario/cursoPorFuncionario.dart';
import 'package:ferconst/src/home/homePage.dart';
import 'package:ferconst/src/login/login_page.dart';
import 'package:ferconst/src/relatorio/relatorio.dart';
import 'package:ferconst/src/status/status_page.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75, // Definindo uma largura máxima para o menu
      child: Card(
        color: Color(0xFF6E92B4),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Homepage(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.home, size: 24, color: Colors.white),
                      SizedBox(width: 8),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8),
              InkWell(
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
                      Icon(Icons.person_add, size: 24, color: Colors.white),
                      SizedBox(width: 8),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CadastroCursoPage(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.format_list_bulleted_add,
                          size: 24, color: Colors.white),
                      SizedBox(width: 8),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cursoporfuncionario(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.check, size: 24, color: Colors.white),
                      SizedBox(width: 8),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8),
              InkWell(
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
                      Icon(Icons.format_shapes, size: 24, color: Colors.white),
                      SizedBox(width: 8),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RelatorioPage(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.insert_chart, size: 24, color: Colors.white),
                      SizedBox(width: 8),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8),
              InkWell(
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
                      Icon(Icons.login, size: 24, color: Colors.white),
                      SizedBox(width: 8),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
