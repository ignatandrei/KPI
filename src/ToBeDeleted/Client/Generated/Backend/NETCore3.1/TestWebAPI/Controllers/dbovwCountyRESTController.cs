
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
    public class REST_dbovwCountyController : ControllerBase
    {
        private readonly IRepositoryView<dbovwCounty> _repository;

        public REST_dbovwCountyController(IRepositoryView<dbovwCounty> repository)
        {
            _repository = repository;
        }

        // GET: api/dbovwCounty
        [HttpGet]
        public async Task<ActionResult<IEnumerable<dbovwCounty>>> GetAll()
        {
            return await _repository.GetAll();
        }

                }
            }
            