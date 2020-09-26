
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
    public class REST_dboKPI11Controller : ControllerBase
    {
        private readonly IRepositoryView<dboKPI11> _repository;

        public REST_dboKPI11Controller(IRepositoryView<dboKPI11> repository)
        {
            _repository = repository;
        }

        // GET: api/dboKPI11
        [HttpGet]
        public async Task<ActionResult<IEnumerable<dboKPI11>>> GetAll()
        {
            return await _repository.GetAll();
        }

                }
            }
            