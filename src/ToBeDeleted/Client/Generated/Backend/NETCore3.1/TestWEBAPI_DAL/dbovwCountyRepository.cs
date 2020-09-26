using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

using TestWEBAPI_DAL;
using TestWebAPI_BL;

namespace TestWEBAPI_DAL
{
    public partial class dbovwCounty_Repository :IRepositoryView<dbovwCounty>
    {
        private readonly DatabaseContext databaseContext;

        public dbovwCounty_Repository (DatabaseContext databaseContext)
        {
            this.databaseContext = databaseContext;
        }
        public Task<dbovwCounty[]> GetAll()
        {
            return databaseContext.dbovwCounty.ToArrayAsync();
        }
        public Task<long> Count()
        {
            return databaseContext.dbovwCounty.LongCountAsync();
        }

            }
        }

            