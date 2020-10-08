using System;

namespace TestWebAPI_BL
{
    public partial class dboAssVA
    {
        #region partial functions
        partial void OnConstructor();
        partial void OnCopyConstructor(dboAssVA other, bool withID);
        #endregion

        #region constructors
        public dboAssVA (){
            OnConstructor();
        }
        
        public dboAssVA(dboAssVA other):base(){ 

            OnCopyConstructor(other:other,withID: false);
                
        }
        public void CopyPropertiesFrom(dboAssVA other, bool withID){

            if(withID){
                this.idassva= other.idassva;
            }
                

                var x="";
                
            this.idmanager = other.idmanager;            
                
            this.nameassva = other.nameassva;            
                
            this.shortnameassva = other.shortnameassva;            
                
            OnCopyConstructor(other,withID);
        }

        #endregion
        
        #region Properties

                public Int64 idassva{get;set;}
                

            public Int64? idmanager { get; set; }
            
            public String nameassva { get; set; }
            
            public String shortnameassva { get; set; }
                    #endregion
        
    }
}
