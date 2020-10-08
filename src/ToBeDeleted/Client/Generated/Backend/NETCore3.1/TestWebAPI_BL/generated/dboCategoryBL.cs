using System;

namespace TestWebAPI_BL
{
    public partial class dboCategory
    {
        #region partial functions
        partial void OnConstructor();
        partial void OnCopyConstructor(dboCategory other, bool withID);
        #endregion

        #region constructors
        public dboCategory (){
            OnConstructor();
        }
        
        public dboCategory(dboCategory other):base(){ 

            OnCopyConstructor(other:other,withID: false);
                
        }
        public void CopyPropertiesFrom(dboCategory other, bool withID){

            if(withID){
                this.idcategory= other.idcategory;
            }
                

                var x="";
                
            this.namecategory = other.namecategory;            
                
            this.shortnamecategory = other.shortnamecategory;            
                
            OnCopyConstructor(other,withID);
        }

        #endregion
        
        #region Properties

                public Int32 idcategory{get;set;}
                

            public String namecategory { get; set; }
            
            public String shortnamecategory { get; set; }
                    #endregion
        
    }
}
