﻿using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using TestWebAPI_BL;

namespace TestWEBAPI_DAL
{
   public class DataKPI11
        {
            public DataKPI11()
            {
                //RegionIds = new Dictionary<int, HashSet<long>>();
                Clients = new Dictionary<int, HashSet<long>>();
                ManagerIds = new Dictionary<int, HashSet<long>>();
            }
            //public Dictionary<int, HashSet<long>> RegionIds;
            public Dictionary<int, HashSet<long>> Clients;
            public Dictionary<int, HashSet<long>> ManagerIds;
            public DateYTD StartDate { get; set; }
            public DateYTD EndDate { get; set; }
        //public KeyValuePair<int, HashSet<long>>[] Regions
        //{
        //    get
        //    {
        //        return RegionIds.Select(it => it).ToArray();
        //    }
        //}
        public KeyValuePair<int, HashSet<long>>[] ClientsData
            {
                get
                {
                    return Clients.Select(it => it).ToArray();
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
   
    public class createKPI11
    {
        
        public long IDManager { get; set; }

        public int yearToData { get; set; }
        public decimal? PlanYTD { get; set; }
        public decimal? ActualYTD { get; set; }

        public decimal? PreviousValueActualYTD { get; set; }
        public decimal? PreviousValuePlanYTD { get; set; }
    }
    public class KPI11ShowData
    {
        public dboAssVA AssVA { get; set; }
        public decimal? Value { get; set; }
        public decimal? PrevYearValue { get; set; }
    }
}
