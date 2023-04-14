import 'package:aula5/widgets/drawer_pages.dart';
import 'package:flutter/material.dart';

class DepartamentoEdit extends StatefulWidget {
  const DepartamentoEdit({super.key});

  @override
  State<DepartamentoEdit> createState() => _DepartamentoEditState();
}

class _DepartamentoEditState extends State<DepartamentoEdit> {
  final List<String> _formValues = ['', ''];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text(''),
      ),
      drawer: DrawerPage.getWidget(context),
      body: Container(
        padding: const EdgeInsets.all(24),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nome',
              ),
              onChanged: (String? value) {
                _formValues[0] = value ?? '';
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Descrição'),
              onChanged: (String? value) {
                _formValues[1] = value ?? '';
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent, padding: const EdgeInsets.all(20)),
                    child: const Text('Deletar')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, padding: const EdgeInsets.all(20)),
                    child: const Text('Atualizar'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
