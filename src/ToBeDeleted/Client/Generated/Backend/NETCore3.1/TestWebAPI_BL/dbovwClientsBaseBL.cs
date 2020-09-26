using System;

namespace TestWebAPI_BL
{
    public partial class dbovwClientsBase
    {
        #region partial functions
        partial void OnConstructor();
        partial void OnCopyConstructor(dbovwClientsBase other, bool withID);
        #endregion

        #region constructors
        public dbovwClientsBase (){
            OnConstructor();
        }
        
        public dbovwClientsBase(dbovwClientsBase other):base(){ 

            OnCopyConstructor(other:other,withID: false);
                
        }
        public void CopyPropertiesFrom(dbovwClientsBase other, bool withID){

            this.id = other.id;
                
            this.idcategory = other.idcategory;
                
            this.idclient = other.idclient;
                
            this.namecategory = other.namecategory;
                
            this.nameclient = other.nameclient;
                
            this.shortnamecategory = other.shortnamecategory;
                
            this.shortnameclient = other.shortnameclient;
                
            OnCopyConstructor(other,withID);
        }

        #endregion
        
        #region Properties


            public Int64 id { get; set; }
            
            public Int32 idcategory { get; set; }
            
            public Int64 idclient { get; set; }
            
            public String namecategory { get; set; }
            
            public String nameclient { get; set; }
            
            public String shortnamecategory { get; set; }
            
            public String shortnameclient { get; set; }
                    #endregion
        
    }
}
