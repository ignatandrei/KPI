using System;

namespace TestWebAPI_BL
{
    public partial class dbovwClientsCountryCategory
    {
        #region partial functions
        partial void OnConstructor();
        partial void OnCopyConstructor(dbovwClientsCountryCategory other, bool withID);
        #endregion

        #region constructors
        public dbovwClientsCountryCategory (){
            OnConstructor();
        }
        
        public dbovwClientsCountryCategory(dbovwClientsCountryCategory other):base(){ 

            OnCopyConstructor(other:other,withID: false);
                
        }
        public void CopyPropertiesFrom(dbovwClientsCountryCategory other, bool withID){

            this.idclient = other.idclient;
                
            this.namecategory = other.namecategory;
                
            this.nameclient = other.nameclient;
                
            this.namecountry = other.namecountry;
                
            this.namecounty = other.namecounty;
                
            this.shortnamecategory = other.shortnamecategory;
                
            this.shortnameclient = other.shortnameclient;
                
            this.shortnamecountry = other.shortnamecountry;
                
            this.shortnamecounty = other.shortnamecounty;
                
            OnCopyConstructor(other,withID);
        }

        #endregion
        
        #region Properties


            public Int64 idclient { get; set; }
            
            public String namecategory { get; set; }
            
            public String nameclient { get; set; }
            
            public String namecountry { get; set; }
            
            public String namecounty { get; set; }
            
            public String shortnamecategory { get; set; }
            
            public String shortnameclient { get; set; }
            
            public String shortnamecountry { get; set; }
            
            public String shortnamecounty { get; set; }
                    #endregion
        
    }
}
