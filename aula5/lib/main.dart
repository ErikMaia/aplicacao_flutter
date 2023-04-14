import 'package:aula5/pages/cliente/cliente_list.dart';
import 'package:aula5/pages/configuracoes/configuracoes.dart';
import 'package:aula5/pages/empresa/empresa_list.dart';
import 'package:aula5/pages/projeto/projeto_list.dart';
import 'package:aula5/pages/tarefa/tarefa_list.dart';
import 'package:flutter/material.dart';

import 'pages/departamento/departamento_list.dart';
import 'pages/funcionario/funcionarios_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pfe',
      routes: {
        '/': (context) => FuncionarioPage(),
        '/funcionario': (context) => FuncionarioPage(),
        '/departamento': (context) => DepartamentoList(),
        '/projeto': (context) => ProjetoList(),
        '/cliente': (context) => ClienteList(),
        '/tarefa': (context) => TarefaList(),
        '/empresa': (context) => EmpresaList(),
        '/configuracao': (context) => const SettingsPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: ProdutoCRUDPage()43222fc051d8ac7ada9a209f6dcc02a161cd9d68
    );
  }
}
