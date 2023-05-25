using Microsoft.AspNetCore.Mvc;

namespace Server.Controllers
{
    [ApiController]
    [Route("/projeto")]
    public class ProjetoController : ControllerBase
    {
        private Db _context;

        public ProjetoController(Db context)
        {
            _context = context;
        }
        [HttpGet]
        public IActionResult getAll(){
            return Ok(_context.Projeto!.ToArray());
        }

        [HttpGet("/projeto/{id}")]
        public IActionResult find(int id){
            var projeto = _context.Projeto!.Find(id);
            if(projeto == null){
                return NotFound();
            }
            return Ok(projeto);
        }

        [HttpPut]
        public IActionResult update(ProjetoDTO dTO){
            var projeto = _context.Projeto!.Find(dTO.id);
            if(projeto == null)
                return NotFound();
            projeto.Nome = dTO.nome;
            projeto.DataInicio = dTO.dataInicio;
            projeto.DataTermino = dTO.dataTermino;
            projeto.Descricao = dTO.descricao;
            _context.SaveChanges();
            return Ok();
        }

        [HttpDelete("/projeto/{id}")]
        public IActionResult remove(int id){
            var projeto = _context.Projeto!.Find(id);
            if(projeto == null)
                return NotFound();
            _context.Projeto.Remove(projeto);
            return Ok();
        }
    }
}