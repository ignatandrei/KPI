
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
    public class REST_dboClientsCategoryController : ControllerBase
    {
        private readonly IRepository<dboClientsCategory,Int64> _repository;

        public REST_dboClientsCategoryController(IRepository<dboClientsCategory,Int64> repository)
        {
            _repository = repository;
        }

        // GET: api/dboClientsCategory
        [HttpGet]
        public async Task<ActionResult<IEnumerable<dboClientsCategory>>> GetAll()
        {
            return await _repository.GetAll();
        }
            
        // GET: api/dboClientsCategory/5
        [HttpGet("{id}")]
        public async Task<ActionResult<dboClientsCategory>> FindAfterId(Int64 id)
        {
            var record = await _repository.FindAfterId(id);

            if (record == null)
            {
                return NotFound($"cannot find record with id = {id}");
            }

            return record;
        }

        // PUT: api/dboClientsCategory/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<ActionResult<dboClientsCategory>> Update(Int64 id, dboClientsCategory record)
        {
            if (id != record.id)
            {
                return BadRequest();
            }
            
            await _repository.Update(record);
            
            return record;
        }

        // POST: api/dboClientsCategory
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<dboClientsCategory> Post(dboClientsCategory record)
        {
            await _repository.Insert(record);

            return record;
        }

        // DELETE: api/dboClientsCategory/5
        [HttpDelete("{id}")]
        public async Task<Int64> Delete(Int64 id)
        {
            
            await _repository.Delete( new dboClientsCategory(){
                id=id
            });


            return id;
        }

       
    }
}
