using System;

namespace TestWebAPI_BL
{
    public partial class NNDvsUniv
    {
        #region partial functions
        partial void OnConstructor();
        partial void OnCopyConstructor(NNDvsUniv other, bool withID);
        #endregion

        #region constructors
        public NNDvsUniv (){
            OnConstructor();
        }
        
        public NNDvsUniv(NNDvsUniv other):base(){ 

            OnCopyConstructor(other:other,withID: false);
                
        }
        public void CopyPropertiesFrom(NNDvsUniv other, bool withID){
            if(withID){
                this.id20200915075727= other.id20200915075727;
            }

            this.salesrepname = other.salesrepname;
                
            this.noofcustomerswithshipment = other.noofcustomerswithshipment;
                
            this.universenooftotalcustomersfromsalesreparea = other.universenooftotalcustomersfromsalesreparea;
                
            OnCopyConstructor(other,withID);
        }

        #endregion
        
        #region Properties
        public long id20200915075727{get;set;}
            

            public String salesrepname { get; set; }
            
            public Decimal noofcustomerswithshipment { get; set; }
            
            public Decimal universenooftotalcustomersfromsalesreparea { get; set; }
                    #endregion
        
    }
}
