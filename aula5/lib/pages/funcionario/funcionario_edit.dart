import 'package:aula5/features/welcome/SharedDataSource.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FuncionarioEdit extends StatefulWidget {
  const FuncionarioEdit({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FuncionarioPageState createState() => _FuncionarioPageState();
}

class _FuncionarioPageState extends State<FuncionarioEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Criar Funcionario')),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Nome'),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Descricao'),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Endereco'),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Telefone'),
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () async {
                      // var sp = await SharedPreferences.getInstance();
                      // var ds = SharedDataSource(
                      //   sharedPreferences: sp,
                      // );

                      // ds.register(Nome: 'Nome', Descricao: 'Descricao');
                    },
                    child: const Text('Gravar'))
              ],
            )));
  }
}
