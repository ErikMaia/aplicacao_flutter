using System;
using System.ComponentModel.DataAnnotations;

public class Projeto
{
    [Key]
    public int ?Id { get; set; }

    public string ?Nome { get; set; }

    public string ?Descricao { get; set; }

    public DateTime ?DataInicio { get; set; }

    public DateTime ?DataTermino { get; set; }
}
