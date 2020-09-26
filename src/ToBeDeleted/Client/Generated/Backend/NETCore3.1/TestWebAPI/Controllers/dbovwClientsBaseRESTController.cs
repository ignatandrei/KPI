
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
    public class REST_dbovwClientsBaseController : ControllerBase
    {
        private readonly IRepositoryView<dbovwClientsBase> _repository;

        public REST_dbovwClientsBaseController(IRepositoryView<dbovwClientsBase> repository)
        {
            _repository = repository;
        }

        // GET: api/dbovwClientsBase
        [HttpGet]
        public async Task<ActionResult<IEnumerable<dbovwClientsBase>>> GetAll()
        {
            return await _repository.GetAll();
        }

                }
            }
            