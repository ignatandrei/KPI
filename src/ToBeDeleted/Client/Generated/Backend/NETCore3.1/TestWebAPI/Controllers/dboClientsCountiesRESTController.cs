
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
    public class REST_dboClientsCountiesController : ControllerBase
    {
        private readonly IRepository<dboClientsCounties,Int64> _repository;

        public REST_dboClientsCountiesController(IRepository<dboClientsCounties,Int64> repository)
        {
            _repository = repository;
        }

        // GET: api/dboClientsCounties
        [HttpGet]
        public async Task<ActionResult<IEnumerable<dboClientsCounties>>> GetAll()
        {
            return await _repository.GetAll();
        }
            
        // GET: api/dboClientsCounties/5
        [HttpGet("{id}")]
        public async Task<ActionResult<dboClientsCounties>> FindAfterId(Int64 id)
        {
            var record = await _repository.FindAfterId(id);

            if (record == null)
            {
                return NotFound($"cannot find record with id = {id}");
            }

            return record;
        }

        // PUT: api/dboClientsCounties/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<ActionResult<dboClientsCounties>> Update(Int64 id, dboClientsCounties record)
        {
            if (id != record.idclientscounties)
            {
                return BadRequest();
            }
            
            await _repository.Update(record);
            
            return record;
        }

        // POST: api/dboClientsCounties
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<dboClientsCounties> Post(dboClientsCounties record)
        {
            await _repository.Insert(record);

            return record;
        }

        // DELETE: api/dboClientsCounties/5
        [HttpDelete("{id}")]
        public async Task<Int64> Delete(Int64 id)
        {
            
            await _repository.Delete( new dboClientsCounties(){
                idclientscounties=id
            });


            return id;
        }

       
    }
}
