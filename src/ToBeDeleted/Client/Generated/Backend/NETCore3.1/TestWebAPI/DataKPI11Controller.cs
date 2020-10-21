using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Runtime.InteropServices.WindowsRuntime;
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
        public DataKPI11 GetActualData(string userId)
        {
            if (!data.ContainsKey(userId))
                data.Add(userId, new DataKPI11());

            return data[userId];
            
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
        [HttpPost("{userId}")]
        public DataKPI11 AddRegion([FromRoute]string userId, [FromBody] KVP region)
        {
            var d = GetActualData(userId);
            if (!d.RegionIds.ContainsKey(region.Key))
            {
                d.RegionIds.Add(region.Key, new List<long>());
            }
            var l = d.RegionIds[region.Key];
            if (region.Value > 0)
            {
                l.Add(region.Value);
            }
            else
            {
                l.Remove(-region.Value);
            }
            return d;            
        }

        [HttpPost("{userId}")]
        public DataKPI11 AddCategory([FromRoute] string userId, [FromBody] KVP category)
        {
            
            var d = GetActualData(userId);
            if (!d.CategoryIds.ContainsKey(category.Key))
            {
                d.CategoryIds.Add(category.Key, new List<long>());
            }
            var l = d.CategoryIds[category.Key];
            if (category.Value > 0)
            {
                l.Add(category.Value);
            }
            else
            {
                l.Remove(-category.Value);
            }
            return d;
        }
        [HttpPost("{userId}")]
        public DataKPI11 AddManager([FromRoute] string userId, [FromBody] KVP manager)
        {
            var d = GetActualData(userId);
            if (!d.ManagerIds.ContainsKey(manager.Key))
            {
                d.ManagerIds.Add(manager.Key, new List<long>());
            }
            var l = d.ManagerIds[manager.Key];
            if (manager.Value > 0)
            {
                l.Add(manager.Value);
            }
            else
            {
                l.Remove(-manager.Value);
                if (l.Count == 0)
                    d.ManagerIds.Remove(manager.Key);
            }
            return d;
        }
        [HttpGet("{userId}")]
        public Task<KPI11ShowData[]> GetData([FromRoute] string userId, [FromServices]DatabaseContext dc)
        {
            var d = GetActualData(userId);
            return dc.GetDataKP11(d);
        }
    }
}
