import 'package:flutter/material.dart';
import 'pages/departamento/departamento_create.dart';
import 'pages/departamento/departamento_list.dart';
import 'pages/empresa/empresa_list.dart';
import 'pages/funcionario/funcionario_list.dart';
import 'pages/projeto/projeto_list.dart';

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

        '/': (context) => const DepartamentoCreate(),
        '/departamento': (context) => const DepartamentoList(),
        '/funcionario': (context) => const FuncionarioList(),
        '/empresa': (context) => const EmpresaList(),
        '/projeto': (context) => const ProjetoList(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: ProdutoCRUDPage()43222fc051d8ac7ada9a209f6dcc02a161cd9d68
    );
  }
}
