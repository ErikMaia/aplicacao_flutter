import 'package:flutter/material.dart';

class TarefaEdit extends StatefulWidget {
  const TarefaEdit({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TarefaPageState createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Criar Tarefa')),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
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
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Status'),
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
