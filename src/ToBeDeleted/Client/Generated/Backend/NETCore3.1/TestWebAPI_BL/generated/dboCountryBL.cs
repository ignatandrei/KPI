using System;

namespace TestWebAPI_BL
{
    public partial class dboRegion
    {
        #region partial functions
        partial void OnConstructor();
        partial void OnCopyConstructor(dboRegion other, bool withID);
        #endregion

        #region constructors
        public dboRegion (){
            OnConstructor();
        }
        
        public dboRegion(dboRegion other):base(){ 

            OnCopyConstructor(other:other,withID: false);
                
        }
        public void CopyPropertiesFrom(dboRegion other, bool withID){

            if(withID){
                this.idRegion= other.idRegion;
            }
                

                var x="";
                
            this.nameRegion = other.nameRegion;            
                
            this.shortnameRegion = other.shortnameRegion;            
                
            OnCopyConstructor(other,withID);
        }

        #endregion
        
        #region Properties

                public Int32 idRegion{get;set;}
                

            public String nameRegion { get; set; }
            
            public String shortnameRegion { get; set; }
                    #endregion
        
    }
}
