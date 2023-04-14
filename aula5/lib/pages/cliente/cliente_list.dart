import 'package:aula5/pages/cliente/cliente_edit.dart';
import 'package:aula5/pages/departamento/departamento_edit.dart';
import 'package:flutter/material.dart';

import '../../widgets/drawer_pages.dart';

class ClienteList extends StatelessWidget {
  final List<Map<String, String>> _clientes = [
    {
      'nome': 'Nome',
      'sobrenome': 'sobrenome',
      'endereco': 'endereco',
      'telefone': 'telefone'
    },
    {
      'nome': 'Nome',
      'sobrenome': 'sobrenome',
      'endereco': 'endereco',
      'telefone': 'telefone'
    },
  ];

  ClienteList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _clientes.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(_clientes[index]['nome'] ?? ''),
                const SizedBox(width: 5),
                Text(_clientes[index]['sobrenome'] ?? ''),
                const SizedBox(width: 5),
                Text(_clientes[index]['endereco'] ?? ''),
                const SizedBox(width: 5),
                Text(_clientes[index]['telefone'] ?? ''),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ClienteEdit()),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ClienteEdit()),
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
