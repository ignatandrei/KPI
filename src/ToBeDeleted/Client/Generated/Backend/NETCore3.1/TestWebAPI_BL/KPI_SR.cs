using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TestWebAPI_BL
{
    public class KPI_SR
    {
        public string Name { get; set; }
        public decimal VindutVsPlan
        {
            get
            {
                if (ValoarePlanTotala == 0)
                    return -1;
                return ValoareTotalaVinduta / ValoarePlanTotala;
            }
        }
        public decimal ValoareTotalaVinduta { get; set; }
        public decimal ValoarePlanTotala { get; set; }


    }
    public class KPI_Generator
    {
        private readonly SRCkienti[] srclienti;
        private readonly CifreAnuale[] caList;

        public KPI_Generator(SRCkienti[] srclienti, CifreAnuale[] cas)
        {
            this.srclienti = srclienti;
            this.caList = cas;
        }
        public KPI_SR[] SR_RealizatVsTarget()
        {
            var ret = new Dictionary<string,KPI_SR>();
            foreach (var sr in srclienti)
            {
                var nameSR = sr.sr;
                var nameClient = sr.client;
                var ca = caList.First(it => it.name == nameClient);
                var valoarevinduta = ca.valoarevinduta;
                var plan = ca.plan;
                if (!ret.ContainsKey(nameSR))
                {
                    ret.Add(nameSR, new KPI_SR());
                }
                var res = ret[nameSR];
                res.Name = nameSR;
                res.ValoarePlanTotala += plan;
                res.ValoareTotalaVinduta += valoarevinduta;
                ret[nameSR] = res;

            }

            return ret.Values.ToArray();
        }

    }

}