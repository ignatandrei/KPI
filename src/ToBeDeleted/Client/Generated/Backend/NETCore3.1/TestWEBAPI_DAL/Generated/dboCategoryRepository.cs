using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

using TestWEBAPI_DAL;
using TestWebAPI_BL;

namespace TestWEBAPI_DAL
{
    public partial class dboCategory_Repository :IRepository<dboCategory,Int32>
    {
        private readonly DatabaseContext databaseContext;

        public dboCategory_Repository (DatabaseContext databaseContext)
        {
            this.databaseContext = databaseContext;
        }
        public Task<dboCategory[]> GetAll()
        {
            return databaseContext.dboCategory.ToArrayAsync();
        }
        public Task<long> Count()
        {
            return databaseContext.dboCategory.LongCountAsync();
        }
        public Task<dboCategory> FindAfterId(Int32 id)
        {
            var data = databaseContext.dboCategory.FirstOrDefaultAsync(it => it.idcategory == id);
            return data;
        }
        public Task<dboCategory> FindSingle(Func<dboCategory ,bool> f)
        {
            var data = databaseContext.dboCategory.FirstOrDefaultAsync(it=>f(it));
            return data;
        }
        public Task<dboCategory[]> FindMultiple(Func<dboCategory, bool> f)
        {
            var data = databaseContext.dboCategory.Where(it=>f(it));
            return data.ToArrayAsync();
        }
        public async Task<dboCategory> Insert(dboCategory p)
        {
            databaseContext.dboCategory.Add(p);
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<dboCategory> Update(dboCategory p)
        {
            var original = await FindAfterId(p.idcategory);
            if(original == null)
            {
                throw new ArgumentException($"cannot found dboCategory  with id = {p.idcategory} ", nameof(p.idcategory));
            }
            original.CopyPropertiesFrom(other: p, withID: true);                        
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<dboCategory> Delete(dboCategory p)
        {
            var original = await FindAfterId(p.idcategory);
            databaseContext.dboCategory.Remove(original);
            await databaseContext.SaveChangesAsync();
            return p;
        }
       
    }
}
