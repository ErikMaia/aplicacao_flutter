using System.ComponentModel.DataAnnotations;

public class Projeto {
  [Key]
  public int? id;
  public String? nome;
  public String? descricao;
  public String? dataInicio;
  public String? dataTermino;
}
