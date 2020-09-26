using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

using TestWEBAPI_DAL;
using TestWebAPI_BL;

namespace TestWEBAPI_DAL
{
    public partial class dbovwAssManager_Repository :IRepositoryView<dbovwAssManager>
    {
        private readonly DatabaseContext databaseContext;

        public dbovwAssManager_Repository (DatabaseContext databaseContext)
        {
            this.databaseContext = databaseContext;
        }
        public Task<dbovwAssManager[]> GetAll()
        {
            return databaseContext.dbovwAssManager.ToArrayAsync();
        }
        public Task<long> Count()
        {
            return databaseContext.dbovwAssManager.LongCountAsync();
        }

            }
        }

            