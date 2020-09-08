using System;

namespace TestWebAPI_BL
{
    public partial class Client
    {
        #region partial functions
        partial void OnConstructor();
        partial void OnCopyConstructor(Client other, bool withID);
        #endregion

        #region constructors
        public Client (){
            OnConstructor();
        }
        
        public Client(Client other):base(){ 

            OnCopyConstructor(other:other,withID: false);
                
        }
        public void CopyPropertiesFrom(Client other, bool withID){
            if(withID){
                this.id20200908075419= other.id20200908075419;
            }

            this.name = other.name;
                
            OnCopyConstructor(other,withID);
        }

        #endregion
        
        #region Properties
        public long id20200908075419{get;set;}
            

            public String name { get; set; }
                    #endregion
        
    }
}
