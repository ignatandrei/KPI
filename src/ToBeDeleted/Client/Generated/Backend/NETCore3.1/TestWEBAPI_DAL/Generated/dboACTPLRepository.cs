using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

using TestWEBAPI_DAL;
using TestWebAPI_BL;

namespace TestWEBAPI_DAL
{
    public partial class dboACTPL_Repository :IRepository<dboACTPL,Int64>
    {
        private readonly DatabaseContext databaseContext;

        public dboACTPL_Repository (DatabaseContext databaseContext)
        {
            this.databaseContext = databaseContext;
        }
        public Task<dboACTPL[]> GetAll()
        {
            return databaseContext.dboACTPL.ToArrayAsync();
        }
        public Task<long> Count()
        {
            return databaseContext.dboACTPL.LongCountAsync();
        }
        public Task<dboACTPL> FindAfterId(Int64 id)
        {
            var data = databaseContext.dboACTPL.FirstOrDefaultAsync(it => it.idactpl == id);
            return data;
        }
        public Task<dboACTPL> FindSingle(Func<dboACTPL ,bool> f)
        {
            var data = databaseContext.dboACTPL.FirstOrDefaultAsync(it=>f(it));
            return data;
        }
        public Task<dboACTPL[]> FindMultiple(Func<dboACTPL, bool> f)
        {
            var data = databaseContext.dboACTPL.Where(it=>f(it));
            return data.ToArrayAsync();
        }
        public async Task<dboACTPL> Insert(dboACTPL p)
        {
            databaseContext.dboACTPL.Add(p);
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<dboACTPL> Update(dboACTPL p)
        {
            var original = await FindAfterId(p.idactpl);
            if(original == null)
            {
                throw new ArgumentException($"cannot found dboACTPL  with id = {p.idactpl} ", nameof(p.idactpl));
            }
            original.CopyPropertiesFrom(other: p, withID: true);                        
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<dboACTPL> Delete(dboACTPL p)
        {
            var original = await FindAfterId(p.idactpl);
            databaseContext.dboACTPL.Remove(original);
            await databaseContext.SaveChangesAsync();
            return p;
        }
       
    }
}
