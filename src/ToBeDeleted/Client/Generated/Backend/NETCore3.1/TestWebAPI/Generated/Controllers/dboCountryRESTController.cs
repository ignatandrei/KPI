
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
    public class REST_dboRegionController : ControllerBase
    {
        private readonly IRepository<dboRegion,Int32> _repository;

        public REST_dboRegionController(IRepository<dboRegion,Int32> repository)
        {
            _repository = repository;
        }

        // GET: api/dboRegion
        [HttpGet]
        public async Task<ActionResult<IEnumerable<dboRegion>>> GetAll()
        {
            return await _repository.GetAll();
        }
            
        // GET: api/dboRegion/5
        [HttpGet("{id}")]
        public async Task<ActionResult<dboRegion>> FindAfterId(Int32 id)
        {
            var record = await _repository.FindAfterId(id);

            if (record == null)
            {
                return NotFound($"cannot find record with id = {id}");
            }

            return record;
        }

        // PUT: api/dboRegion/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<ActionResult<dboRegion>> Update(Int32 id, dboRegion record)
        {
            if (id != record.idRegion)
            {
                return BadRequest();
            }
            
            await _repository.Update(record);
            
            return record;
        }

        // POST: api/dboRegion
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<dboRegion> Post(dboRegion record)
        {
            await _repository.Insert(record);

            return record;
        }

        // DELETE: api/dboRegion/5
        [HttpDelete("{id}")]
        public async Task<Int32> Delete(Int32 id)
        {
            
            await _repository.Delete( new dboRegion(){
                idRegion=id
            });


            return id;
        }

       
    }
}
