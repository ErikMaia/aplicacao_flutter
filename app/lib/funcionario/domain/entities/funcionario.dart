class FuncionarioEntity {
  final int? funcionarioId;
  final String nome;
  final String sobrenome;
  final String endereco;
  final String telefone;

  const FuncionarioEntity({
    this.funcionarioId,
    required this.nome,
    required this.sobrenome,
    required this.endereco,
    required this.telefone,
  });

  String get nomeCompleto => '$nome $sobrenome';
}
