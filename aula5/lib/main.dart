import 'package:flutter/material.dart';

import 'features/produtos/crud/crud.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pfe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProdutoCRUDPage(),
    );
  }
}
