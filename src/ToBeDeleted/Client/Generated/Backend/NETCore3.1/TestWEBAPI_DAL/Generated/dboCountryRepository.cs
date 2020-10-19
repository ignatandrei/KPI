using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

using TestWEBAPI_DAL;
using TestWebAPI_BL;

namespace TestWEBAPI_DAL
{
    public partial class dboRegion_Repository :IRepository<dboRegion,Int32>
    {
        private readonly DatabaseContext databaseContext;

        public dboRegion_Repository (DatabaseContext databaseContext)
        {
            this.databaseContext = databaseContext;
        }
        public Task<dboRegion[]> GetAll()
        {
            return databaseContext.dboRegion.ToArrayAsync();
        }
        public Task<long> Count()
        {
            return databaseContext.dboRegion.LongCountAsync();
        }
        public Task<dboRegion> FindAfterId(Int32 id)
        {
            var data = databaseContext.dboRegion.FirstOrDefaultAsync(it => it.idRegion == id);
            return data;
        }
        public Task<dboRegion> FindSingle(Func<dboRegion ,bool> f)
        {
            var data = databaseContext.dboRegion.FirstOrDefaultAsync(it=>f(it));
            return data;
        }
        public Task<dboRegion[]> FindMultiple(Func<dboRegion, bool> f)
        {
            var data = databaseContext.dboRegion.Where(it=>f(it));
            return data.ToArrayAsync();
        }
        public async Task<dboRegion> Insert(dboRegion p)
        {
            databaseContext.dboRegion.Add(p);
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<dboRegion> Update(dboRegion p)
        {
            var original = await FindAfterId(p.idRegion);
            if(original == null)
            {
                throw new ArgumentException($"cannot found dboRegion  with id = {p.idRegion} ", nameof(p.idRegion));
            }
            original.CopyPropertiesFrom(other: p, withID: true);                        
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<dboRegion> Delete(dboRegion p)
        {
            var original = await FindAfterId(p.idRegion);
            databaseContext.dboRegion.Remove(original);
            await databaseContext.SaveChangesAsync();
            return p;
        }
       
    }
}
