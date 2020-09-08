using System;

namespace TestWebAPI_BL
{
    public partial class TargetSR
    {
        #region partial functions
        partial void OnConstructor();
        partial void OnCopyConstructor(TargetSR other, bool withID);
        #endregion

        #region constructors
        public TargetSR (){
            OnConstructor();
        }
        
        public TargetSR(TargetSR other):base(){ 

            OnCopyConstructor(other:other,withID: false);
                
        }
        public void CopyPropertiesFrom(TargetSR other, bool withID){
            if(withID){
                this.id20200908075619= other.id20200908075619;
            }

            this.namesr = other.namesr;
                
            this.targetvalue = other.targetvalue;
                
            this.dataoftarget = other.dataoftarget;
                
            OnCopyConstructor(other,withID);
        }

        #endregion
        
        #region Properties
        public long id20200908075619{get;set;}
            

            public String namesr { get; set; }
            
            public Decimal targetvalue { get; set; }
            
            public Decimal dataoftarget { get; set; }
                    #endregion
        
    }
}
