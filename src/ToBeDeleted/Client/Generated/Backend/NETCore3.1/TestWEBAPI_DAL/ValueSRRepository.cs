using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

using TestWEBAPI_DAL;
using TestWebAPI_BL;

namespace TestWEBAPI_DAL
{
    public partial class ValueSR_Repository : IRepository<ValueSR,long>
    {
        private readonly DatabaseContext databaseContext;

        public ValueSR_Repository (DatabaseContext databaseContext)
        {
            this.databaseContext = databaseContext;
        }
        public Task<ValueSR[]> GetAll()
        {
            return databaseContext.ValueSR.ToArrayAsync();
        }
        public Task<ValueSR> FindAfterId(long id)
        {
            var data = databaseContext.ValueSR.FirstOrDefaultAsync(it => it.id20200908075619 == id);
            return data;
        }
        public Task<ValueSR> FindSingle(Func<ValueSR ,bool> f)
        {
            var data = databaseContext.ValueSR.FirstOrDefaultAsync(it=>f(it));
            return data;
        }
        public Task<ValueSR[]> FindMultiple(Func<ValueSR, bool> f)
        {
            var data = databaseContext.ValueSR.Where(it=>f(it));
            return data.ToArrayAsync();
        }
        public async Task<ValueSR> Insert(ValueSR p)
        {
            databaseContext.ValueSR.Add(p);
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<ValueSR> Update(ValueSR p)
        {
            var original = await FindAfterId(p.id20200908075619);
            if(original == null)
            {
                throw new ArgumentException("cannot found ValueSR  with id = {p.id20200908075619} ", nameof(p.id20200908075619));
            }
            original.CopyPropertiesFrom(other: p, withID: true);                        
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<ValueSR> Delete(ValueSR p)
        {
            var original = await FindAfterId(p.id20200908075619);
            databaseContext.ValueSR.Remove(original);
            await databaseContext.SaveChangesAsync();
            return p;
        }

    }
}
