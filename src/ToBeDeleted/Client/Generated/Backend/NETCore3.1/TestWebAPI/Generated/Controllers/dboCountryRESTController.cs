
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
    public class REST_dboCountryController : ControllerBase
    {
        private readonly IRepository<dboCountry,Int32> _repository;

        public REST_dboCountryController(IRepository<dboCountry,Int32> repository)
        {
            _repository = repository;
        }

        // GET: api/dboCountry
        [HttpGet]
        public async Task<ActionResult<IEnumerable<dboCountry>>> GetAll()
        {
            return await _repository.GetAll();
        }
            
        // GET: api/dboCountry/5
        [HttpGet("{id}")]
        public async Task<ActionResult<dboCountry>> FindAfterId(Int32 id)
        {
            var record = await _repository.FindAfterId(id);

            if (record == null)
            {
                return NotFound($"cannot find record with id = {id}");
            }

            return record;
        }

        // PUT: api/dboCountry/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<ActionResult<dboCountry>> Update(Int32 id, dboCountry record)
        {
            if (id != record.idcountry)
            {
                return BadRequest();
            }
            
            await _repository.Update(record);
            
            return record;
        }

        // POST: api/dboCountry
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<dboCountry> Post(dboCountry record)
        {
            await _repository.Insert(record);

            return record;
        }

        // DELETE: api/dboCountry/5
        [HttpDelete("{id}")]
        public async Task<Int32> Delete(Int32 id)
        {
            
            await _repository.Delete( new dboCountry(){
                idcountry=id
            });


            return id;
        }

       
    }
}
