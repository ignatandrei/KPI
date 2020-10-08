using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

using TestWEBAPI_DAL;
using TestWebAPI_BL;

namespace TestWEBAPI_DAL
{
    public partial class dbotest_Repository :IRepositoryView<dbotest>
    {
        private readonly DatabaseContext databaseContext;

        public dbotest_Repository (DatabaseContext databaseContext)
        {
            this.databaseContext = databaseContext;
        }
        public Task<dbotest[]> GetAll()
        {
            return databaseContext.dbotest.ToArrayAsync();
        }
        public Task<long> Count()
        {
            return databaseContext.dbotest.LongCountAsync();
        }

            }
        }

            