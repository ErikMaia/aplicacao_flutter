import 'package:aula5/models/funcionario.dart';
import 'package:aula5/pages/funcionario/funcionario_edit.dart';
import 'package:aula5/pages/funcionario/funcionario_new.dart';
import 'package:flutter/material.dart';

import '../../widgets/drawer_pages.dart';

class FuncionarioList extends StatefulWidget {
  @override
  _FuncionarioPageState createState() => _FuncionarioPageState();
}

class _FuncionarioPageState extends State<FuncionarioList> {
  List<Funcionario> _funcionarios = [];

  void getFuncionarios() async {
    var funcionarios = await Funcionario.readAll();
    setState(() {
      _funcionarios = funcionarios;
    });
  }

  @override
  void initState() {
    super.initState();
    getFuncionarios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Funcionarios'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _funcionarios.length,
        itemBuilder: (BuildContext context, int index) {
          final funcionario = _funcionarios[index];

          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(funcionario.nome ?? ''),
                const SizedBox(width: 5),
                Text(funcionario.sobrenome ?? ''),
                const SizedBox(width: 5),
                Text(funcionario.endereco ?? ''),
                const SizedBox(width: 5),
                Text(funcionario.telefone ?? ''),
                const SizedBox(width: 5),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FuncionarioEdit(
                          funcionario: funcionario,
                        )),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FuncionarioNew()),
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      drawer: DrawerPage.getWidget(context),
    );
  }
}
