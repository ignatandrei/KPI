using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

using TestWEBAPI_DAL;
using TestWebAPI_BL;

namespace TestWEBAPI_DAL
{
    public partial class dbovwClientsBase_Repository :IRepositoryView<dbovwClientsBase>
    {
        private readonly DatabaseContext databaseContext;

        public dbovwClientsBase_Repository (DatabaseContext databaseContext)
        {
            this.databaseContext = databaseContext;
        }
        public Task<dbovwClientsBase[]> GetAll()
        {
            return databaseContext.dbovwClientsBase.ToArrayAsync();
        }
        public Task<long> Count()
        {
            return databaseContext.dbovwClientsBase.LongCountAsync();
        }

            }
        }

            