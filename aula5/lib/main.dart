import 'package:flutter/material.dart';

import 'features/produtos/crud/crud.dart';
import 'pages/departamento_page.dart';
import 'pages/funcionarios_page.dart';

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
        '/': (context) => const DepartamentoPage(),
        '/departamento': (context) => const DepartamentoPage(),
        '/funcionario': (context) => const FuncionarioPage(),
        
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: ProdutoCRUDPage(),
    );
  }
}
