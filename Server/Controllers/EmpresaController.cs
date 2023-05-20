using Microsoft.AspNetCore.Mvc;

[ApiController]
[Route("/empresa")]
public class EmpresaController : ControllerBase
{
    private Db _context;
    public EmpresaController(Db context) {
        _context = context;
    }

    [HttpGet("/empresa/{id}")]
    public IActionResult Find(int id){
        return Ok(_context.Empresa!.Find(id));
    }
    [HttpGet]
    public IActionResult GetAll(){
        return Ok(_context.Empresa!.ToList());
    }

    [HttpPost]
    public IActionResult Create(EmpresaDTO dto){
        try{
            var Empresa = new Empresa(){
                Endereco = dto.Endereco,
                Nome = dto.Nome,
                Telefone = dto.Nome,
                id = _context.Empresa!.Max(table => table.id)+1 
            };
            _context.Empresa!.Add(Empresa);
            _context.SaveChanges();
            return Ok();
        }
        catch(Exception e){
            return BadRequest(e);
        }
    }

    [HttpPut]
    public IActionResult Update(EmpresaDTO dTO){
        try{
            var empresa = _context.Empresa!.Find(dTO.id)!;
            empresa.Nome = dTO.Nome;
            empresa.Endereco = dTO.Endereco;
            empresa.Telefone = dTO.Telefone;

            _context.SaveChanges();
            return Ok();
        }
        catch(Exception e){
            return BadRequest(e);
        }
    }
}