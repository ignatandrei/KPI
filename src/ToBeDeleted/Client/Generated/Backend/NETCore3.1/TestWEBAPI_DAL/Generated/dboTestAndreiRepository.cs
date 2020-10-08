using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

using TestWEBAPI_DAL;
using TestWebAPI_BL;

namespace TestWEBAPI_DAL
{
    public partial class dboTestAndrei_Repository :IRepository<dboTestAndrei,Int32>
    {
        private readonly DatabaseContext databaseContext;

        public dboTestAndrei_Repository (DatabaseContext databaseContext)
        {
            this.databaseContext = databaseContext;
        }
        public Task<dboTestAndrei[]> GetAll()
        {
            return databaseContext.dboTestAndrei.ToArrayAsync();
        }
        public Task<long> Count()
        {
            return databaseContext.dboTestAndrei.LongCountAsync();
        }
        public Task<dboTestAndrei> FindAfterId(Int32 id)
        {
            var data = databaseContext.dboTestAndrei.FirstOrDefaultAsync(it => it.id == id);
            return data;
        }
        public Task<dboTestAndrei> FindSingle(Func<dboTestAndrei ,bool> f)
        {
            var data = databaseContext.dboTestAndrei.FirstOrDefaultAsync(it=>f(it));
            return data;
        }
        public Task<dboTestAndrei[]> FindMultiple(Func<dboTestAndrei, bool> f)
        {
            var data = databaseContext.dboTestAndrei.Where(it=>f(it));
            return data.ToArrayAsync();
        }
        public async Task<dboTestAndrei> Insert(dboTestAndrei p)
        {
            databaseContext.dboTestAndrei.Add(p);
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<dboTestAndrei> Update(dboTestAndrei p)
        {
            var original = await FindAfterId(p.id);
            if(original == null)
            {
                throw new ArgumentException($"cannot found dboTestAndrei  with id = {p.id} ", nameof(p.id));
            }
            original.CopyPropertiesFrom(other: p, withID: true);                        
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<dboTestAndrei> Delete(dboTestAndrei p)
        {
            var original = await FindAfterId(p.id);
            databaseContext.dboTestAndrei.Remove(original);
            await databaseContext.SaveChangesAsync();
            return p;
        }
       
    }
}
