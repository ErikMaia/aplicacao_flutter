import 'package:aula5/pages/departamento/departamento_edit.dart';
import 'package:aula5/pages/empresa/empresa_edit.dart';
import 'package:flutter/material.dart';

import '../../widgets/drawer_pages.dart';

class EmpresaList extends StatelessWidget {
  final List<Map<String, String>> _empresas = [
    {'nome': 'Nome', 'endereco': 'endereco', 'telefone': 'Telefone'},
  ];

  EmpresaList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Empresa'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _empresas.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(_empresas[index]['nome'] ?? ''),
                const SizedBox(width: 5),
                Text(_empresas[index]['endereco'] ?? ''),
                const SizedBox(width: 5),
                Text(_empresas[index]['telefone'] ?? ''),
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
            MaterialPageRoute(builder: (context) => const EmpresaEdit()),
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
