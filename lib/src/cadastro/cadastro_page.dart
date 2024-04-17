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
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[200], // Cor de fundo do menu
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Menu'), // Adicione os itens do menu aqui
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
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
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 8.0),
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Digite o nome',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
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
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 8.0),
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Digite a matrícula',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
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
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 8.0),
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Digite o cargo',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
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
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          child: TextField(
                            maxLines: null, // Permite múltiplas linhas
                            expands: true,
                            decoration: InputDecoration(
                              hintText:
                                  'Descreva de forma resumida sobre o curso que você fez.',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
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
                            child: Text('Limpar'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Lógica para sair
                            },
                            child: Text('Sair'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Lógica para enviar o formulário
                            },
                            child: Text('Enviar'),
                          ),
                        ],
                      ),
                    ],
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
