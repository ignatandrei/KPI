
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TestWEBAPI_DAL;
using TestWebAPI_BL;

namespace TestWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class REST_dboAssVAController : ControllerBase
    {
        private readonly IRepository<dboAssVA,Int64> _repository;

        public REST_dboAssVAController(IRepository<dboAssVA,Int64> repository)
        {
            _repository = repository;
        }

        // GET: api/dboAssVA
        [HttpGet]
        public async Task<ActionResult<IEnumerable<dboAssVA>>> GetAll()
        {
            return await _repository.GetAll();
        }
            
        // GET: api/dboAssVA/5
        [HttpGet("{id}")]
        public async Task<ActionResult<dboAssVA>> FindAfterId(Int64 id)
        {
            var record = await _repository.FindAfterId(id);

            if (record == null)
            {
                return NotFound($"cannot find record with id = {id}");
            }

            return record;
        }

        // PUT: api/dboAssVA/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<ActionResult<dboAssVA>> Update(Int64 id, dboAssVA record)
        {
            if (id != record.idassva)
            {
                return BadRequest();
            }
            
            await _repository.Update(record);
            
            return record;
        }

        // POST: api/dboAssVA
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<dboAssVA> Post(dboAssVA record)
        {
            await _repository.Insert(record);

            return record;
        }

        // DELETE: api/dboAssVA/5
        [HttpDelete("{id}")]
        public async Task<Int64> Delete(Int64 id)
        {
            
            await _repository.Delete( new dboAssVA(){
                idassva=id
            });


            return id;
        }

       
    }
}
