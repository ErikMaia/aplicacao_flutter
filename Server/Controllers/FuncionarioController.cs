using Microsoft.AspNetCore.Mvc;

namespace Server.Controllers
{
    [ApiController]
    [Route("/funcionario")]
    public class FuncionarioController : ControllerBase
    {
        private Db _context;

        public FuncionarioController(Db context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult getAll(){
            return Ok(_context.Funcionario!.ToArray());
        }

        [HttpGet("/funcionario/{id}")]
        public IActionResult find(int id){
            var funcionario = _context.Funcionario!.Find(id);
            if(funcionario == null){
                return NotFound();
            }
            return Ok(funcionario);
        }

        [HttpPut]
        public IActionResult update(FuncionarioDTO dTO){
            var funcionario = _context.Funcionario!.Find(dTO.id);
            if(funcionario == null)
                return NotFound();
            funcionario.endereco = dTO.endereco;
            funcionario.nome = dTO.nome;
            funcionario.sobrenome = dTO.sobrenome;
            funcionario.telefone = dTO.telefone;
            funcionario.tarefas = dTO.tarefas;
            _context.SaveChanges();
            return Ok();
        }

        [HttpDelete("/funcionario/{id}")]
        public IActionResult remove(int id){
            var funcionario = _context.Funcionario!.Find(id);
            if(funcionario == null)
                return NotFound();
            _context.Funcionario.Remove(funcionario);
            return Ok();
        }
    }
}