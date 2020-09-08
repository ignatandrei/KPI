using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

using TestWEBAPI_DAL;
using TestWebAPI_BL;

namespace TestWEBAPI_DAL
{
    public partial class CifreAnuale_Repository : IRepository<CifreAnuale,long>
    {
        private readonly DatabaseContext databaseContext;

        public CifreAnuale_Repository (DatabaseContext databaseContext)
        {
            this.databaseContext = databaseContext;
        }
        public Task<CifreAnuale[]> GetAll()
        {
            return databaseContext.CifreAnuale.ToArrayAsync();
        }
        public Task<CifreAnuale> FindAfterId(long id)
        {
            var data = databaseContext.CifreAnuale.FirstOrDefaultAsync(it => it.id20200908075419 == id);
            return data;
        }
        public Task<CifreAnuale> FindSingle(Func<CifreAnuale ,bool> f)
        {
            var data = databaseContext.CifreAnuale.FirstOrDefaultAsync(it=>f(it));
            return data;
        }
        public Task<CifreAnuale[]> FindMultiple(Func<CifreAnuale, bool> f)
        {
            var data = databaseContext.CifreAnuale.Where(it=>f(it));
            return data.ToArrayAsync();
        }
        public async Task<CifreAnuale> Insert(CifreAnuale p)
        {
            databaseContext.CifreAnuale.Add(p);
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<CifreAnuale> Update(CifreAnuale p)
        {
            var original = await FindAfterId(p.id20200908075419);
            if(original == null)
            {
                throw new ArgumentException("cannot found CifreAnuale  with id = {p.id20200908075419} ", nameof(p.id20200908075419));
            }
            original.CopyPropertiesFrom(other: p, withID: true);                        
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<CifreAnuale> Delete(CifreAnuale p)
        {
            var original = await FindAfterId(p.id20200908075419);
            databaseContext.CifreAnuale.Remove(original);
            await databaseContext.SaveChangesAsync();
            return p;
        }

    }
}
