import 'package:flutter/material.dart';

import '../widgets/drawer_pages.dart';

class FuncionarioPage extends StatelessWidget {
  const FuncionarioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Departamentos')),

      body: Container(),
      drawer: DrawerPage.getWidget(context),
    );
  }
}