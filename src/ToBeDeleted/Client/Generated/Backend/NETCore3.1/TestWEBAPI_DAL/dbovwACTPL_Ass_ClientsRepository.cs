using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

using TestWEBAPI_DAL;
using TestWebAPI_BL;

namespace TestWEBAPI_DAL
{
    public partial class dbovwACTPL_Ass_Clients_Repository :IRepositoryView<dbovwACTPL_Ass_Clients>
    {
        private readonly DatabaseContext databaseContext;

        public dbovwACTPL_Ass_Clients_Repository (DatabaseContext databaseContext)
        {
            this.databaseContext = databaseContext;
        }
        public Task<dbovwACTPL_Ass_Clients[]> GetAll()
        {
            return databaseContext.dbovwACTPL_Ass_Clients.ToArrayAsync();
        }
        public Task<long> Count()
        {
            return databaseContext.dbovwACTPL_Ass_Clients.LongCountAsync();
        }

            }
        }

            