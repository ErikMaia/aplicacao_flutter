import 'package:flutter/material.dart';

import '../../widgets/drawer_pages.dart';

class EmpresaList extends StatelessWidget {
  const EmpresaList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Empresas'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [Text('Nome'), Text('Telefone'),Text('Endereço')],
              ),
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [Text('UTFPR'), Text('9999-9999'),Text('av. pan')],
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Lógica para adicionar algo aqui
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      drawer: DrawerPage.getWidget(context),
    );
  }
}
