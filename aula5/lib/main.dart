import 'package:flutter/material.dart';

import 'features/produtos/crud/crud.dart';
import 'pages/departamento/departamento_list.dart';
import 'pages/funcionario/funcionarios_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pfe',
      routes: {

        '/': (context) => const DepartamentoList(),
        '/departamento': (context) => const DepartamentoList(),
        '/funcionario': (context) => const FuncionarioPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: ProdutoCRUDPage()43222fc051d8ac7ada9a209f6dcc02a161cd9d68
    );
  }
}
