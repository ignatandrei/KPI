namespace TestWebAPI_BL
{
    public class ClientData
    {
        public ClientData()
        {
            SubClients = new ClientData[0];
        }
        public dboClients  MainClient { get; set; }
        public ClientData[] SubClients { get; set; }

        public int NumberSubClients
        {
            get
            {
                return SubClients?.Length ?? 0;
            }
        }
    }
}
