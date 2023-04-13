import 'package:flutter/material.dart';

import '../widgets/drawer_pages.dart';

class DepartamentoPage extends StatelessWidget {
  const DepartamentoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Departamentos')),
      body: Container(),
      drawer: DrawerPage.getWidget(context),
    );
  }
}