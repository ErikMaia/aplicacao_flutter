
using Microsoft.EntityFrameworkCore;

public class Db : DbContext
{
    // Defina suas entidades como DbSet
    public DbSet<Cliente>? Clientes { get; set; }
    public DbSet<Departamento>? Departamento { get; set; }
    public DbSet<Empresa>? Empresa { get; set; }
    public DbSet<Funcionario>? Funcionario { get; set; }    
    public DbSet<Projeto>? Projeto { get; set; }
    public DbSet<Tarefa>? Tarefa { get; set; }    
}