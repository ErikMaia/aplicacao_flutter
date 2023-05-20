using System.ComponentModel.DataAnnotations;

public class TarefaDTO {
  public int? id;
  public String? descricao;
  public DateTime dataInicio;
  public DateTime dataTermino;
  public String? status;
  // Funcionario funcionario;
  Cliente? cliente;
  Departamento? departamento;
  Projeto? projeto;
}
