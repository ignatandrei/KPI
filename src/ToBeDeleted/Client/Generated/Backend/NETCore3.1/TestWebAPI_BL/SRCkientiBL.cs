using System;

namespace TestWebAPI_BL
{
    public partial class SRCkienti
    {
        #region partial functions
        partial void OnConstructor();
        partial void OnCopyConstructor(SRCkienti other, bool withID);
        #endregion

        #region constructors
        public SRCkienti (){
            OnConstructor();
        }
        
        public SRCkienti(SRCkienti other):base(){ 

            OnCopyConstructor(other:other,withID: false);
                
        }
        public void CopyPropertiesFrom(SRCkienti other, bool withID){
            if(withID){
                this.id20200908075449= other.id20200908075449;
            }

            this.sr = other.sr;
                
            this.client = other.client;
                
            OnCopyConstructor(other,withID);
        }

        #endregion
        
        #region Properties
        public long id20200908075449{get;set;}
            

            public String sr { get; set; }
            
            public String client { get; set; }
                    #endregion
        
    }
}
