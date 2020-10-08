
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
    public class REST_dboAssVAClientsCountiesController : ControllerBase
    {
        private readonly IRepository<dboAssVAClientsCounties,Int64> _repository;

        public REST_dboAssVAClientsCountiesController(IRepository<dboAssVAClientsCounties,Int64> repository)
        {
            _repository = repository;
        }

        // GET: api/dboAssVAClientsCounties
        [HttpGet]
        public async Task<ActionResult<IEnumerable<dboAssVAClientsCounties>>> GetAll()
        {
            return await _repository.GetAll();
        }
            
        // GET: api/dboAssVAClientsCounties/5
        [HttpGet("{id}")]
        public async Task<ActionResult<dboAssVAClientsCounties>> FindAfterId(Int64 id)
        {
            var record = await _repository.FindAfterId(id);

            if (record == null)
            {
                return NotFound($"cannot find record with id = {id}");
            }

            return record;
        }

        // PUT: api/dboAssVAClientsCounties/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<ActionResult<dboAssVAClientsCounties>> Update(Int64 id, dboAssVAClientsCounties record)
        {
            if (id != record.idassvaclientscounties)
            {
                return BadRequest();
            }
            
            await _repository.Update(record);
            
            return record;
        }

        // POST: api/dboAssVAClientsCounties
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<dboAssVAClientsCounties> Post(dboAssVAClientsCounties record)
        {
            await _repository.Insert(record);

            return record;
        }

        // DELETE: api/dboAssVAClientsCounties/5
        [HttpDelete("{id}")]
        public async Task<Int64> Delete(Int64 id)
        {
            
            await _repository.Delete( new dboAssVAClientsCounties(){
                idassvaclientscounties=id
            });


            return id;
        }

       
    }
}
