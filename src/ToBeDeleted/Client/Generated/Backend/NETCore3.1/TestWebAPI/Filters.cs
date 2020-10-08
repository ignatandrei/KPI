using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TestWebAPI_BL;
using TestWEBAPI_DAL;

namespace TestWebAPI
{
    [Route("api/[controller]/[action]")]
    [ApiController]

    public class FiltersController: ControllerBase
    {
        private readonly DatabaseContext dc;

        public FiltersController(DatabaseContext dc)
        {
            this.dc = dc;
        }
        public async Task<People[]> ManagerFilters()
        {
            return await dc.GetHierarchical();
        }
    }
}
