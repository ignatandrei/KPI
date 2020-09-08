using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

using TestWEBAPI_DAL;
using TestWebAPI_BL;

namespace TestWEBAPI_DAL
{
    public partial class SalesRep_Repository : IRepository<SalesRep,long>
    {
        private readonly DatabaseContext databaseContext;

        public SalesRep_Repository (DatabaseContext databaseContext)
        {
            this.databaseContext = databaseContext;
        }
        public Task<SalesRep[]> GetAll()
        {
            return databaseContext.SalesRep.ToArrayAsync();
        }
        public Task<SalesRep> FindAfterId(long id)
        {
            var data = databaseContext.SalesRep.FirstOrDefaultAsync(it => it.id20200908075449 == id);
            return data;
        }
        public Task<SalesRep> FindSingle(Func<SalesRep ,bool> f)
        {
            var data = databaseContext.SalesRep.FirstOrDefaultAsync(it=>f(it));
            return data;
        }
        public Task<SalesRep[]> FindMultiple(Func<SalesRep, bool> f)
        {
            var data = databaseContext.SalesRep.Where(it=>f(it));
            return data.ToArrayAsync();
        }
        public async Task<SalesRep> Insert(SalesRep p)
        {
            databaseContext.SalesRep.Add(p);
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<SalesRep> Update(SalesRep p)
        {
            var original = await FindAfterId(p.id20200908075449);
            if(original == null)
            {
                throw new ArgumentException("cannot found SalesRep  with id = {p.id20200908075449} ", nameof(p.id20200908075449));
            }
            original.CopyPropertiesFrom(other: p, withID: true);                        
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<SalesRep> Delete(SalesRep p)
        {
            var original = await FindAfterId(p.id20200908075449);
            databaseContext.SalesRep.Remove(original);
            await databaseContext.SaveChangesAsync();
            return p;
        }

    }
}
