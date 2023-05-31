import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/departamento.dart';

class DepartamentoInsertDataSource {
  final String baseUrl = 'http://10.0.2.2/departamento';

  Future<DepartamentoModel> createDepartamento(
      {required DepartamentoModel departamento}) async {
    var teste = jsonEncode(departamento.toJson());
    //print(teste);
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: teste,
    );

    if (response.statusCode == 201) {
      return DepartamentoModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao criar departamento.');
    }
  }
}
