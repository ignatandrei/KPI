using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

using TestWEBAPI_DAL;
using TestWebAPI_BL;

namespace TestWEBAPI_DAL
{
    public partial class Client_Repository : IRepository<Client,long>
    {
        private readonly DatabaseContext databaseContext;

        public Client_Repository (DatabaseContext databaseContext)
        {
            this.databaseContext = databaseContext;
        }
        public Task<Client[]> GetAll()
        {
            return databaseContext.Client.ToArrayAsync();
        }
        public Task<Client> FindAfterId(long id)
        {
            var data = databaseContext.Client.FirstOrDefaultAsync(it => it.id20200908075419 == id);
            return data;
        }
        public Task<Client> FindSingle(Func<Client ,bool> f)
        {
            var data = databaseContext.Client.FirstOrDefaultAsync(it=>f(it));
            return data;
        }
        public Task<Client[]> FindMultiple(Func<Client, bool> f)
        {
            var data = databaseContext.Client.Where(it=>f(it));
            return data.ToArrayAsync();
        }
        public async Task<Client> Insert(Client p)
        {
            databaseContext.Client.Add(p);
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<Client> Update(Client p)
        {
            var original = await FindAfterId(p.id20200908075419);
            if(original == null)
            {
                throw new ArgumentException("cannot found Client  with id = {p.id20200908075419} ", nameof(p.id20200908075419));
            }
            original.CopyPropertiesFrom(other: p, withID: true);                        
            await databaseContext.SaveChangesAsync();
            return p;
        }
        public async Task<Client> Delete(Client p)
        {
            var original = await FindAfterId(p.id20200908075419);
            databaseContext.Client.Remove(original);
            await databaseContext.SaveChangesAsync();
            return p;
        }

    }
}
