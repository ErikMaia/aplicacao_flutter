using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace Server.Controllers
{
    [ApiController]
    [Route("/tarefa")]
    public class TarefaController : ControllerBase
    {
        private Db _context;

        public TarefaController(Db context)
        {
            _context = context;
        }
        [HttpGet]
        public IActionResult getAll(){
            return Ok(_context.Tarefa!.ToArray());
        }

        [HttpGet("/tarefa/{id}")]
        public IActionResult find(int id){
            var tarefa = _context.Tarefa!.Find(id);
            if(tarefa == null){
                return NotFound();
            }
            return Ok(tarefa);
        }

        [HttpPut]
        public IActionResult update(TarefaDTO dTO){
            var tarefa = _context.Tarefa!.Find(dTO.id);
            if(tarefa == null)
                return NotFound();
            // falta mudar aqui
            _context.SaveChanges();
            return Ok();
        }

        [HttpDelete("/tarefa/{id}")]
        public IActionResult remove(int id){
            var tarefa = _context.Tarefa!.Find(id);
            if(tarefa == null)
                return NotFound();
            _context.Tarefa.Remove(tarefa);
            return Ok();
        }
    }
}