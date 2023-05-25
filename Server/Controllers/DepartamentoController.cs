using Microsoft.AspNetCore.Mvc;

[ApiController]
[Route("/departamento")]
public class DepartamentoController : ControllerBase
{
    private Db _context;
    public DepartamentoController(Db context) {
        _context = context;
    }

    [HttpGet("/departamento/{id}")]
    public IActionResult Find(int id){
        return Ok(_context.Departamento!.Find(id));
    }
    [HttpGet]
    public IActionResult GetAll(){
        return Ok(_context.Departamento!.ToList());
    }

    [HttpPost]
    public IActionResult Create(DepartamentoDTO dto){
        try{
            var departamento = new Departamento(){
                Descricao = dto.descricao,
                Nome = dto.nome,
                Id = _context.Departamento!.Max(table => table.Id)+1 
            };
            _context.Departamento!.Add(departamento);
            _context.SaveChanges();
            return Ok();
        }
        catch(Exception e){
            return BadRequest(e);
        }
    }

    [HttpPut]
    public IActionResult Update(DepartamentoDTO dTO){
        try{
            var departamento = _context.Departamento!.Find(dTO.id)!;
            departamento.Descricao = dTO.descricao;
            departamento.Nome = dTO.nome;
            _context.SaveChanges();
            return Ok();
        }
        catch(Exception e){
            return BadRequest(e);
        }
    }
}