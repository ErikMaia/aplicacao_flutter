import 'package:flutter/material.dart';

class ProjetoEdit extends StatefulWidget {
  const ProjetoEdit({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProjetoPageState createState() => _ProjetoPageState();
}

class _ProjetoPageState extends State<ProjetoEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Criar Projeto')),
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
                      decoration:
                          const InputDecoration(labelText: 'Data Inicio'),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Data Fim'),
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
