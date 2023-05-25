using System.ComponentModel.DataAnnotations;
namespace Server.Models;
public class DepartamentoModel
{
    [Key]
    public int? DepartamentoId { get; set; }

    public string? Nome { get; set; }

    public string? Descricao { get; set; }
}
