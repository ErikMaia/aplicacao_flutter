using System.ComponentModel.DataAnnotations;

public class Empresa {
  [Key]
  public int? id;
  public String? Nome;
  public String? Endereco;
  public String? Telefone;
}
