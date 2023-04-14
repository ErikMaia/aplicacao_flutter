import 'package:aula5/pages/departamento/departamento_edit.dart';
import 'package:flutter/material.dart';

import '../../widgets/drawer_pages.dart';

class DepartamentoList extends StatelessWidget {
  final List<Map<String, String>> _departamentos = [
    {'nome': 'Nome', 'descricao': 'Descricao'},
    {'nome': 'Nome', 'descricao': 'Descricao'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Departamentos'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _departamentos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(_departamentos[index]['nome'] ?? ''),
                const SizedBox(width: 5),
                Text(_departamentos[index]['descricao'] ?? ''),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const departamentoEdit()),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const departamentoEdit()),
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
