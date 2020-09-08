using System;

namespace TestWebAPI_BL
{
    public partial class SalesRep
    {
        #region partial functions
        partial void OnConstructor();
        partial void OnCopyConstructor(SalesRep other, bool withID);
        #endregion

        #region constructors
        public SalesRep (){
            OnConstructor();
        }
        
        public SalesRep(SalesRep other):base(){ 

            OnCopyConstructor(other:other,withID: false);
                
        }
        public void CopyPropertiesFrom(SalesRep other, bool withID){
            if(withID){
                this.id20200908075449= other.id20200908075449;
            }

            this.nume = other.nume;
                
            this.prenume = other.prenume;
                
            OnCopyConstructor(other,withID);
        }

        #endregion
        
        #region Properties
        public long id20200908075449{get;set;}
            

            public String nume { get; set; }
            
            public String prenume { get; set; }
                    #endregion
        
    }
}
