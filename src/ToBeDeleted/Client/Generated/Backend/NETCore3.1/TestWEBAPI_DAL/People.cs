﻿using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using TestWebAPI_BL;

namespace TestWEBAPI_DAL
{
    public partial class DatabaseContext
    {
        public async Task<People[]> GetHierarchicalPeople()
        {
            var managers = await this.dboAssVA.Where(it => it.idmanager == null).ToArrayAsync();
            var ret = new List<People>(managers.Length);

            foreach (var item in managers)
            {
                var p = new People();
                p.Manager = item;
                p.Manager.idmanager = 0;
                var next = await FindTeam(p);
                p.Team = next;
                item.MyDepth = 0;
                if (next.Length > 0)
                    item.MyDepth = next.First().Manager.MyDepth + 1;
                ret.Add(p);
            }
            // add fake
            //var fake = new People();
            //fake.Manager = new dboAssVA()
            //{
            //    idassva = 0,
            //    idmanager = 0,
            //    nameassva = "DO NOT DISPLAY",
            //    shortnameassva = "DO NOT DISPLAY"

            //};
            //fake.Team = ret.ToArray();

            //return new[] { fake };
            return ret.ToArray();

        }
        public async Task<RegionData[]> GetHierarchicalRegion()
        {
            var cnt = await this.dboRegion.ToArrayAsync();
            var ret = new List<RegionData>(cnt.Length);

            foreach (var item in cnt)
            {
                var c = new RegionData();
                c.Region = item;
                c.Counties = await this.dboCounty.Where(it => it.idRegion == item.idRegion).ToArrayAsync();
                ret.Add(c);

            }
            return ret.ToArray();

        }
        public static readonly int DiffCategory = 100;
        public static readonly int DiffClients= 10000;

        public async Task<ClientData[]> GetHierarchicalClients()
        {
            var cnt = await this.dboCategory.ToArrayAsync();
            var ret = new List<ClientData>(cnt.Length);

            foreach (var item in cnt)
            {
                var c = new ClientData();
                
                c.MainClient = new dboClients();
                c.MainClient.MyDepth = 1;
                c.MainClient.idclient = item.idcategory* DiffCategory;
                c.MainClient.iduclient = 0;
                c.MainClient.nameclient = item.namecategory;
                c.MainClient.shortnameclient = item.shortnamecategory;

                var idCLients = await this.dboClientsCategory
                        .Where(it => it.idcategory == item.idcategory)
                        .Select(it => it.idclient)
                        .ToArrayAsync();

                if (idCLients.Length > 0)
                {
                    var items = await this.dboClients.Where(it => idCLients.Contains(it.idclient)).ToArrayAsync();
                    c.SubClients = items.Select(it => new ClientData()
                    {
                        MainClient =new dboClients()
                        {
                            MyDepth=0,
                            idclient = it.idclient* DiffClients,
                            iduclient= item.idcategory * DiffCategory,
                            nameclient=it.nameclient,
                            shortnameclient=it.shortnameclient
                        }
                    }).ToArray();
                }
                ret.Add(c);


            }


            // add fake
            var fake = new ClientData();
            fake.MainClient = new dboClients()
            {
                MyDepth=2,
                idclient = 0,
                iduclient=0,
                nameclient = "DO NOT DISPLAY",
                shortnameclient = "DO NOT DISPLAY"

            };
            fake.SubClients = ret.ToArray();
            
            return new[] { fake };
            

        }


        private async Task<People[]> FindTeam(People manager)
        {
            var idManager = manager.Manager.idassva;
            var team = await dboAssVA.Where(it => it.idmanager == idManager).ToArrayAsync();
            if (team.Length == 0)
                return new People[0];
            var ret = new List<People>(team.Length);
            foreach (var item in team)
            {
                var p = new People();
                p.Manager = item;
                var next = await FindTeam(p);
                p.Team = next;
                item.MyDepth = 0;
                if (next.Length > 0)
                {
                    item.MyDepth = next.First().Manager.MyDepth + 1;
                }
                ret.Add(p);
            }
            return ret.ToArray();
        }
        public virtual DbSet<createKPI11> createKPI11 { get; set; }
        partial void OnModelCreatingPartial(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<createKPI11>(entity =>
            {
                entity.HasNoKey();
            });
            modelBuilder.Entity<dboClients>()
                .Ignore(it => it.iduclient)
                //.Ignore(it=>it.MyDepth)
                ;

            //modelBuilder.Entity<dboAssVA>()
            //    .Ignore(it => it.MyDepth)
            //    ;
        }
        
