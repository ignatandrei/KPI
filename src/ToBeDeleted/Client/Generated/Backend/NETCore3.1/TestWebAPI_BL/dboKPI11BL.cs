using System;

namespace TestWebAPI_BL
{
    public partial class dboKPI11
    {
        #region partial functions
        partial void OnConstructor();
        partial void OnCopyConstructor(dboKPI11 other, bool withID);
        #endregion

        #region constructors
        public dboKPI11 (){
            OnConstructor();
        }
        
        public dboKPI11(dboKPI11 other):base(){ 

            OnCopyConstructor(other:other,withID: false);
                
        }
        public void CopyPropertiesFrom(dboKPI11 other, bool withID){

            this.actualytd = other.actualytd;
                
            this.idassva = other.idassva;
                
            this.idclient = other.idclient;
                
            this.idcounty = other.idcounty;
                
            this.idmanager = other.idmanager;
                
            this.planytd = other.planytd;
                
            OnCopyConstructor(other,withID);
        }

        #endregion
        
        #region Properties


            public Decimal? actualytd { get; set; }
            
            public Int64 idassva { get; set; }
            
            public Int64 idclient { get; set; }
            
            public Int64 idcounty { get; set; }
            
            public Int64? idmanager { get; set; }
            
            public Decimal? planytd { get; set; }
                    #endregion
        
    }
}
