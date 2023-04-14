import 'package:sqflite/sqflite.dart';

import 'tarefa.dart';

class Funcionario {
  int? id;
  String? nome;
  String? sobrenome;
  String? endereco;
  String? telefone;
  List<Tarefa> tarefas;

  Funcionario({
    this.id,
    this.nome,
    this.sobrenome,
    this.endereco,
    this.telefone,
    this.tarefas = const [],
  });

  static const String table = 'funcionarios';

  static Future<void> createTable(Database db) async {
    await db.execute('''
      CREATE TABLE $table (
        id INTEGER PRIMARY KEY,
        nome TEXT,
        sobrenome TEXT,
        endereco TEXT,
        telefone TEXT
      )
    ''');
  }

  static Future<int> create(Funcionario funcionario, Database db) async {
    return await db.insert(table, funcionario.toMap());
  }

  static Future<List<Funcionario>> readAll(Database db) async {
    final List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(maps.length, (i) {
      return Funcionario.fromMap(maps[i]);
    });
  }

  static Future<Funcionario?> read(int id, Database db) async {
    final List<Map<String, dynamic>> maps =
        await db.query(table, where: 'id = ?', whereArgs: [id], limit: 1);
    if (maps.isNotEmpty) {
      return Funcionario.fromMap(maps.first);
    } else {
      return null;
    }
  }

  static Future<int> update(Funcionario funcionario, Database db) async {
    return await db.update(table, funcionario.toMap(),
        where: 'id = ?', whereArgs: [funcionario.id]);
  }

  static Future<int> delete(int id, Database db) async {
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'sobrenome': sobrenome,
      'endereco': endereco,
      'telefone': telefone,
    };
  }

  static Funcionario fromMap(Map<String, dynamic> map) {
    return Funcionario(
      id: map['id'],
      nome: map['nome'],
      sobrenome: map['sobrenome'],
      endereco: map['endereco'],
      telefone: map['telefone'],
      tarefas: [],
    );
  }

  Future<List<Tarefa>> getTarefas(Database db) async {
    final List<Map<String, dynamic>> maps = await db.query(
      Tarefa.table,
      where: 'funcionario_id = ?',
      whereArgs: [id],
    );

    return List.generate(maps.length, (i) {
      return Tarefa.fromMap(maps[i]);
    });
  }
}
