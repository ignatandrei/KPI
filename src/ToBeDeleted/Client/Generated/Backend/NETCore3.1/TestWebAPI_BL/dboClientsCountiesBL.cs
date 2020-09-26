using System;

namespace TestWebAPI_BL
{
    public partial class dboClientsCounties
    {
        #region partial functions
        partial void OnConstructor();
        partial void OnCopyConstructor(dboClientsCounties other, bool withID);
        #endregion

        #region constructors
        public dboClientsCounties (){
            OnConstructor();
        }
        
        public dboClientsCounties(dboClientsCounties other):base(){ 

            OnCopyConstructor(other:other,withID: false);
                
        }
        public void CopyPropertiesFrom(dboClientsCounties other, bool withID){

            if(withID){
                this.idclientscounties= other.idclientscounties;
            }
                
            this.idclient = other.idclient;
                
            this.idcounty = other.idcounty;
                
            OnCopyConstructor(other,withID);
        }

        #endregion
        
        #region Properties

                public Int64 idclientscounties{get;set;}
                

            public Int64 idclient { get; set; }
            
            public Int64 idcounty { get; set; }
                    #endregion
        
    }
}
