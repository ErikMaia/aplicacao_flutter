import 'package:flutter/material.dart';

import '../../widgets/drawer_pages.dart';

class DepartamentoList extends StatelessWidget {
  const DepartamentoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Departamentos'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: Row(
                children: const [Text('Nome'), Text('Descrição')],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
            ),
            ListTile(
              title: Row(
                children: const [Text('CC'), Text('Ciencias da computação')],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      drawer: DrawerPage.getWidget(context),
    );
  }
}
