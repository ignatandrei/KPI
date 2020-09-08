using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

using TestWEBAPI_DAL;
using TestWebAPI_BL;

namespace TestWEBAPI_DAL
{
    public partial class SRCkienti_Repository : IRepository<SRCkienti,long>
    {
        private readonly DatabaseContext databaseContext;

        public SRCkienti_Repository (DatabaseContext databaseContext)
        {
            this.databaseContext = databaseContext;
        }
        public Task<SRCkienti[]> GetAll()
        {
            return databaseContext.SRCkienti.ToArrayAsync();
        }
        public Task<SRCkienti> FindAfterId(long id)
        {
            var data = databaseContext.SRCkienti.FirstOrDefaultAsync(it => it.id20200908075449 == id);
            return data;
        }
        public Task<SRCkienti> FindSingle(Func<SRCkienti ,bool> f)
        {
            var data = databaseContext.SRCkienti.FirstOrDefaultAsync(it=>f(it));
            return data;
        }
        public Task<SRCkienti[]> FindMultiple(Func<SRCkienti, bool> f)
        {
            var data = databaseContext.SRCkienti.Where(it=>f(it));
            return data.ToArrayAsync();
        }
        public async Task<SRCkienti> Insert(SRCkienti p)
        {
            databaseContext.SRCkienti.Add(p);
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<SRCkienti> Update(SRCkienti p)
        {
            var original = await FindAfterId(p.id20200908075449);
            if(original == null)
            {
                throw new ArgumentException("cannot found SRCkienti  with id = {p.id20200908075449} ", nameof(p.id20200908075449));
            }
            original.CopyPropertiesFrom(other: p, withID: true);                        
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<SRCkienti> Delete(SRCkienti p)
        {
            var original = await FindAfterId(p.id20200908075449);
            databaseContext.SRCkienti.Remove(original);
            await databaseContext.SaveChangesAsync();
            return p;
        }

    }
}
