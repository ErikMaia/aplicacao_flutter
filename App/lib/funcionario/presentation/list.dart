import 'package:aula5/funcionario/data/model/funcionario.dart';
import 'package:aula5/models/funcionario.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../shared/widgets/app_listtile.dart';
import '../../widgets/drawer_pages.dart';
import '../data/datasources/list.dart';
import 'crud/crud.dart';

class FuncionarioList extends StatefulWidget {
  const FuncionarioList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FuncionarioPageState createState() => _FuncionarioPageState();
}

class _FuncionarioPageState extends State<FuncionarioList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: const Text('Funcionarios'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 2),
        child: FutureBuilder<List<FuncionarioModel>>(
          future: FuncionarioListDataSource().getAll(),
          initialData: const [],
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              case ConnectionState.done:
                final List<FuncionarioModel> funcionarios = snapshot.data;
                if (funcionarios.isEmpty) {
                  return const Center(
                    child: Text('Ainda não foi registrado nenhum funcionário.'),
                  );
                }
                return ListView.builder(
                  itemCount: funcionarios.length,
                  itemBuilder: (BuildContext context, int index) {
                    final FuncionarioModel funcionario = funcionarios[index];

                    return AppListTile(
                      isOdd: index.isOdd,
                      title: funcionario.nomeCompleto,
                      line01Text: funcionario.endereco,
                      line02Text: funcionario.telefone,
                      imageURL:
                          'https://tudocommoda.com/wp-content/uploads/2022/01/pessoa-interessante.png',
                    );
                  },
                );
              default:
                return Container(
                  color: Colors.red,
                );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FuncionarioForm()),
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
