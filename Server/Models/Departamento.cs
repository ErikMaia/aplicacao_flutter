using System.ComponentModel.DataAnnotations;

public class Departamento
{
    [Key]
    public int ?Id { get; set; }

    public string ?Nome { get; set; }

    public string ?Descricao { get; set; }
}
