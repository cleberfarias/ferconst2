import 'package:flutter/material.dart';
import 'package:ferconst/src/status/status_page.dart';

class CadastroPage extends StatefulWidget {
  List<Map<String, String>> registros = [];
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController matriculaController = TextEditingController();
  TextEditingController cargoController = TextEditingController();
  TextEditingController setorController = TextEditingController();
  TextEditingController treinamentoController = TextEditingController();
  TextEditingController dataConclusaoController = TextEditingController();
  TextEditingController observacaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        toolbarHeight: 80.0,
        backgroundColor: Color(0xFF6E92B4),
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
                      Navigator.pop(
                          context); // Navega de volta para a página inicial
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
                        MaterialPageRoute(builder: (context) => StatusPage()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(Icons.tab, size: 24),
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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  elevation: 10.0,
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
                            controller: dataConclusaoController,
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
                                    controller: nomeController,
                                    decoration: InputDecoration(
                                      hintText: 'Digite o nome',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    maxLines: null,
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
                                    controller: matriculaController,
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
                                    controller: cargoController,
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
                                        value: 'Tecnologia da Informação',
                                        child: Text('Tecnologia da Informação'),
                                      ),
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
                                      setState(() {
                                        setorController.text = value ?? '';
                                      });
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
                            setState(() {
                              treinamentoController.text = value ?? '';
                            });
                          },
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
                            controller: observacaoController,
                            maxLines: 10,
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
                                // Adicione os dados do formulário à lista de registros
                                widget.registros.add({
                                  'Nome': nomeController.text,
                                  'Matrícula': matriculaController.text,
                                  'Cargo': cargoController.text,
                                  'Setor': setorController.text,
                                  'Treinamento': treinamentoController.text,
                                  'Data de Conclusão':
                                      dataConclusaoController.text,
                                  'Observação': observacaoController.text,
                                });

                                // Limpe os controladores de texto para limpar o formulário
                                nomeController.clear();
                                matriculaController.clear();
                                cargoController.clear();
                                setorController.clear();
                                treinamentoController.clear();
                                dataConclusaoController.clear();
                                observacaoController.clear();
                                // Navegue para a página de status e passe os dados recém-adicionados

                                // Exiba uma mensagem de sucesso ou navegue para outra página se necessário
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text('Cadastro realizado com sucesso!'),
                                  ),
                                );
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
          ),
        ],
      ),
    );
  }
}
