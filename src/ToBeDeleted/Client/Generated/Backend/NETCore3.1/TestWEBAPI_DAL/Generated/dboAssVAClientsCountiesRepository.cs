using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

using TestWEBAPI_DAL;
using TestWebAPI_BL;

namespace TestWEBAPI_DAL
{
    public partial class dboAssVAClientsCounties_Repository :IRepository<dboAssVAClientsCounties,Int64>
    {
        private readonly DatabaseContext databaseContext;

        public dboAssVAClientsCounties_Repository (DatabaseContext databaseContext)
        {
            this.databaseContext = databaseContext;
        }
        public Task<dboAssVAClientsCounties[]> GetAll()
        {
            return databaseContext.dboAssVAClientsCounties.ToArrayAsync();
        }
        public Task<long> Count()
        {
            return databaseContext.dboAssVAClientsCounties.LongCountAsync();
        }
        public Task<dboAssVAClientsCounties> FindAfterId(Int64 id)
        {
            var data = databaseContext.dboAssVAClientsCounties.FirstOrDefaultAsync(it => it.idassvaclientscounties == id);
            return data;
        }
        public Task<dboAssVAClientsCounties> FindSingle(Func<dboAssVAClientsCounties ,bool> f)
        {
            var data = databaseContext.dboAssVAClientsCounties.FirstOrDefaultAsync(it=>f(it));
            return data;
        }
        public Task<dboAssVAClientsCounties[]> FindMultiple(Func<dboAssVAClientsCounties, bool> f)
        {
            var data = databaseContext.dboAssVAClientsCounties.Where(it=>f(it));
            return data.ToArrayAsync();
        }
        public async Task<dboAssVAClientsCounties> Insert(dboAssVAClientsCounties p)
        {
            databaseContext.dboAssVAClientsCounties.Add(p);
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<dboAssVAClientsCounties> Update(dboAssVAClientsCounties p)
        {
            var original = await FindAfterId(p.idassvaclientscounties);
            if(original == null)
            {
                throw new ArgumentException($"cannot found dboAssVAClientsCounties  with id = {p.idassvaclientscounties} ", nameof(p.idassvaclientscounties));
            }
            original.CopyPropertiesFrom(other: p, withID: true);                        
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<dboAssVAClientsCounties> Delete(dboAssVAClientsCounties p)
        {
            var original = await FindAfterId(p.idassvaclientscounties);
            databaseContext.dboAssVAClientsCounties.Remove(original);
            await databaseContext.SaveChangesAsync();
            return p;
        }
       
    }
}
