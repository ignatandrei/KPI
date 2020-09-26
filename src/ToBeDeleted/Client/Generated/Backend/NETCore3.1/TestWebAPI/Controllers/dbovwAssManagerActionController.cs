
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
    public class dbovwAssManagerController : ControllerBase
    {
        private readonly  IRepositoryView<dbovwAssManager> _repository;

        public dbovwAssManagerController(IRepositoryView<dbovwAssManager> repository)
        {
            _repository = repository;
        }
        [HttpGet]
        public async Task<long> Count()
        {
            return await _repository.Count();
        }
        // GET: api/dbovwAssManager
        [HttpGet]
        public async Task<ActionResult<IEnumerable<dbovwAssManager>>> GetAll()
        {
            return await _repository.GetAll();
        }

            }
        }
            