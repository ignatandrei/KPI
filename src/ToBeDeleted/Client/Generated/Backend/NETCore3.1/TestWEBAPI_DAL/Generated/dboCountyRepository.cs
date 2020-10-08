using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

using TestWEBAPI_DAL;
using TestWebAPI_BL;

namespace TestWEBAPI_DAL
{
    public partial class dboCounty_Repository :IRepository<dboCounty,Int64>
    {
        private readonly DatabaseContext databaseContext;

        public dboCounty_Repository (DatabaseContext databaseContext)
        {
            this.databaseContext = databaseContext;
        }
        public Task<dboCounty[]> GetAll()
        {
            return databaseContext.dboCounty.ToArrayAsync();
        }
        public Task<long> Count()
        {
            return databaseContext.dboCounty.LongCountAsync();
        }
        public Task<dboCounty> FindAfterId(Int64 id)
        {
            var data = databaseContext.dboCounty.FirstOrDefaultAsync(it => it.idcounty == id);
            return data;
        }
        public Task<dboCounty> FindSingle(Func<dboCounty ,bool> f)
        {
            var data = databaseContext.dboCounty.FirstOrDefaultAsync(it=>f(it));
            return data;
        }
        public Task<dboCounty[]> FindMultiple(Func<dboCounty, bool> f)
        {
            var data = databaseContext.dboCounty.Where(it=>f(it));
            return data.ToArrayAsync();
        }
        public async Task<dboCounty> Insert(dboCounty p)
        {
            databaseContext.dboCounty.Add(p);
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<dboCounty> Update(dboCounty p)
        {
            var original = await FindAfterId(p.idcounty);
            if(original == null)
            {
                throw new ArgumentException($"cannot found dboCounty  with id = {p.idcounty} ", nameof(p.idcounty));
            }
            original.CopyPropertiesFrom(other: p, withID: true);                        
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<dboCounty> Delete(dboCounty p)
        {
            var original = await FindAfterId(p.idcounty);
            databaseContext.dboCounty.Remove(original);
            await databaseContext.SaveChangesAsync();
            return p;
        }
       
    }
}
