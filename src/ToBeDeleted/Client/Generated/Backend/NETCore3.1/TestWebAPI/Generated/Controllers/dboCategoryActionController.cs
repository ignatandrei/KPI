
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
    public class dboCategoryController : ControllerBase
    {
        private readonly  IRepository<dboCategory,Int32> _repository;

        public dboCategoryController(IRepository<dboCategory,Int32> repository)
        {
            _repository = repository;
        }
        [HttpGet]
        public async Task<long> Count()
        {
            return await _repository.Count();
        }
        // GET: api/dboCategory
        [HttpGet]
        public async Task<ActionResult<IEnumerable<dboCategory>>> GetAll()
        {
            return await _repository.GetAll();
        }
        // GET: api/dboCategory/5
        [HttpGet("{id}")]
        public async Task<ActionResult<dboCategory>> Get(Int32 id)
        {
            var record = await _repository.FindAfterId(id);

            if (record == null)
            {
                return NotFound($"cannot find record with id = {id}");
            }

            return record;
        }

        // PUT: api/dboCategory/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<ActionResult<dboCategory>> Put(Int32 id, dboCategory record)
        {
            if (id != record.idcategory)
            {
                return BadRequest();
            }
            
             await _repository.Update(record);
            
            return record;
        }

        // POST: api/dboCategory
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<dboCategory> Insert(dboCategory record)
        {
            await _repository.Insert(record);

            return record;
        }

        // DELETE: api/dboCategory/5
        [HttpDelete("{id}")]
        public async Task<Int32> Delete(Int32 id)
        {
            
            await _repository.Delete( new dboCategory(){
                idcategory=id
            });


            return id;
        }

       
    }
}
