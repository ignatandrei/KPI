using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

using TestWEBAPI_DAL;
using TestWebAPI_BL;

namespace TestWEBAPI_DAL
{
    public partial class dboCountry_Repository :IRepository<dboCountry,Int32>
    {
        private readonly DatabaseContext databaseContext;

        public dboCountry_Repository (DatabaseContext databaseContext)
        {
            this.databaseContext = databaseContext;
        }
        public Task<dboCountry[]> GetAll()
        {
            return databaseContext.dboCountry.ToArrayAsync();
        }
        public Task<long> Count()
        {
            return databaseContext.dboCountry.LongCountAsync();
        }
        public Task<dboCountry> FindAfterId(Int32 id)
        {
            var data = databaseContext.dboCountry.FirstOrDefaultAsync(it => it.idcountry == id);
            return data;
        }
        public Task<dboCountry> FindSingle(Func<dboCountry ,bool> f)
        {
            var data = databaseContext.dboCountry.FirstOrDefaultAsync(it=>f(it));
            return data;
        }
        public Task<dboCountry[]> FindMultiple(Func<dboCountry, bool> f)
        {
            var data = databaseContext.dboCountry.Where(it=>f(it));
            return data.ToArrayAsync();
        }
        public async Task<dboCountry> Insert(dboCountry p)
        {
            databaseContext.dboCountry.Add(p);
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<dboCountry> Update(dboCountry p)
        {
            var original = await FindAfterId(p.idcountry);
            if(original == null)
            {
                throw new ArgumentException($"cannot found dboCountry  with id = {p.idcountry} ", nameof(p.idcountry));
            }
            original.CopyPropertiesFrom(other: p, withID: true);                        
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<dboCountry> Delete(dboCountry p)
        {
            var original = await FindAfterId(p.idcountry);
            databaseContext.dboCountry.Remove(original);
            await databaseContext.SaveChangesAsync();
            return p;
        }
       
    }
}
