import 'package:aula5/pages/tarefa/tarefa_edit.dart';
import 'package:flutter/material.dart';

import '../../widgets/drawer_pages.dart';

class TarefaList extends StatelessWidget {
  final List<Map<String, String>> _tarefas = [
    {
      'descricao': 'descricao',
      'dataInicio': 'dataInicio',
      'dataFim': 'dataFim',
      'status': 'status'
    },
    {
      'descricao': 'descricao',
      'dataInicio': 'dataInicio',
      'dataFim': 'dataFim',
      'status': 'status'
    },
  ];

  TarefaList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _tarefas.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(_tarefas[index]['descricao'] ?? ''),
                const SizedBox(width: 5),
                Text(_tarefas[index]['dataInicio'] ?? ''),
                const SizedBox(width: 5),
                Text(_tarefas[index]['dataFim'] ?? ''),
                const SizedBox(width: 5),
                Text(_tarefas[index]['status'] ?? ''),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TarefaEdit()),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TarefaEdit()),
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
