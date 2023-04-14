import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/cliente/cliente_list.dart';
import 'pages/configuracoes/configuracoes.dart';
import 'pages/empresa/empresa_list.dart';
import 'pages/projeto/projeto_list.dart';
import 'pages/tarefa/tarefa_list.dart';
import 'pages/departamento/departamento_list.dart';
import 'pages/funcionario/funcionarios_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkModeEnabled = false;

  @override
  void initState() {
    super.initState();
    _loadDarkModeEnabled();
  }

  void _loadDarkModeEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkModeEnabled = prefs.getBool('darkModeEnabled') ?? false;
    });
  }

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
        '/configuracao': (context) => SettingsPage(load: _loadDarkModeEnabled),
      },
      theme: _isDarkModeEnabled ? ThemeData.dark() : ThemeData.light(),
    );
  }
}
