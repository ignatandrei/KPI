
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
    public class REST_dboCountyController : ControllerBase
    {
        private readonly IRepository<dboCounty,Int64> _repository;

        public REST_dboCountyController(IRepository<dboCounty,Int64> repository)
        {
            _repository = repository;
        }

        // GET: api/dboCounty
        [HttpGet]
        public async Task<ActionResult<IEnumerable<dboCounty>>> GetAll()
        {
            return await _repository.GetAll();
        }
            
        // GET: api/dboCounty/5
        [HttpGet("{id}")]
        public async Task<ActionResult<dboCounty>> FindAfterId(Int64 id)
        {
            var record = await _repository.FindAfterId(id);

            if (record == null)
            {
                return NotFound($"cannot find record with id = {id}");
            }

            return record;
        }

        // PUT: api/dboCounty/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<ActionResult<dboCounty>> Update(Int64 id, dboCounty record)
        {
            if (id != record.idcounty)
            {
                return BadRequest();
            }
            
            await _repository.Update(record);
            
            return record;
        }

        // POST: api/dboCounty
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<dboCounty> Post(dboCounty record)
        {
            await _repository.Insert(record);

            return record;
        }

        // DELETE: api/dboCounty/5
        [HttpDelete("{id}")]
        public async Task<Int64> Delete(Int64 id)
        {
            
            await _repository.Delete( new dboCounty(){
                idcounty=id
            });


            return id;
        }

       
    }
}
