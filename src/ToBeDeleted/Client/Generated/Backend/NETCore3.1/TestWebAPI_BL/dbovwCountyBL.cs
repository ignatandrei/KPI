using System;

namespace TestWebAPI_BL
{
    public partial class dbovwCounty
    {
        #region partial functions
        partial void OnConstructor();
        partial void OnCopyConstructor(dbovwCounty other, bool withID);
        #endregion

        #region constructors
        public dbovwCounty (){
            OnConstructor();
        }
        
        public dbovwCounty(dbovwCounty other):base(){ 

            OnCopyConstructor(other:other,withID: false);
                
        }
        public void CopyPropertiesFrom(dbovwCounty other, bool withID){

            this.idcountry = other.idcountry;
                
            this.idcounty = other.idcounty;
                
            this.namecountry = other.namecountry;
                
            this.namecounty = other.namecounty;
                
            this.shortnamecountry = other.shortnamecountry;
                
            this.shortnamecounty = other.shortnamecounty;
                
            OnCopyConstructor(other,withID);
        }

        #endregion
        
        #region Properties


            public Int32 idcountry { get; set; }
            
            public Int64 idcounty { get; set; }
            
            public String namecountry { get; set; }
            
            public String namecounty { get; set; }
            
            public String shortnamecountry { get; set; }
            
            public String shortnamecounty { get; set; }
                    #endregion
        
    }
}
