
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
    public class REST_dboClientsController : ControllerBase
    {
        private readonly IRepository<dboClients,Int64> _repository;

        public REST_dboClientsController(IRepository<dboClients,Int64> repository)
        {
            _repository = repository;
        }

        // GET: api/dboClients
        [HttpGet]
        public async Task<ActionResult<IEnumerable<dboClients>>> GetAll()
        {
            return await _repository.GetAll();
        }
            
        // GET: api/dboClients/5
        [HttpGet("{id}")]
        public async Task<ActionResult<dboClients>> FindAfterId(Int64 id)
        {
            var record = await _repository.FindAfterId(id);

            if (record == null)
            {
                return NotFound($"cannot find record with id = {id}");
            }

            return record;
        }

        // PUT: api/dboClients/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<ActionResult<dboClients>> Update(Int64 id, dboClients record)
        {
            if (id != record.idclient)
            {
                return BadRequest();
            }
            
            await _repository.Update(record);
            
            return record;
        }

        // POST: api/dboClients
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<dboClients> Post(dboClients record)
        {
            await _repository.Insert(record);

            return record;
        }

        // DELETE: api/dboClients/5
        [HttpDelete("{id}")]
        public async Task<Int64> Delete(Int64 id)
        {
            
            await _repository.Delete( new dboClients(){
                idclient=id
            });


            return id;
        }

       
    }
}
