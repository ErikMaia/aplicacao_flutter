import 'package:flutter/material.dart';
import '../../widgets/drawer_pages.dart';
import 'departamento_edit.dart';
import 'package:aula5/models/departamento.dart';

class DepartamentoList extends StatefulWidget {
  const DepartamentoList({Key? key}) : super(key: key);

  @override
  _DepartamentoListState createState() => _DepartamentoListState();
}

class _DepartamentoListState extends State<DepartamentoList> {
  List<Departamento> _departamentos = [];

  void getDepartamentos() async {
    var departamentos = await Departamento.readAll();
    setState(() {
      _departamentos = departamentos;
    });
  }

  @override
  void initState() {
    super.initState();
    getDepartamentos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Departamentos'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _departamentos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(_departamentos[index].nome ?? ''),
                const SizedBox(width: 5),
                Text(_departamentos[index].descricao ?? ''),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DepartamentoEdit(),
                ),
              ).then((value) {
                getDepartamentos();
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DepartamentoEdit(),
            ),
          ).then((value) {
            getDepartamentos();
          });
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      drawer: DrawerPage.getWidget(context),
    );
  }
}
