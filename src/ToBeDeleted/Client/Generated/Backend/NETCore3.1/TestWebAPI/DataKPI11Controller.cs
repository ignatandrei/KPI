using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Runtime.InteropServices.WindowsRuntime;

namespace TestWebAPI
{
    public class KVP
    {
        public int Key { get; set; }
        public int Value { get; set; }
    }
    public class DataKPI11
    {
        public DataKPI11()
        {
            RegionIds = new Dictionary<int, List<int>>();
            CategoryIds = new Dictionary<int, List<int>>();
            ManagerIds = new Dictionary<int, List<int>>();
        }
        public Dictionary<int, List<int>> RegionIds;
        public Dictionary<int, List<int>> CategoryIds;
        public Dictionary<int, List<int>> ManagerIds;

        public KeyValuePair<int, List<int>>[] Regions
        {
            get
            {
                return RegionIds.Select(it => it).ToArray();
            }
        }
        public KeyValuePair<int, List<int>>[] Categories
        {
            get
            {
                return CategoryIds.Select(it => it).ToArray();
            }
        }
        public KeyValuePair<int, List<int>>[] Managers
        {
            get
            {
                return ManagerIds.Select(it => it).ToArray();
            }
        }


    }

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

        [HttpPost("{userId}")]
        public DataKPI11 AddRegion([FromRoute]string userId, [FromBody] KVP region)
        {
            var d = GetActualData(userId);
            if (!d.RegionIds.ContainsKey(region.Key))
            {
                d.RegionIds.Add(region.Key, new List<int>());
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
                d.CategoryIds.Add(category.Key, new List<int>());
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
            if (!d.CategoryIds.ContainsKey(manager.Key))
            {
                d.CategoryIds.Add(manager.Key, new List<int>());
            }
            var l = d.CategoryIds[manager.Key];
            if (manager.Value > 0)
            {
                l.Add(manager.Value);
            }
            else
            {
                l.Remove(-manager.Value);
            }
            return d;
        }
    }
}
