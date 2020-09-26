using System;

namespace TestWebAPI_BL
{
    public partial class dboClients
    {
        #region partial functions
        partial void OnConstructor();
        partial void OnCopyConstructor(dboClients other, bool withID);
        #endregion

        #region constructors
        public dboClients (){
            OnConstructor();
        }
        
        public dboClients(dboClients other):base(){ 

            OnCopyConstructor(other:other,withID: false);
                
        }
        public void CopyPropertiesFrom(dboClients other, bool withID){

            if(withID){
                this.idclient= other.idclient;
            }
                
            this.nameclient = other.nameclient;
                
            this.shortnameclient = other.shortnameclient;
                
            OnCopyConstructor(other,withID);
        }

        #endregion
        
        #region Properties

                public Int64 idclient{get;set;}
                

            public String nameclient { get; set; }
            
            public String shortnameclient { get; set; }
                    #endregion
        
    }
}
