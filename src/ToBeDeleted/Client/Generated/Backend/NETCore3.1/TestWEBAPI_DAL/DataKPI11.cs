using System.Collections.Generic;
using System.Linq;

namespace TestWEBAPI_DAL
{
   public class DataKPI11
        {
            public DataKPI11()
            {
                RegionIds = new Dictionary<int, List<long>>();
                CategoryIds = new Dictionary<int, List<long>>();
                ManagerIds = new Dictionary<int, List<long>>();
            }
            public Dictionary<int, List<long>> RegionIds;
            public Dictionary<int, List<long>> CategoryIds;
            public Dictionary<int, List<long>> ManagerIds;

            public KeyValuePair<int, List<long>>[] Regions
            {
                get
                {
                    return RegionIds.Select(it => it).ToArray();
                }
            }
            public KeyValuePair<int, List<long>>[] Categories
            {
                get
                {
                    return CategoryIds.Select(it => it).ToArray();
                }
            }
            public KeyValuePair<int, List<long>>[] Managers
            {
                get
                {
                    return ManagerIds.Select(it => it).ToArray();
                }
            }

        }
   
}
