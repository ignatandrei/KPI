using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

using TestWEBAPI_DAL;
using TestWebAPI_BL;

namespace TestWEBAPI_DAL
{
    public partial class dboClientsCategory_Repository :IRepository<dboClientsCategory,Int64>
    {
        private readonly DatabaseContext databaseContext;

        public dboClientsCategory_Repository (DatabaseContext databaseContext)
        {
            this.databaseContext = databaseContext;
        }
        public Task<dboClientsCategory[]> GetAll()
        {
            return databaseContext.dboClientsCategory.ToArrayAsync();
        }
        public Task<long> Count()
        {
            return databaseContext.dboClientsCategory.LongCountAsync();
        }
        public Task<dboClientsCategory> FindAfterId(Int64 id)
        {
            var data = databaseContext.dboClientsCategory.FirstOrDefaultAsync(it => it.id == id);
            return data;
        }
        public Task<dboClientsCategory> FindSingle(Func<dboClientsCategory ,bool> f)
        {
            var data = databaseContext.dboClientsCategory.FirstOrDefaultAsync(it=>f(it));
            return data;
        }
        public Task<dboClientsCategory[]> FindMultiple(Func<dboClientsCategory, bool> f)
        {
            var data = databaseContext.dboClientsCategory.Where(it=>f(it));
            return data.ToArrayAsync();
        }
        public async Task<dboClientsCategory> Insert(dboClientsCategory p)
        {
            databaseContext.dboClientsCategory.Add(p);
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<dboClientsCategory> Update(dboClientsCategory p)
        {
            var original = await FindAfterId(p.id);
            if(original == null)
            {
                throw new ArgumentException($"cannot found dboClientsCategory  with id = {p.id} ", nameof(p.id));
            }
            original.CopyPropertiesFrom(other: p, withID: true);                        
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<dboClientsCategory> Delete(dboClientsCategory p)
        {
            var original = await FindAfterId(p.id);
            databaseContext.dboClientsCategory.Remove(original);
            await databaseContext.SaveChangesAsync();
            return p;
        }
       
    }
}
