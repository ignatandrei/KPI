using System.Collections.Generic;
using System.Linq;
using TestWebAPI_BL;

namespace TestWEBAPI_DAL
{
   public class DataKPI11
        {
            public DataKPI11()
            {
                RegionIds = new Dictionary<int, HashSet<long>>();
                CategoryIds = new Dictionary<int, HashSet<long>>();
                ManagerIds = new Dictionary<int, HashSet<long>>();
            }
            public Dictionary<int, HashSet<long>> RegionIds;
            public Dictionary<int, HashSet<long>> CategoryIds;
            public Dictionary<int, HashSet<long>> ManagerIds;

            public KeyValuePair<int, HashSet<long>>[] Regions
            {
                get
                {
                    return RegionIds.Select(it => it).ToArray();
                }
            }
            public KeyValuePair<int, HashSet<long>>[] Categories
            {
                get
                {
                    return CategoryIds.Select(it => it).ToArray();
                }
            }
            public KeyValuePair<int, HashSet<long>>[] Managers
            {
                get
                {
                    return ManagerIds.Select(it => it).ToArray();
                }
            }

        }
   

    public class KPI11ShowData
    {
        public dboAssVA AssVA { get; set; }
        public decimal Value { get; set; }
    }
}
