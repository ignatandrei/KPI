
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
    public class REST_dboTestAndreiController : ControllerBase
    {
        private readonly IRepository<dboTestAndrei,Int32> _repository;

        public REST_dboTestAndreiController(IRepository<dboTestAndrei,Int32> repository)
        {
            _repository = repository;
        }

        // GET: api/dboTestAndrei
        [HttpGet]
        public async Task<ActionResult<IEnumerable<dboTestAndrei>>> GetAll()
        {
            return await _repository.GetAll();
        }
            
        // GET: api/dboTestAndrei/5
        [HttpGet("{id}")]
        public async Task<ActionResult<dboTestAndrei>> FindAfterId(Int32 id)
        {
            var record = await _repository.FindAfterId(id);

            if (record == null)
            {
                return NotFound($"cannot find record with id = {id}");
            }

            return record;
        }

        // PUT: api/dboTestAndrei/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<ActionResult<dboTestAndrei>> Update(Int32 id, dboTestAndrei record)
        {
            if (id != record.id)
            {
                return BadRequest();
            }
            
            await _repository.Update(record);
            
            return record;
        }

        // POST: api/dboTestAndrei
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<dboTestAndrei> Post(dboTestAndrei record)
        {
            await _repository.Insert(record);

            return record;
        }

        // DELETE: api/dboTestAndrei/5
        [HttpDelete("{id}")]
        public async Task<Int32> Delete(Int32 id)
        {
            
            await _repository.Delete( new dboTestAndrei(){
                id=id
            });


            return id;
        }

       
    }
}
