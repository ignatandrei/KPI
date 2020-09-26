
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
    public class REST_dbovwAssClientsController : ControllerBase
    {
        private readonly IRepositoryView<dbovwAssClients> _repository;

        public REST_dbovwAssClientsController(IRepositoryView<dbovwAssClients> repository)
        {
            _repository = repository;
        }

        // GET: api/dbovwAssClients
        [HttpGet]
        public async Task<ActionResult<IEnumerable<dbovwAssClients>>> GetAll()
        {
            return await _repository.GetAll();
        }

                }
            }
            