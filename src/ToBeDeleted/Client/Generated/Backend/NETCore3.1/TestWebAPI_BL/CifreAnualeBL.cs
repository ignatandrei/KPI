using System;

namespace TestWebAPI_BL
{
    public partial class CifreAnuale
    {
        #region partial functions
        partial void OnConstructor();
        partial void OnCopyConstructor(CifreAnuale other, bool withID);
        #endregion

        #region constructors
        public CifreAnuale (){
            OnConstructor();
        }
        
        public CifreAnuale(CifreAnuale other):base(){ 

            OnCopyConstructor(other:other,withID: false);
                
        }
        public void CopyPropertiesFrom(CifreAnuale other, bool withID){
            if(withID){
                this.id20200908075419= other.id20200908075419;
            }

            this.name = other.name;
                
            this.an = other.an;
                
            this.valoarevinduta = other.valoarevinduta;
                
            this.plan = other.plan;
                
            OnCopyConstructor(other,withID);
        }

        #endregion
        
        #region Properties
        public long id20200908075419{get;set;}
            

            public String name { get; set; }
            
            public Decimal an { get; set; }
            
            public Decimal valoarevinduta { get; set; }
            
            public Decimal plan { get; set; }
                    #endregion
        
    }
}
