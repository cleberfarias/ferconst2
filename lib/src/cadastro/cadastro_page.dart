import 'package:flutter/material.dart';

class CadastroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        toolbarHeight: 50.0, // Definindo a altura da AppBar
        backgroundColor: Color(0xFF6E92B4), // Cor de fundo da AppBar
      ),
      body: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width *
                0.03, // Reduzindo o tamanho do menu
            color: Colors.grey[200], // Cor de fundo do menu
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Icon(Icons.account_circle,
                      size: 24), // Ícone personalizado com tamanho reduzido
                  onTap: () {
                    // Lógica para o item 1 do menu
                  },
                ),
                ListTile(
                  leading: Icon(Icons.access_time,
                      size: 24), // Ícone personalizado com tamanho reduzido
                  onTap: () {
                    // Lógica para o item 2 do menu
                  },
                ),
                ListTile(
                  leading: Icon(Icons.assignment,
                      size: 24), // Ícone personalizado com tamanho reduzido
                  onTap: () {
                    // Lógica para o item 3 do menu
                  },
                ),
                ListTile(
                  leading: Icon(Icons.dashboard,
                      size: 24), // Ícone personalizado com tamanho reduzido
                  onTap: () {
                    // Lógica para o item 4 do menu
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings,
                      size: 24), // Ícone personalizado com tamanho reduzido
                  onTap: () {
                    // Lógica para o item 5 do menu
                  },
                ),
                ListTile(
                  leading: Icon(Icons.help,
                      size: 24), // Ícone personalizado com tamanho reduzido
                  onTap: () {
                    // Lógica para o item 6 do menu
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  elevation: 10.0, // Altura da sombra do Card
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Data:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        Container(
                          width: 120.0,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'dd/mm/aaaa',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nome:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8.0),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Digite o nome',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    maxLines: null, // Permite múltiplas linhas
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Matrícula:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8.0),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Digite a matrícula',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Cargo:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8.0),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Digite o cargo',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Setor:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8.0),
                                  DropdownButtonFormField<String>(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    items: [
                                      DropdownMenuItem<String>(
                                        value: 'Administração',
                                        child: Text('Administração'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Almoxarifado',
                                        child: Text('Almoxarifado'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Recursos Humanos',
                                        child: Text('Recursos Humanos'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Fábrica',
                                        child: Text('Fábrica'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Contabilidade',
                                        child: Text('Contabilidade'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Direção',
                                        child: Text('Direção'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Jurídico',
                                        child: Text('Jurídico'),
                                      ),
                                    ],
                                    onChanged: (String? value) {
                                      // Lógica para lidar com a mudança de valor
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'Treinamentos:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          items: [
                            DropdownMenuItem<String>(
                              value: 'Assédio',
                              child: Text('Assédio'),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Fraude',
                              child: Text('Fraude'),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Conduta',
                              child: Text('Conduta'),
                            ),
                          ],
                          onChanged: (String? value) {
                            // Lógica para lidar com a mudança de valor
                          },
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'Data de Conclusão:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        Container(
                          width: 120.0,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'dd/mm/aaaa',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'Observação:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        Container(
                          width: double.infinity,
                          child: TextField(
                            maxLines: 10, // Permite múltiplas linhas
                            decoration: InputDecoration(
                              hintText:
                                  'Descreva de forma resumida sobre o curso que você fez.',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Lógica para limpar os campos
                              },
                              child: Text('Enviar'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Lógica para sair
                              },
                              child: Text('Limpar'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Lógica para enviar o formulário
                              },
                              child: Text('Sair'),
                            ),
                          ],
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
    );
  }
}
