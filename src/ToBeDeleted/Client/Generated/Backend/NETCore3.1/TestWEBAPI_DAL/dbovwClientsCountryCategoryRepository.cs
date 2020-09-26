using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

using TestWEBAPI_DAL;
using TestWebAPI_BL;

namespace TestWEBAPI_DAL
{
    public partial class dbovwClientsCountryCategory_Repository :IRepositoryView<dbovwClientsCountryCategory>
    {
        private readonly DatabaseContext databaseContext;

        public dbovwClientsCountryCategory_Repository (DatabaseContext databaseContext)
        {
            this.databaseContext = databaseContext;
        }
        public Task<dbovwClientsCountryCategory[]> GetAll()
        {
            return databaseContext.dbovwClientsCountryCategory.ToArrayAsync();
        }
        public Task<long> Count()
        {
            return databaseContext.dbovwClientsCountryCategory.LongCountAsync();
        }

            }
        }

            