using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

using TestWEBAPI_DAL;
using TestWebAPI_BL;

namespace TestWEBAPI_DAL
{
    public partial class dboAssVA_Repository :IRepository<dboAssVA,Int64>
    {
        private readonly DatabaseContext databaseContext;

        public dboAssVA_Repository (DatabaseContext databaseContext)
        {
            this.databaseContext = databaseContext;
        }
        public Task<dboAssVA[]> GetAll()
        {
            return databaseContext.dboAssVA.ToArrayAsync();
        }
        public Task<long> Count()
        {
            return databaseContext.dboAssVA.LongCountAsync();
        }
        public Task<dboAssVA> FindAfterId(Int64 id)
        {
            var data = databaseContext.dboAssVA.FirstOrDefaultAsync(it => it.idassva == id);
            return data;
        }
        public Task<dboAssVA> FindSingle(Func<dboAssVA ,bool> f)
        {
            var data = databaseContext.dboAssVA.FirstOrDefaultAsync(it=>f(it));
            return data;
        }
        public Task<dboAssVA[]> FindMultiple(Func<dboAssVA, bool> f)
        {
            var data = databaseContext.dboAssVA.Where(it=>f(it));
            return data.ToArrayAsync();
        }
        public async Task<dboAssVA> Insert(dboAssVA p)
        {
            databaseContext.dboAssVA.Add(p);
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<dboAssVA> Update(dboAssVA p)
        {
            var original = await FindAfterId(p.idassva);
            if(original == null)
            {
                throw new ArgumentException($"cannot found dboAssVA  with id = {p.idassva} ", nameof(p.idassva));
            }
            original.CopyPropertiesFrom(other: p, withID: true);                        
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<dboAssVA> Delete(dboAssVA p)
        {
            var original = await FindAfterId(p.idassva);
            databaseContext.dboAssVA.Remove(original);
            await databaseContext.SaveChangesAsync();
            return p;
        }
       
    }
}