        public async Task<int> LevelManager(long id)
        {
            var i = 0;
            var ids = new long[] { id };
            
            while (true)
            {

                var childs = await this.dboAssVA
                    .Where(it => it.idmanager != null && ids.Contains(it.idmanager.Value))
                    .Select(it => it.idassva)
                    .ToArrayAsync();
                
                if ((childs?.Length ??0) == 0) break;

                ids = childs;
                i++;
            }
            return i;
        }
        public async Task<KPI11ShowData[]> GetDataKP11(DataKPI11 data, string userId)
        {
            var createKPI11 = await GetDataKP11Original(data,userId);
            var ret = createKPI11
                //.Where(it => it.yearToData == year)
                .Select(it => new KPI11ShowData()
                {
                    Value = it.ActualYTD,
                    PrevYearValue = it.PreviousValueActualYTD,
                    AssVA = this.dboAssVA.First(a => a.idassva == it.IDManager)
                }).ToArray();
            return ret;

        }
        public async Task<createKPI11[]> GetDataKP11Original(DataKPI11 data,string userId)
        {
            var yearStart = data.StartDate;
            var yearEnd = data.EndDate;
            var dates = await this.GetDatesStartEndKPI11();
            if (yearStart == null)
                yearStart = dates[0];

            if (yearEnd== null)
                yearEnd = dates[dates.Length-1];



            var Managers =string.Join(",", data.ManagerIds.SelectMany(it => it.Value).ToArray());
            string Clients = "";
            if ((data.Clients?.Count ?? 0) > 0) {
                var maxClients = data.Clients.Max(it => it.Key);
                
                switch (maxClients)
                {
                    case 2:
                        //top
                        var allClients = await dboClients.Select(it => it.idclient).ToArrayAsync();
                        Clients = string.Join(",", allClients);
                        break;
                    case 1:
                        {
                            var ids = data.Clients[maxClients].ToArray();
                            ids = ids.Select(it => it / DatabaseContext.DiffCategory).ToArray();
                            var dataClients = await this.
                                dboClientsCategory
                                .Where(it => ids.Contains(it.idcategory))
                                .Select(it => it.idclient)
                                .ToArrayAsync();
                            Clients = string.Join(',', ids);
                        }
                        break;
                    case 0:
                        {
                            var ids = data.Clients[maxClients].ToArray();
                            ids = ids.Select(it => it / DatabaseContext.DiffClients).ToArray();
                            Clients = string.Join(',', data.Clients[maxClients].ToArray());
                        }
                        break;
                    default:
                        throw new ArgumentException("no clients defined for " + maxClients);

                }
            }

            var createKPI11 = await this.createKPI11.FromSqlInterpolated(
                $"exec createKPI11 {userId},{yearStart.Year},{yearStart.Month},{yearEnd.Year},{yearEnd.Month}, {Managers}, {Clients}").ToArrayAsync();
            return createKPI11;
            //var idAssVA = new List<long>();
            //var managers = new Dictionary<long, List<long>>();
            //if (data.Managers?.Length > 0)
            //{
            //    foreach (var item in data.Managers)
            //    {
            //        var val = item.Value;
            //        if ((val?.Count ?? 0) == 0)
            //            continue;

            //        switch (item.Key)
            //        {
            //            case 0:
            //                {
            //                    idAssVA.AddRange(val);
            //                }
            //                break;
            //            case 1:
            //                {
            //                    //TODO: make it recursive
            //                    var ids = await dboAssVA
            //                        .Where(it => it.idmanager != null && val.Contains(it.idmanager.Value))
            //                        .Select(it => new { it.idassva, it.idmanager })
            //                        .ToArrayAsync();

            //                    foreach (var m in ids)
            //                    {
            //                        var idM = m.idassva;
            //                        if (!managers.ContainsKey(idM))
            //                        {
            //                            managers.Add(idM, new List<long>());
            //                        }
            //                        managers[idM].Add(m.idassva);
            //                        idAssVA.Add(m.idassva);
            //                    }

            //                }
            //                break;
            //            case 2:
            //                {
            //                    var idsM2 = await dboAssVA
            //                        .Where(it => it.idmanager != null && val.Contains(it.idmanager.Value))
            //                        .Select(it => new { it.idassva, it.idmanager })
            //                        .ToArrayAsync();

            //                    foreach (var m in idsM2)
            //                    {
            //                        var idM = m.idassva;
            //                        if (!managers.ContainsKey(idM))
            //                        {
            //                            managers.Add(idM, new List<long>());
            //                        }
            //                        var idAss = await dboAssVA
            //                            .Where(it => it.idmanager == idM)
            //                            .Select(it=>it.idassva)
            //                            .ToArrayAsync();
            //                        managers[idM].AddRange(idAss);
            //                        idAssVA.AddRange(idAss);
            //                    }


            //                }
            //                break;

            //            default:
            //                throw new ArgumentException($"cannot have key {item.Key} for clients dictionary");
            //        }
            //    }
            //}
            //idAssVA = idAssVA.Distinct().ToList();
            //var idAssVAClientsCounties = await dboAssVAClientsCounties
            //    .Where(it => idAssVA.Contains(it.idassva))
            //    .Select(it =>new { it.idassva,  it.idassvaclientscounties })
            //    .ToArrayAsync()
            //    ;

            //var idass = idAssVAClientsCounties.Select(it => it.idassva).Distinct().ToArray();
            //var idassvaclientscounties= idAssVAClientsCounties.Select(it => it.idassvaclientscounties).Distinct().ToArray(); 


            //var values = await dboACTPL
            //        .Where(it => idassvaclientscounties.Contains(it.idassvaclientscounties))
            //        .Select(it => new { it.idassvaclientscounties, it.actual })
            //        .ToArrayAsync();
            ////TODO: actual

            //var ret = new List<KPI11ShowData>();
            //foreach(var item in managers)
            //{
            //    var arrIDAssVA = item.Value.ToArray();
            //    KPI11ShowData retItem = new KPI11ShowData();
            //    retItem.AssVA = await dboAssVA.FirstOrDefaultAsync(it => it.idassva == item.Key);
            //    var idAssVAClientsCountiesItem = idAssVAClientsCounties
            //            .Where(it => arrIDAssVA.Contains( it.idassva  ))
            //            .Select(it=>it.idassvaclientscounties)
            //            .ToArray();
            //    retItem.Value = values
            //        .Where(it => idAssVAClientsCountiesItem.Contains(it.idassvaclientscounties))
            //        .Select(it=>it.actual)
            //        .Sum();
            //    ret.Add(retItem);
            //    //retItem.Value = values.Where(it=>it.idassvaclientscounties == item.id)
            //}
            //return ret.ToArray();
        }
        public virtual DbSet<DateYTD> DateYTD { get; set; }
        public async Task<DateYTD[]> GetDatesStartEndKPI11()
        {
            //potential problem if end is not same year
            var ytdEnd = await DateYTD
                .FromSqlRaw("select max(Year) as [Year] , max(Month) as [Month] , max(Year) * 100 +max(Month) as ID   from ACTPL")
                .FirstOrDefaultAsync();

            var ytdStart = await DateYTD
                .FromSqlRaw("select min(Year) as [Year] , min(Month) as [Month] , min(Year) * 100 +min(Month) as ID   from ACTPL")
                .FirstOrDefaultAsync();

            var ret = new List<DateYTD>();
            ret.Add(ytdStart);
            while(ytdEnd.Year != ytdStart.Year || ytdEnd.Month != ytdStart.Month)
            {
                ytdStart += 1;
                ret.Add(ytdStart);
            }
            return ret.ToArray();
        }
    }
}