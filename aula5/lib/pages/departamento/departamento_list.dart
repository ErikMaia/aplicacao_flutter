import 'package:flutter/material.dart';

import '../../widgets/drawer_pages.dart';

class DepartamentoList extends StatelessWidget {
  const DepartamentoList({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Departamentos'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text('Conteúdo da tela aqui'),
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