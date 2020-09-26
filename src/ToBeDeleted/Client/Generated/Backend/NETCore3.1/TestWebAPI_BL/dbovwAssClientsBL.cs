using System;

namespace TestWebAPI_BL
{
    public partial class dbovwAssClients
    {
        #region partial functions
        partial void OnConstructor();
        partial void OnCopyConstructor(dbovwAssClients other, bool withID);
        #endregion

        #region constructors
        public dbovwAssClients (){
            OnConstructor();
        }
        
        public dbovwAssClients(dbovwAssClients other):base(){ 

            OnCopyConstructor(other:other,withID: false);
                
        }
        public void CopyPropertiesFrom(dbovwAssClients other, bool withID){

            this.idassva = other.idassva;
                
            this.idassvaclientscounties = other.idassvaclientscounties;
                
            this.idclient = other.idclient;
                
            this.idcounty = other.idcounty;
                
            this.idmanager = other.idmanager;
                
            this.nameassva = other.nameassva;
                
            this.nameclient = other.nameclient;
                
            this.namecountry = other.namecountry;
                
            this.namecounty = other.namecounty;
                
            this.shortnameassva = other.shortnameassva;
                
            this.shortnameclient = other.shortnameclient;
                
            this.shortnamecountry = other.shortnamecountry;
                
            this.shortnamecounty = other.shortnamecounty;
                
            OnCopyConstructor(other,withID);
        }

        #endregion
        
        #region Properties


            public Int64 idassva { get; set; }
            
            public Int64 idassvaclientscounties { get; set; }
            
            public Int64 idclient { get; set; }
            
            public Int64 idcounty { get; set; }
            
            public Int64? idmanager { get; set; }
            
            public String nameassva { get; set; }
            
            public String nameclient { get; set; }
            
            public String namecountry { get; set; }
            
            public String namecounty { get; set; }
            
            public String shortnameassva { get; set; }
            
            public String shortnameclient { get; set; }
            
            public String shortnamecountry { get; set; }
            
            public String shortnamecounty { get; set; }
                    #endregion
        
    }
}
