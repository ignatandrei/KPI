using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TestWEBAPI_DAL;


namespace TestWebAPI
{
    
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class DataKPI11Controller : ControllerBase
    {
        static Dictionary<string, DataKPI11> data = new Dictionary<string, DataKPI11>();
        [HttpGet]
        public DataKPI11 GetActualFiltersForUser(string userId)
        {
            if (!data.ContainsKey(userId))
                data.Add(userId, new DataKPI11());

            return data[userId];
            
        }
        [HttpGet]
        public DataKPI11 CleanFiltersForUser(string userId)
        {
            if (data.ContainsKey(userId))
                data.Remove(userId);

            return GetActualFiltersForUser(userId);
        }
        [HttpGet("{key}/{value}")]
        public KVP GetKVP(int key,int value)
        {
            return new KVP()
            {
                Key = key,
                Value = value
            };
        }

        //[HttpPost("{userId}")]
        //public DataKPI11 AddRegion([FromRoute]string userId, [FromBody] KVP region)
        //{
        //    var d = GetActualFiltersForUser(userId);
        //    if (!d.RegionIds.ContainsKey(region.Key))
        //    {
        //        d.RegionIds.Add(region.Key, new HashSet<long>());
        //    }
        //    var l = d.RegionIds[region.Key];
        //    if (region.Value > 0)
        //    {
        //        l.Add(region.Value);
        //    }
        //    else
        //    {
        //        l.Remove(-region.Value);
        //    }
        //    return d;            
        //}

        [HttpPost("{userId}")]
        public async Task< DataKPI11> AddClients([FromRoute] string userId, [FromBody] KVP client, [FromServices] DatabaseContext dc)
        {
            switch (client.Key)
            {
                
                case 0:
                    {
                        var c = await dc.dboClients.FirstOrDefaultAsync(it => it.idclient == client.Value / DatabaseContext.DiffClients);
                        if (c == null)
                        {
                            throw new ArgumentException($"client {client.Value} not found at level {client.Key}");

                        }
                    }
                    break;
                case 1:
                    {
                        var c = await dc.dboCategory.FirstOrDefaultAsync(it => it.idcategory == client.Value/ DatabaseContext.DiffCategory);
                        if (c == null)
                        {
                            throw new ArgumentException($"client {client.Value} not found at level {client.Key}");

                        }
                    }
                    break;
                case 2:
                    {
                        if (client.Value != 0)
                            throw new ArgumentException($"client {client.Value} not found at level {client.Key}");
                    }
                    break;
                default:
                    throw new ArgumentException($"does not exists level {client.Key}");
            }

            var d = GetActualFiltersForUser(userId);
            if (!d.Clients.ContainsKey(client.Key))
            {
                d.Clients.Add(client.Key, new HashSet<long>());
            }
            var l = d.Clients[client.Key];
            switch (client.Value)
            {
                case int i when i == 0:

                    if (l.Contains(i))
                    {
                        l.Remove(-client.Value);
                        if (l.Count == 0)
                            d.ManagerIds.Remove(client.Key);
                    }
                    else
                    {
                        l.Add(client.Value);
                    }
                    break;

                case int i when i > 0:
                    l.Add(client.Value);
                    break;

                case int i when i < 0:
                    l.Remove(-client.Value);
                    if (l.Count == 0)
                        d.ManagerIds.Remove(client.Key);
                    break;

            }

            return d;
        }
        [HttpPost("{userId}")]
        public async Task<DataKPI11> AddManager([FromRoute] string userId, [FromBody] KVP manager, [FromServices] DatabaseContext dc)
        {
            var d = GetActualFiltersForUser(userId);
            if (!d.ManagerIds.ContainsKey(manager.Key))
            {
                d.ManagerIds.Add(manager.Key, new HashSet<long>());
            }
            var l = d.ManagerIds[manager.Key];
            var m = await dc.LevelManager(manager.Value);
            if(m != manager.Key)
            {
                throw new ArgumentException($"manager {manager.Value} has level {m}, not {manager.Key}");
            }
            switch (manager.Value)
            {
                case int i when i == 0:
                    
                    if (l.Contains(i))
                    {
                        l.Remove(-manager.Value);
                        if (l.Count == 0)
                            d.ManagerIds.Remove(manager.Key);
                    }
                    else
                    {
                        l.Add(manager.Value);
                    }
                    break;

                case int i when i > 0:
                    l.Add(manager.Value);
                    break;

                case int i when i < 0:
                    l.Remove(-manager.Value);
                    if (l.Count == 0)
                        d.ManagerIds.Remove(manager.Key);
                    break;

            }
            return d;
        }
        [HttpGet("{userId}")]
        public Task<KPI11ShowData[]> GetData([FromRoute] string userId, [FromServices]DatabaseContext dc)
        {
            var d = this.GetActualFiltersForUser(userId);
            return dc.GetDataKP11(d,userId);
        }
    }
}
