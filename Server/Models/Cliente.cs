using System.ComponentModel.DataAnnotations;

public class Cliente {
  [Key]
  public int? id;
  public String? nome;
  public String? sobrenome;
  public String? endereco;
  public String? telefone;
}
