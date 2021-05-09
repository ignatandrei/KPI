namespace TestWEBAPI_DAL
{
    public class DateYTD
    {
        public int ID { get; set; }
        public int Year { get; set; }
        public int Month{ get; set; }

        public static DateYTD operator +(DateYTD  op, int nrMonths)
        {
            var dt = new DateYTD();
            dt.Year = op.Year;
            dt.Month = op.Month;
            dt.Month += nrMonths;
            while (dt.Month > 12)
            {
                dt.Month = dt.Month - 12;
                dt.Year++;
            }
            dt.ID = dt.Year * 100 + dt.Month;
            return dt;
        }
    }
}