using System.ComponentModel.DataAnnotations;

public class Departamento {
  [Key]
  public int? id;
  public String? nome;
  public String? descricao;
}
