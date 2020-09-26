
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
    public class REST_dboACTPLController : ControllerBase
    {
        private readonly IRepository<dboACTPL,Int64> _repository;

        public REST_dboACTPLController(IRepository<dboACTPL,Int64> repository)
        {
            _repository = repository;
        }

        // GET: api/dboACTPL
        [HttpGet]
        public async Task<ActionResult<IEnumerable<dboACTPL>>> GetAll()
        {
            return await _repository.GetAll();
        }
            
        // GET: api/dboACTPL/5
        [HttpGet("{id}")]
        public async Task<ActionResult<dboACTPL>> FindAfterId(Int64 id)
        {
            var record = await _repository.FindAfterId(id);

            if (record == null)
            {
                return NotFound($"cannot find record with id = {id}");
            }

            return record;
        }

        // PUT: api/dboACTPL/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<ActionResult<dboACTPL>> Update(Int64 id, dboACTPL record)
        {
            if (id != record.idactpl)
            {
                return BadRequest();
            }
            
            await _repository.Update(record);
            
            return record;
        }

        // POST: api/dboACTPL
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<dboACTPL> Post(dboACTPL record)
        {
            await _repository.Insert(record);

            return record;
        }

        // DELETE: api/dboACTPL/5
        [HttpDelete("{id}")]
        public async Task<Int64> Delete(Int64 id)
        {
            
            await _repository.Delete( new dboACTPL(){
                idactpl=id
            });


            return id;
        }

       
    }
}
