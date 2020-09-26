
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
    public class dbovwCountyController : ControllerBase
    {
        private readonly  IRepositoryView<dbovwCounty> _repository;

        public dbovwCountyController(IRepositoryView<dbovwCounty> repository)
        {
            _repository = repository;
        }
        [HttpGet]
        public async Task<long> Count()
        {
            return await _repository.Count();
        }
        // GET: api/dbovwCounty
        [HttpGet]
        public async Task<ActionResult<IEnumerable<dbovwCounty>>> GetAll()
        {
            return await _repository.GetAll();
        }

            }
        }
            