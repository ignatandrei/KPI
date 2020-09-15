using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

using TestWEBAPI_DAL;
using TestWebAPI_BL;

namespace TestWEBAPI_DAL
{
    public partial class NNDvsUniv_Repository : IRepository<NNDvsUniv,long>
    {
        private readonly DatabaseContext databaseContext;

        public NNDvsUniv_Repository (DatabaseContext databaseContext)
        {
            this.databaseContext = databaseContext;
        }
        public Task<NNDvsUniv[]> GetAll()
        {
            return databaseContext.NNDvsUniv.ToArrayAsync();
        }
        public Task<NNDvsUniv> FindAfterId(long id)
        {
            var data = databaseContext.NNDvsUniv.FirstOrDefaultAsync(it => it.id20200915075727 == id);
            return data;
        }
        public Task<NNDvsUniv> FindSingle(Func<NNDvsUniv ,bool> f)
        {
            var data = databaseContext.NNDvsUniv.FirstOrDefaultAsync(it=>f(it));
            return data;
        }
        public Task<NNDvsUniv[]> FindMultiple(Func<NNDvsUniv, bool> f)
        {
            var data = databaseContext.NNDvsUniv.Where(it=>f(it));
            return data.ToArrayAsync();
        }
        public async Task<NNDvsUniv> Insert(NNDvsUniv p)
        {
            databaseContext.NNDvsUniv.Add(p);
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<NNDvsUniv> Update(NNDvsUniv p)
        {
            var original = await FindAfterId(p.id20200915075727);
            if(original == null)
            {
                throw new ArgumentException("cannot found NNDvsUniv  with id = {p.id20200915075727} ", nameof(p.id20200915075727));
            }
            original.CopyPropertiesFrom(other: p, withID: true);                        
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<NNDvsUniv> Delete(NNDvsUniv p)
        {
            var original = await FindAfterId(p.id20200915075727);
            databaseContext.NNDvsUniv.Remove(original);
            await databaseContext.SaveChangesAsync();
            return p;
        }

    }
}
