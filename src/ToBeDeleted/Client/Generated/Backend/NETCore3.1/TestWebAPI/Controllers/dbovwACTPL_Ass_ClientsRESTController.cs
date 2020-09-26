
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
    public class REST_dbovwACTPL_Ass_ClientsController : ControllerBase
    {
        private readonly IRepositoryView<dbovwACTPL_Ass_Clients> _repository;

        public REST_dbovwACTPL_Ass_ClientsController(IRepositoryView<dbovwACTPL_Ass_Clients> repository)
        {
            _repository = repository;
        }

        // GET: api/dbovwACTPL_Ass_Clients
        [HttpGet]
        public async Task<ActionResult<IEnumerable<dbovwACTPL_Ass_Clients>>> GetAll()
        {
            return await _repository.GetAll();
        }

                }
            }
            