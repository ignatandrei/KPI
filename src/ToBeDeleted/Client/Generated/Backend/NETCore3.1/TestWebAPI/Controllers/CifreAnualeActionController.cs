
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
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class CifreAnualeController : ControllerBase
    {
        private readonly IRepository<CifreAnuale,long> _repository;

        public CifreAnualeController(IRepository<CifreAnuale,long> repository)
        {
            _repository = repository;
        }

        // GET: api/CifreAnuale
        [HttpGet]
        public async Task<ActionResult<IEnumerable<CifreAnuale>>> GetAll()
        {
            return await _repository.GetAll();
        }

        // GET: api/CifreAnuale/5
        [HttpGet("{id}")]
        public async Task<ActionResult<CifreAnuale>> Get(long id)
        {
            var record = await _repository.FindAfterId(id);

            if (record == null)
            {
                return NotFound($"cannot find record with id = {id}");
            }

            return record;
        }

        // PUT: api/CifreAnuale/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<ActionResult<CifreAnuale>> Put(long id, CifreAnuale record)
        {
            if (id != record.id20200908075419)
            {
                return BadRequest();
            }
            
             await _repository.Update(record);
            
            return record;
        }

        // POST: api/CifreAnuale
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<CifreAnuale> Insert(CifreAnuale record)
        {
            await _repository.Insert(record);

            return record;
        }

        // DELETE: api/CifreAnuale/5
        [HttpDelete("{id}")]
        public async Task<long> Delete(long id)
        {
            
            await _repository.Delete( new CifreAnuale(){
                id20200908075419=id
            });


            return id;
        }

       
    }
}
