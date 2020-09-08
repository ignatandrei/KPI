
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
    public class REST_TargetSRController : ControllerBase
    {
        private readonly IRepository<TargetSR,long> _repository;

        public REST_TargetSRController(IRepository<TargetSR,long> repository)
        {
            _repository = repository;
        }

        // GET: api/TargetSR
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TargetSR>>> GetAll()
        {
            return await _repository.GetAll();
        }

        // GET: api/TargetSR/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TargetSR>> FindAfterId(long id)
        {
            var record = await _repository.FindAfterId(id);

            if (record == null)
            {
                return NotFound($"cannot find record with id = {id}");
            }

            return record;
        }

        // PUT: api/TargetSR/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<ActionResult<TargetSR>> Update(long id, TargetSR record)
        {
            if (id != record.id20200908075619)
            {
                return BadRequest();
            }
            
            await _repository.Update(record);
            
            return record;
        }

        // POST: api/TargetSR
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<TargetSR> Post(TargetSR record)
        {
            await _repository.Insert(record);

            return record;
        }

        // DELETE: api/TargetSR/5
        [HttpDelete("{id}")]
        public async Task<long> Delete(long id)
        {
            
            await _repository.Delete( new TargetSR(){
                id20200908075619=id
            });


            return id;
        }

       
    }
}
