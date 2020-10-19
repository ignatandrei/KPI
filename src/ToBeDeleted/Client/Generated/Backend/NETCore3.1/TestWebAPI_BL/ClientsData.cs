namespace TestWebAPI_BL
{
    public class ClientData
    {
        public dboCategory  Channel { get; set; }
        public dboClients[] Clients { get; set; }

        public int NumberClients
        {
            get
            {
                return Clients?.Length ?? 0;
            }
        }
    }
}
