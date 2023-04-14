import 'package:sqflite/sqflite.dart';

class Projeto {
  int? id;
  String? nome;
  String? descricao;
  String? dataInicio;
  String? dataTermino;

  Projeto({
    this.id,
    this.nome,
    this.descricao,
    this.dataInicio,
    this.dataTermino,
  });

  static const String table = 'projetos';

  static Future<void> createTable(Database db) async {
    await db.execute('''
      CREATE TABLE $table (
        id INTEGER PRIMARY KEY,
        nome TEXT,
        descricao TEXT,
        data_inicio TEXT,
        data_termino TEXT
      )
    ''');
  }

  static Future<int> create(Projeto projeto, Database db) async {
    return await db.insert(table, projeto.toMap());
  }

  static Future<List<Projeto>> readAll(Database db) async {
    final List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(maps.length, (i) {
      return Projeto.fromMap(maps[i]);
    });
  }

  static Future<Projeto?> read(int id, Database db) async {
    final List<Map<String, dynamic>> maps =
        await db.query(table, where: 'id = ?', whereArgs: [id], limit: 1);
    if (maps.isNotEmpty) {
      return Projeto.fromMap(maps.first);
    } else {
      return null;
    }
  }

  static Future<int> update(Projeto projeto, Database db) async {
    return await db.update(table, projeto.toMap(),
        where: 'id = ?', whereArgs: [projeto.id]);
  }

  static Future<int> delete(int id, Database db) async {
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'data_inicio': dataInicio,
      'data_termino': dataTermino,
    };
  }

  static Projeto fromMap(Map<String, dynamic> map) {
    return Projeto(
      id: map['id'],
      nome: map['nome'],
      descricao: map['descricao'],
      dataInicio: map['data_inicio'],
      dataTermino: map['data_termino'],
    );
  }
}
