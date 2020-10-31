namespace TestWebAPI_BL
{
    public class ClientData
    {
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
