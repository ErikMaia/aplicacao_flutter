using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

public class Funcionario
{
    [Key]
    public int ?Id { get; set; }

    public string ?Nome { get; set; }

    public string ?Sobrenome { get; set; }

    public string ?Endereco { get; set; }

    public string ?Telefone { get; set; }

    public List<Tarefa> ?Tarefas { get; set; }
}
