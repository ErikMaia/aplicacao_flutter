import 'package:aula5/features/welcome/SharedDataSource.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProdutoCRUDPage extends StatefulWidget {
  ProdutoCRUDPage();

  @override
  // ignore: library_private_types_in_public_api
  _ProdutoCRUDPageState createState() => _ProdutoCRUDPageState();
}

class _ProdutoCRUDPageState extends State<ProdutoCRUDPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Dados de Produto')),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Nome'),
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Descricao'),
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Valor'),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      var sp = await SharedPreferences.getInstance();
                      var ds = SharedDataSource(
                        sharedPreferences: sp,
                      );

                      ds.register(
                          Nome: 'Nome', Descricao: 'Descricao', valor: 'valor');
                    },
                    child: Text('Gravar'))
              ],
            )));
  }
}
