﻿using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
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
                var next = await FindTeam(p);
                p.Team = next;
                ret.Add(p);
            }
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


        public async Task<ClientData[]> GetHierarchicalClients()
        {
            var cnt = await this.dboCategory.ToArrayAsync();
            var ret = new List<ClientData>(cnt.Length);

            foreach (var item in cnt)
            {
                var c = new ClientData();
                c.Channel = item;
                var idCLients = await this.dboClientsCategory
                        .Where(it => it.idcategory == item.idcategory)
                        .Select(it => it.idclient)
                        .ToArrayAsync();

                if (idCLients.Length > 0)
                {
                    c.Clients = await this.dboClients.Where(it => idCLients.Contains(it.idclient)).ToArrayAsync();
                }
                ret.Add(c);

            }
            return ret.ToArray();

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
                ret.Add(p);
            }
            return ret.ToArray();
        }
        public async Task<KPI11ShowData[]> GetDataKP11(DataKPI11 data)
        {
            //var idClients = new List<long>();
            //if (data.Categories?.Length > 0)
            //{
            //    foreach (var item in data.Categories)
            //    {
            //        switch (item.Key)
            //        {
            //            case 0://category
            //                {
            //                    var val = item.Value?.ToArray();
            //                    if (val?.Length > 0)
            //                    {
            //                        var clients = await dboClientsCategory
            //                           .Where(it => val.Contains(it.idcategory))
            //                            .Select(it => it.idclient)
            //                            .ToArrayAsync();

            //                        if (clients.Length > 0)
            //                            idClients.AddRange(clients);
            //                    }
            //                }
            //                break;
            //            case 1: //clients
            //                {
            //                    var val = item.Value?.ToArray();
            //                    if (val?.Length > 0)
            //                    {

            //                        idClients.AddRange(val);
            //                    }
            //                }
            //                break;
            //            default:
            //                throw new ArgumentException($"cannot have key {item.Key} for clients dictionary");
            //        }
            //    }
            //}

            var idAssVA = new List<long>();
            if (data.Managers?.Length > 0)
            {
                foreach (var item in data.Managers)
                {
                    var val = item.Value;
                    if ((val?.Count ?? 0) == 0)
                        continue;

                    switch (item.Key)
                    {
                        case 0:
                            {
                                idAssVA.AddRange(val);
                            }
                            break;
                        case 1:
                            {
                                //TODO: make it recursive
                                var ids = await dboAssVA
                                    .Where(it => it.idmanager != null && val.Contains(it.idmanager.Value))
                                    .Select(it => it.idassva)
                                    .ToArrayAsync();

                                idAssVA.AddRange(ids);
                            }
                            break;
                        case 2:
                            {
                                var idsM1 = await dboAssVA
                                    .Where(it => it.idmanager != null && val.Contains(it.idmanager.Value))
                                    .Select(it => it.idassva)
                                    .ToArrayAsync();

                                var ids = await dboAssVA
                                    .Where(it => it.idmanager != null && idsM1.Contains(it.idmanager.Value))
                                    .Select(it => it.idassva)
                                    .ToArrayAsync();

                                idAssVA.AddRange(ids);
                                idAssVA.AddRange(ids);
                            }
                            break;
                    
                        default:
                            throw new ArgumentException($"cannot have key {item.Key} for clients dictionary");
                    }
                }
            }
            idAssVA = idAssVA.Distinct().ToList();
            var idAssVAClientsCounties = await dboAssVAClientsCounties
                .Where(it => idAssVA.Contains(it.idassva))
                .Select(it =>new { it.idassva,  it.idassvaclientscounties })
                .ToArrayAsync()
                ;

            var idass = idAssVAClientsCounties.Select(it => it.idassva).Distinct().ToArray();
            var idassvaclientscounties= idAssVAClientsCounties.Select(it => it.idassvaclientscounties).Distinct().ToArray(); 

            var managers = await dboAssVA
                .Where(it => idass.Contains(it.idassva))
                .Select(it=> new { it.idassva, it.idmanager})
                .ToArrayAsync();

            var values = await dboACTPL
                    .Where(it => idassvaclientscounties.Contains(it.idassvaclientscounties))
                    .Select(it => new { it.idassvaclientscounties, it.actual })
                    .ToArrayAsync();
            //TODO: actual

            var ret = new List<KPI11ShowData>();
            foreach(var item in managers)
            {
                KPI11ShowData retItem = new KPI11ShowData();
                retItem.AssVA = await dboAssVA.FirstOrDefaultAsync(it => it.idassva == item.idassva);
                var idAssVAClientsCountiesItem = idAssVAClientsCounties
                        .Where(it => it.idassva == item.idassva)
                        .Select(it=>it.idassvaclientscounties)
                        .ToArray();
                retItem.Value = values
                    .Where(it => idAssVAClientsCountiesItem.Contains(it.idassvaclientscounties))
                    .Select(it=>it.actual)
                    .Sum();
                ret.Add(retItem);
                //retItem.Value = values.Where(it=>it.idassvaclientscounties == item.id)
            }
            return ret.ToArray();
        }
    }
}