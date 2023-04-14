import 'package:aula5/pages/projeto/projeto_edit.dart';
import 'package:flutter/material.dart';

import '../../widgets/drawer_pages.dart';

class ProjetoList extends StatefulWidget {
  ProjetoList({Key? key}) : super(key: key);

  @override
  _ProjetoListState createState() => _ProjetoListState();
}

class _ProjetoListState extends State<ProjetoList> {
  final List<Map<String, String>> _projetos = [
    {
      'nome': 'Nome',
      'descricao': 'descricao',
      'dataInicio': 'dataInicio',
      'dataFim': 'dataFim'
    },
    {
      'nome': 'Nome',
      'descricao': 'descricao',
      'dataInicio': 'dataInicio',
      'dataFim': 'dataFim'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projeto'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _projetos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(_projetos[index]['nome'] ?? ''),
                const SizedBox(width: 5),
                Text(_projetos[index]['descricao'] ?? ''),
                const SizedBox(width: 5),
                Text(_projetos[index]['dataInicio'] ?? ''),
                const SizedBox(width: 5),
                Text(_projetos[index]['dataFim'] ?? ''),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProjetoEdit()),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProjetoEdit()),
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
