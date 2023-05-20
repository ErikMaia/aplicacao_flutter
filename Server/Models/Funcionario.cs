using System.ComponentModel.DataAnnotations;

public class Funcionario {
  [Key]
  public int? id;
  public String? nome;
  public String? sobrenome;
  public String? endereco;
  public String? telefone;
  public List<Tarefa>? tarefas;
}