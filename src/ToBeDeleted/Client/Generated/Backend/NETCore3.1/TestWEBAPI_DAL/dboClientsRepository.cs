using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

using TestWEBAPI_DAL;
using TestWebAPI_BL;

namespace TestWEBAPI_DAL
{
    public partial class dboClients_Repository :IRepository<dboClients,Int64>
    {
        private readonly DatabaseContext databaseContext;

        public dboClients_Repository (DatabaseContext databaseContext)
        {
            this.databaseContext = databaseContext;
        }
        public Task<dboClients[]> GetAll()
        {
            return databaseContext.dboClients.ToArrayAsync();
        }
        public Task<long> Count()
        {
            return databaseContext.dboClients.LongCountAsync();
        }
        public Task<dboClients> FindAfterId(Int64 id)
        {
            var data = databaseContext.dboClients.FirstOrDefaultAsync(it => it.idclient == id);
            return data;
        }
        public Task<dboClients> FindSingle(Func<dboClients ,bool> f)
        {
            var data = databaseContext.dboClients.FirstOrDefaultAsync(it=>f(it));
            return data;
        }
        public Task<dboClients[]> FindMultiple(Func<dboClients, bool> f)
        {
            var data = databaseContext.dboClients.Where(it=>f(it));
            return data.ToArrayAsync();
        }
        public async Task<dboClients> Insert(dboClients p)
        {
            databaseContext.dboClients.Add(p);
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<dboClients> Update(dboClients p)
        {
            var original = await FindAfterId(p.idclient);
            if(original == null)
            {
                throw new ArgumentException($"cannot found dboClients  with id = {p.idclient} ", nameof(p.idclient));
            }
            original.CopyPropertiesFrom(other: p, withID: true);                        
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<dboClients> Delete(dboClients p)
        {
            var original = await FindAfterId(p.idclient);
            databaseContext.dboClients.Remove(original);
            await databaseContext.SaveChangesAsync();
            return p;
        }
       
    }
}
