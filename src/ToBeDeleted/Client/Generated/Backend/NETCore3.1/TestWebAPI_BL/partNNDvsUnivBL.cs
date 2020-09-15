using System;
using System.Collections.Generic;
using System.Text;

namespace TestWebAPI_BL
{
    partial class NNDvsUniv
    {
        public decimal Percentage
        {
            get
            {
                return this.noofcustomerswithshipment / this.universenooftotalcustomersfromsalesreparea;
            }
        }

    }
}
