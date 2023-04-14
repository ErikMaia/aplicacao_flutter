import 'package:flutter/material.dart';

class ClienteEdit extends StatefulWidget {
  const ClienteEdit({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ClientePageState createState() => _ClientePageState();
}

class _ClientePageState extends State<ClienteEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Criar cliente')),
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
                      decoration: const InputDecoration(labelText: 'Sobrenome'),
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