using System;

namespace TestWebAPI_BL
{
    public partial class ValueSR
    {
        #region partial functions
        partial void OnConstructor();
        partial void OnCopyConstructor(ValueSR other, bool withID);
        #endregion

        #region constructors
        public ValueSR (){
            OnConstructor();
        }
        
        public ValueSR(ValueSR other):base(){ 

            OnCopyConstructor(other:other,withID: false);
                
        }
        public void CopyPropertiesFrom(ValueSR other, bool withID){
            if(withID){
                this.id20200908075619= other.id20200908075619;
            }

            this.namesr = other.namesr;
                
            this.valuesr = other.valuesr;
                
            this.dataoftarget = other.dataoftarget;
                
            OnCopyConstructor(other,withID);
        }

        #endregion
        
        #region Properties
        public long id20200908075619{get;set;}
            

            public String namesr { get; set; }
            
            public Decimal valuesr { get; set; }
            
            public Decimal dataoftarget { get; set; }
                    #endregion
        
    }
}
