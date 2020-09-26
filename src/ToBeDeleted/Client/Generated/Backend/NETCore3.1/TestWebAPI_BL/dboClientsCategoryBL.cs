using System;

namespace TestWebAPI_BL
{
    public partial class dboClientsCategory
    {
        #region partial functions
        partial void OnConstructor();
        partial void OnCopyConstructor(dboClientsCategory other, bool withID);
        #endregion

        #region constructors
        public dboClientsCategory (){
            OnConstructor();
        }
        
        public dboClientsCategory(dboClientsCategory other):base(){ 

            OnCopyConstructor(other:other,withID: false);
                
        }
        public void CopyPropertiesFrom(dboClientsCategory other, bool withID){

            if(withID){
                this.id= other.id;
            }
                
            this.idcategory = other.idcategory;
                
            this.idclient = other.idclient;
                
            OnCopyConstructor(other,withID);
        }

        #endregion
        
        #region Properties

                public Int64 id{get;set;}
                

            public Int32 idcategory { get; set; }
            
            public Int64 idclient { get; set; }
                    #endregion
        
    }
}
