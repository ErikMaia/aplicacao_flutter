import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedDataSource {
  final SharedPreferences sharedPreferences;

  SharedDataSource({
    required this.sharedPreferences,
  });

  register(
      {required String Nome,
      required String Descricao,
      required String valor}) async {
    await sharedPreferences.setString('Nome', Nome);
    await sharedPreferences.setString('Descricao', Descricao);
  }
}
