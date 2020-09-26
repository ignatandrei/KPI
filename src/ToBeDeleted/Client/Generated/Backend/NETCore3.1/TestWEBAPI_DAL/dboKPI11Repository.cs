using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

using TestWEBAPI_DAL;
using TestWebAPI_BL;

namespace TestWEBAPI_DAL
{
    public partial class dboKPI11_Repository :IRepositoryView<dboKPI11>
    {
        private readonly DatabaseContext databaseContext;

        public dboKPI11_Repository (DatabaseContext databaseContext)
        {
            this.databaseContext = databaseContext;
        }
        public Task<dboKPI11[]> GetAll()
        {
            return databaseContext.dboKPI11.ToArrayAsync();
        }
        public Task<long> Count()
        {
            return databaseContext.dboKPI11.LongCountAsync();
        }

            }
        }

            