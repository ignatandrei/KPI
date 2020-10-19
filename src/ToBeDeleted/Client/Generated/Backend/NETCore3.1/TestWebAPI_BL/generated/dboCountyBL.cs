using System;

namespace TestWebAPI_BL
{
    public partial class dboCounty
    {
        #region partial functions
        partial void OnConstructor();
        partial void OnCopyConstructor(dboCounty other, bool withID);
        #endregion

        #region constructors
        public dboCounty (){
            OnConstructor();
        }
        
        public dboCounty(dboCounty other):base(){ 

            OnCopyConstructor(other:other,withID: false);
                
        }
        public void CopyPropertiesFrom(dboCounty other, bool withID){

            if(withID){
                this.idcounty= other.idcounty;
            }
                

                var x="";
                
            this.idRegion = other.idRegion;            
                
            this.namecounty = other.namecounty;            
                
            this.shortnamecounty = other.shortnamecounty;            
                
            OnCopyConstructor(other,withID);
        }

        #endregion
        
        #region Properties

                public Int64 idcounty{get;set;}
                

            public Int32 idRegion { get; set; }
            
            public String namecounty { get; set; }
            
            public String shortnamecounty { get; set; }
                    #endregion
        
    }
}
