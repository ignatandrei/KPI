
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
    public class REST_NNDvsUnivController : ControllerBase
    {
        private readonly IRepository<NNDvsUniv,long> _repository;

        public REST_NNDvsUnivController(IRepository<NNDvsUniv,long> repository)
        {
            _repository = repository;
        }

        // GET: api/NNDvsUniv
        [HttpGet]
        public async Task<ActionResult<IEnumerable<NNDvsUniv>>> GetAll()
        {
            return await _repository.GetAll();
        }

        // GET: api/NNDvsUniv/5
        [HttpGet("{id}")]
        public async Task<ActionResult<NNDvsUniv>> FindAfterId(long id)
        {
            var record = await _repository.FindAfterId(id);

            if (record == null)
            {
                return NotFound($"cannot find record with id = {id}");
            }

            return record;
        }

        // PUT: api/NNDvsUniv/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<ActionResult<NNDvsUniv>> Update(long id, NNDvsUniv record)
        {
            if (id != record.id20200915075727)
            {
                return BadRequest();
            }
            
            await _repository.Update(record);
            
            return record;
        }

        // POST: api/NNDvsUniv
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<NNDvsUniv> Post(NNDvsUniv record)
        {
            await _repository.Insert(record);

            return record;
        }

        // DELETE: api/NNDvsUniv/5
        [HttpDelete("{id}")]
        public async Task<long> Delete(long id)
        {
            
            await _repository.Delete( new NNDvsUniv(){
                id20200915075727=id
            });


            return id;
        }

       
    }
}
