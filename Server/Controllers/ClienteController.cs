using Microsoft.AspNetCore.Mvc;

[ApiController]
[Route("/cliente")]
public class ClienteController : ControllerBase
{
    private Db _context;

    public ClienteController(Db context) {
        _context = context;
    }

    [HttpGet("/cliente/{id}")]
    public IActionResult Find(int id){
        return Ok(_context.Clientes!.Find(id));
    }

    [HttpGet]
    public IActionResult GetAll(){
        return Ok(_context.Clientes!.ToList());
    }

    [HttpPost]
    public IActionResult Create(ClienteDTO dTO){
        var cliente = new Cliente(){
            nome = dTO.nome,
            sobrenome = dTO.sobrenome,    
            endereco = dTO.endereco,
            telefone = dTO.telefone,
            id = _context.Clientes!.Max(table=>table.id)+1
        };
        try{
            _context.Clientes!.Add(cliente);
            _context.SaveChanges();
            return Ok();
        }
        catch(Exception e){
            return BadRequest(e);
        }
    }

    [HttpPut]
    public IActionResult Update(ClienteDTO dTO){
        try{
            var cliente = _context.Clientes!.Find(dTO.id)!;
            cliente.endereco = dTO.endereco;
            _context.SaveChanges();
            return Ok();
        }
        catch(Exception e){
            return BadRequest(e);
        }
    }
}