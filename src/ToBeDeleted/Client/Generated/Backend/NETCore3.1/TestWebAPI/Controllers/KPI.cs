using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TestWebAPI_BL;
using TestWEBAPI_DAL;

namespace TestWebAPI.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class KPI : ControllerBase
    {
        [HttpGet]
        public async Task< KPI_SR[]> SRValVindutaVsPlan([FromServices] IRepository<SRCkienti,long> clienti, [FromServices] IRepository<CifreAnuale ,long> ca )
        {
            var gen = new KPI_Generator(await clienti.GetAll(), await ca.GetAll());
            var ret = gen.SR_RealizatVsTarget();
            return ret;
        }
    }
}
