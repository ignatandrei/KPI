
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
    public class SalesRepController : ControllerBase
    {
        private readonly IRepository<SalesRep,long> _repository;

        public SalesRepController(IRepository<SalesRep,long> repository)
        {
            _repository = repository;
        }

        // GET: api/SalesRep
        [HttpGet]
        public async Task<ActionResult<IEnumerable<SalesRep>>> GetAll()
        {
            return await _repository.GetAll();
        }

        // GET: api/SalesRep/5
        [HttpGet("{id}")]
        public async Task<ActionResult<SalesRep>> Get(long id)
        {
            var record = await _repository.FindAfterId(id);

            if (record == null)
            {
                return NotFound($"cannot find record with id = {id}");
            }

            return record;
        }

        // PUT: api/SalesRep/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<ActionResult<SalesRep>> Put(long id, SalesRep record)
        {
            if (id != record.id20200908075449)
            {
                return BadRequest();
            }
            
             await _repository.Update(record);
            
            return record;
        }

        // POST: api/SalesRep
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<SalesRep> Insert(SalesRep record)
        {
            await _repository.Insert(record);

            return record;
        }

        // DELETE: api/SalesRep/5
        [HttpDelete("{id}")]
        public async Task<long> Delete(long id)
        {
            
            await _repository.Delete( new SalesRep(){
                id20200908075449=id
            });


            return id;
        }

       
    }
}
