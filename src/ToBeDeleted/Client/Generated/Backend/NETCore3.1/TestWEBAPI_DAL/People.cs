using Microsoft.EntityFrameworkCore;
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
    }
}
