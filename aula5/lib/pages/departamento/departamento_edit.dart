import 'package:flutter/material.dart';

class DepartamentoEdit extends StatefulWidget {
  const DepartamentoEdit({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProdutoCRUDPageState createState() => _ProdutoCRUDPageState();
}

class _ProdutoCRUDPageState extends State<DepartamentoEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Criar departamento')),
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
