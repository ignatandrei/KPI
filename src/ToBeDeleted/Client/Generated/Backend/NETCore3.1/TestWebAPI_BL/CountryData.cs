namespace TestWebAPI_BL
{

    public class RegionData
    {
        public dboRegion Region { get; set; }
        public dboCounty[] Counties { get; set; }

        public int NumberCounties
        {
            get
            {
                return Counties?.Length ?? 0;
            }
        }
    }
}
