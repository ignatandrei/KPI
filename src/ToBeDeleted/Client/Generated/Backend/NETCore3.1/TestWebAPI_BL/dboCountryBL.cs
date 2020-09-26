using System;

namespace TestWebAPI_BL
{
    public partial class dboCountry
    {
        #region partial functions
        partial void OnConstructor();
        partial void OnCopyConstructor(dboCountry other, bool withID);
        #endregion

        #region constructors
        public dboCountry (){
            OnConstructor();
        }
        
        public dboCountry(dboCountry other):base(){ 

            OnCopyConstructor(other:other,withID: false);
                
        }
        public void CopyPropertiesFrom(dboCountry other, bool withID){

            if(withID){
                this.idcountry= other.idcountry;
            }
                
            this.namecountry = other.namecountry;
                
            this.shortnamecountry = other.shortnamecountry;
                
            OnCopyConstructor(other,withID);
        }

        #endregion
        
        #region Properties

                public Int32 idcountry{get;set;}
                

            public String namecountry { get; set; }
            
            public String shortnamecountry { get; set; }
                    #endregion
        
    }
}
