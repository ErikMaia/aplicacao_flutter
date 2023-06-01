import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/projeto.dart';

class ProjetoListDataSource {
  final String baseUrl = 'http://10.0.2.2/projeto';

  Future<List<ProjetoModel>> getProjetos() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((json) => ProjetoModel.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar projeto.');
    }
  }

  Future<ProjetoModel> getProjetoById(int id) async {
    final url = '$baseUrl/$id';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return ProjetoModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao carregar projeto.');
    }
  }
}
