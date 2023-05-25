using System;
using System.ComponentModel.DataAnnotations;


public class Tarefa
{
    [Key]
    public int ?Id { get; set; }

    public string ?Descricao { get; set; }

    public DateTime ?DataInicio { get; set; }

    public DateTime ?DataTermino { get; set; }

    public string ?Status { get; set; }

    public Cliente ?Cliente { get; set; }

    public Departamento ?Departamento { get; set; }

    public Projeto ?Projeto { get; set; }
}
