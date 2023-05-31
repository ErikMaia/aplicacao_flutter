class ClienteEntity {
  final int? clienteId;
  final String nome;
  final String sobrenome;
  final String endereco;
  final String telefone;
  // List<Tarefa> tarefas;

  const ClienteEntity({
    this.clienteId,
    required this.nome,
    required this.sobrenome,
    required this.endereco,
    required this.telefone,
    // this.tarefas = const [],
  });

  String get nomeCompleto => '$nome $sobrenome';
}
