using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

using TestWEBAPI_DAL;
using TestWebAPI_BL;

namespace TestWEBAPI_DAL
{
    public partial class dbovwAssClients_Repository :IRepositoryView<dbovwAssClients>
    {
        private readonly DatabaseContext databaseContext;

        public dbovwAssClients_Repository (DatabaseContext databaseContext)
        {
            this.databaseContext = databaseContext;
        }
        public Task<dbovwAssClients[]> GetAll()
        {
            return databaseContext.dbovwAssClients.ToArrayAsync();
        }
        public Task<long> Count()
        {
            return databaseContext.dbovwAssClients.LongCountAsync();
        }

            }
        }

            