
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
    public class REST_dbovwAssManagerController : ControllerBase
    {
        private readonly IRepositoryView<dbovwAssManager> _repository;

        public REST_dbovwAssManagerController(IRepositoryView<dbovwAssManager> repository)
        {
            _repository = repository;
        }

        // GET: api/dbovwAssManager
        [HttpGet]
        public async Task<ActionResult<IEnumerable<dbovwAssManager>>> GetAll()
        {
            return await _repository.GetAll();
        }

                }
            }
            