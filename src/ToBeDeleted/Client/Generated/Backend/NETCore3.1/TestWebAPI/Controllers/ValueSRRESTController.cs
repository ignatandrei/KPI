
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
    public class REST_ValueSRController : ControllerBase
    {
        private readonly IRepository<ValueSR,long> _repository;

        public REST_ValueSRController(IRepository<ValueSR,long> repository)
        {
            _repository = repository;
        }

        // GET: api/ValueSR
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ValueSR>>> GetAll()
        {
            return await _repository.GetAll();
        }

        // GET: api/ValueSR/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ValueSR>> FindAfterId(long id)
        {
            var record = await _repository.FindAfterId(id);

            if (record == null)
            {
                return NotFound($"cannot find record with id = {id}");
            }

            return record;
        }

        // PUT: api/ValueSR/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<ActionResult<ValueSR>> Update(long id, ValueSR record)
        {
            if (id != record.id20200908075619)
            {
                return BadRequest();
            }
            
            await _repository.Update(record);
            
            return record;
        }

        // POST: api/ValueSR
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ValueSR> Post(ValueSR record)
        {
            await _repository.Insert(record);

            return record;
        }

        // DELETE: api/ValueSR/5
        [HttpDelete("{id}")]
        public async Task<long> Delete(long id)
        {
            
            await _repository.Delete( new ValueSR(){
                id20200908075619=id
            });


            return id;
        }

       
    }
}
