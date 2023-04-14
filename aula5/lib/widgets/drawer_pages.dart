import 'package:flutter/material.dart';

class DrawerPage {
  static Widget getWidget(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Funcionario'),
            onTap: () {
              Navigator.of(context).pushNamed('/funcionario');
            },
          ),
          ListTile(
            title: const Text('Departamento'),
            onTap: () {
              Navigator.of(context).pushNamed('/departamento');
            },
          ),
          ListTile(
            title: const Text('Projeto'),
            onTap: () {
              Navigator.of(context).pushNamed('/projeto');
            },
          ),
          ListTile(
            title: const Text('Cliente'),
            onTap: () {
              Navigator.of(context).pushNamed('/cliente');
            },
          ),
          ListTile(
            title: const Text('Tarefa'),
            onTap: () {
              Navigator.of(context).pushNamed('/tarefa');
            },
          ),
          ListTile(
            title: const Text('Empresa'),
            onTap: () {
              Navigator.of(context).pushNamed('/empresa');
            },
          ),
        ],
      ),
    );
  }
}
