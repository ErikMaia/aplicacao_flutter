using System;
using System.ComponentModel.DataAnnotations;
namespace Server.Models;
public class ProjetoModel
{
    [Key]
    public int? ProjetoId { get; set; }

    public string? Nome { get; set; }

    public string? Descricao { get; set; }

    public DateTime? DataInicio { get; set; }

    public DateTime? DataTermino { get; set; }
}
