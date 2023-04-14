import 'package:sqflite/sqflite.dart';

class Cliente {
  int? id;
  String? nome;
  String? sobrenome;
  String? endereco;
  String? telefone;

  Cliente({
    this.id,
    this.nome,
    this.sobrenome,
    this.endereco,
    this.telefone,
  });

  static const String table = 'clientes';

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

  static Future<int> create(Cliente cliente, Database db) async {
    return await db.insert(table, cliente.toMap());
  }

  static Future<List<Cliente>> readAll(Database db) async {
    final List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(maps.length, (i) {
      return Cliente.fromMap(maps[i]);
    });
  }

  static Future<Cliente?> read(int id, Database db) async {
    final List<Map<String, dynamic>> maps =
        await db.query(table, where: 'id = ?', whereArgs: [id], limit: 1);
    if (maps.isNotEmpty) {
      return Cliente.fromMap(maps.first);
    } else {
      return null;
    }
  }

  static Future<int> update(Cliente cliente, Database db) async {
    return await db.update(table, cliente.toMap(),
        where: 'id = ?', whereArgs: [cliente.id]);
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

  static Cliente fromMap(Map<String, dynamic> map) {
    return Cliente(
      id: map['id'],
      nome: map['nome'],
      sobrenome: map['sobrenome'],
      endereco: map['endereco'],
      telefone: map['telefone'],
    );
  }
}
