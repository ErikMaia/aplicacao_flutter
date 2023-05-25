using System.ComponentModel.DataAnnotations;

public class TarefaDTO {
  public int? id;
  public String? descricao;
  public DateTime? dataInicio;
  public DateTime? dataTermino;
  public String? status;
  // Funcionario funcionario;
  public Cliente? cliente;
  public Departamento? departamento;
  public Projeto? projeto;
}
