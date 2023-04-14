import 'package:aula5/pages/funcionario/funcionario_edit.dart';
import 'package:flutter/material.dart';

import '../../widgets/drawer_pages.dart';

class FuncionarioPage extends StatefulWidget {
  @override
  _FuncionarioPageState createState() => _FuncionarioPageState();
}

class _FuncionarioPageState extends State<FuncionarioPage> {
  final List<Map<String, String>> _funci = [
    {
      'nome': 'Nome',
      'descricao': 'Descricao',
      'endereco': 'endereco',
      'telefone': 'Telefone'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Funcionarios'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _funci.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(_funci[index]['nome'] ?? ''),
                const SizedBox(width: 5),
                Text(_funci[index]['descricao'] ?? ''),
                const SizedBox(width: 5),
                Text(_funci[index]['endereco'] ?? ''),
                const SizedBox(width: 5),
                Text(_funci[index]['telefone'] ?? ''),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FuncionarioEdit()),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FuncionarioEdit()),
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      drawer: DrawerPage.getWidget(context),
    );
  }
}
