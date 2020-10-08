namespace TestWebAPI_BL
{
    public class CountryData
    {
        public dboCountry Country { get; set; }
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
