using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

using TestWEBAPI_DAL;
using TestWebAPI_BL;

namespace TestWEBAPI_DAL
{
    public partial class dboClientsCounties_Repository :IRepository<dboClientsCounties,Int64>
    {
        private readonly DatabaseContext databaseContext;

        public dboClientsCounties_Repository (DatabaseContext databaseContext)
        {
            this.databaseContext = databaseContext;
        }
        public Task<dboClientsCounties[]> GetAll()
        {
            return databaseContext.dboClientsCounties.ToArrayAsync();
        }
        public Task<long> Count()
        {
            return databaseContext.dboClientsCounties.LongCountAsync();
        }
        public Task<dboClientsCounties> FindAfterId(Int64 id)
        {
            var data = databaseContext.dboClientsCounties.FirstOrDefaultAsync(it => it.idclientscounties == id);
            return data;
        }
        public Task<dboClientsCounties> FindSingle(Func<dboClientsCounties ,bool> f)
        {
            var data = databaseContext.dboClientsCounties.FirstOrDefaultAsync(it=>f(it));
            return data;
        }
        public Task<dboClientsCounties[]> FindMultiple(Func<dboClientsCounties, bool> f)
        {
            var data = databaseContext.dboClientsCounties.Where(it=>f(it));
            return data.ToArrayAsync();
        }
        public async Task<dboClientsCounties> Insert(dboClientsCounties p)
        {
            databaseContext.dboClientsCounties.Add(p);
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<dboClientsCounties> Update(dboClientsCounties p)
        {
            var original = await FindAfterId(p.idclientscounties);
            if(original == null)
            {
                throw new ArgumentException($"cannot found dboClientsCounties  with id = {p.idclientscounties} ", nameof(p.idclientscounties));
            }
            original.CopyPropertiesFrom(other: p, withID: true);                        
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<dboClientsCounties> Delete(dboClientsCounties p)
        {
            var original = await FindAfterId(p.idclientscounties);
            databaseContext.dboClientsCounties.Remove(original);
            await databaseContext.SaveChangesAsync();
            return p;
        }
       
    }
}
