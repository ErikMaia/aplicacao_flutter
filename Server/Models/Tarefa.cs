using System.ComponentModel.DataAnnotations;

public class Tarefa {
  [Key]
  int? id;
  String? descricao;
  DateTime dataInicio;
  DateTime dataTermino;
  String? status;
  // Funcionario funcionario;
  Cliente? cliente;
  Departamento? departamento;
  Projeto? projeto;
}
