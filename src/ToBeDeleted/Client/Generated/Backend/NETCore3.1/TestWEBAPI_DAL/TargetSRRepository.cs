using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

using TestWEBAPI_DAL;
using TestWebAPI_BL;

namespace TestWEBAPI_DAL
{
    public partial class TargetSR_Repository : IRepository<TargetSR,long>
    {
        private readonly DatabaseContext databaseContext;

        public TargetSR_Repository (DatabaseContext databaseContext)
        {
            this.databaseContext = databaseContext;
        }
        public Task<TargetSR[]> GetAll()
        {
            return databaseContext.TargetSR.ToArrayAsync();
        }
        public Task<TargetSR> FindAfterId(long id)
        {
            var data = databaseContext.TargetSR.FirstOrDefaultAsync(it => it.id20200908075619 == id);
            return data;
        }
        public Task<TargetSR> FindSingle(Func<TargetSR ,bool> f)
        {
            var data = databaseContext.TargetSR.FirstOrDefaultAsync(it=>f(it));
            return data;
        }
        public Task<TargetSR[]> FindMultiple(Func<TargetSR, bool> f)
        {
            var data = databaseContext.TargetSR.Where(it=>f(it));
            return data.ToArrayAsync();
        }
        public async Task<TargetSR> Insert(TargetSR p)
        {
            databaseContext.TargetSR.Add(p);
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<TargetSR> Update(TargetSR p)
        {
            var original = await FindAfterId(p.id20200908075619);
            if(original == null)
            {
                throw new ArgumentException("cannot found TargetSR  with id = {p.id20200908075619} ", nameof(p.id20200908075619));
            }
            original.CopyPropertiesFrom(other: p, withID: true);                        
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<TargetSR> Delete(TargetSR p)
        {
            var original = await FindAfterId(p.id20200908075619);
            databaseContext.TargetSR.Remove(original);
            await databaseContext.SaveChangesAsync();
            return p;
        }

    }
}
