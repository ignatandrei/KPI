using System;
using System.Collections.Generic;
using System.Text;

namespace TestWebAPI_BL
{
    public class People
    {
        public dboAssVA Manager { get; set; }
        public People[] Team { get; set; }

        public int NumberPeopleInTeam
        {
            get
            {
                return Team?.Length ?? 0;
            }
        }
    }
}
