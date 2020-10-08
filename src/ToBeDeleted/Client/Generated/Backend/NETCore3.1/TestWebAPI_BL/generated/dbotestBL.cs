using System;

namespace TestWebAPI_BL
{
    public partial class dbotest
    {
        #region partial functions
        partial void OnConstructor();
        partial void OnCopyConstructor(dbotest other, bool withID);
        #endregion

        #region constructors
        public dbotest (){
            OnConstructor();
        }
        
        public dbotest(dbotest other):base(){ 

            OnCopyConstructor(other:other,withID: false);
                
        }
        public void CopyPropertiesFrom(dbotest other, bool withID){

            this.id = other.id;            
                
            this.name = other.name;            
                
            OnCopyConstructor(other,withID);
        }

        #endregion
        
        #region Properties


            public Int32? id { get; set; }
            
            public String name { get; set; }
                    #endregion
        
    }
}
