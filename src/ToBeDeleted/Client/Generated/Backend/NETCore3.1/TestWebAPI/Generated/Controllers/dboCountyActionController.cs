
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
    public class dboCountyController : ControllerBase
    {
        private readonly  IRepository<dboCounty,Int64> _repository;

        public dboCountyController(IRepository<dboCounty,Int64> repository)
        {
            _repository = repository;
        }
        [HttpGet]
        public async Task<long> Count()
        {
            return await _repository.Count();
        }
        // GET: api/dboCounty
        [HttpGet]
        public async Task<ActionResult<IEnumerable<dboCounty>>> GetAll()
        {
            return await _repository.GetAll();
        }
        // GET: api/dboCounty/5
        [HttpGet("{id}")]
        public async Task<ActionResult<dboCounty>> Get(Int64 id)
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
        public async Task<ActionResult<dboCounty>> Put(Int64 id, dboCounty record)
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
        public async Task<dboCounty> Insert(dboCounty record)
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
