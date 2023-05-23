
using Microsoft.EntityFrameworkCore;
using Pomelo.EntityFrameworkCore.MySql.Infrastructure;

public class Db : DbContext
{
    // Defina suas entidades como DbSet
    public DbSet<Cliente>? Clientes { get; set; }
    public DbSet<Departamento>? Departamento { get; set; }
    public DbSet<Empresa>? Empresa { get; set; }
    public DbSet<Funcionario>? Funcionario { get; set; }    
    public DbSet<Projeto>? Projeto { get; set; }
    public DbSet<Tarefa>? Tarefa { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            var serverVersion = new MySqlServerVersion(new Version(8, 0, 31)); // Especifique a versÃ£o correta do servidor MySQL aqui

            optionsBuilder.UseMySql("Server=database;Port=3306;Database=tarefas;User=root;Password=tarefas;", serverVersion);
        }
}