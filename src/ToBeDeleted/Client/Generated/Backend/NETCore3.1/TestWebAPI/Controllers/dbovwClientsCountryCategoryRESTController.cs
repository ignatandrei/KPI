
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
    public class REST_dbovwClientsCountryCategoryController : ControllerBase
    {
        private readonly IRepositoryView<dbovwClientsCountryCategory> _repository;

        public REST_dbovwClientsCountryCategoryController(IRepositoryView<dbovwClientsCountryCategory> repository)
        {
            _repository = repository;
        }

        // GET: api/dbovwClientsCountryCategory
        [HttpGet]
        public async Task<ActionResult<IEnumerable<dbovwClientsCountryCategory>>> GetAll()
        {
            return await _repository.GetAll();
        }

                }
            }
            