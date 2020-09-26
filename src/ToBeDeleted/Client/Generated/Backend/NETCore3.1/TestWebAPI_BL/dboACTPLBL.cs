using System;

namespace TestWebAPI_BL
{
    public partial class dboACTPL
    {
        #region partial functions
        partial void OnConstructor();
        partial void OnCopyConstructor(dboACTPL other, bool withID);
        #endregion

        #region constructors
        public dboACTPL (){
            OnConstructor();
        }
        
        public dboACTPL(dboACTPL other):base(){ 

            OnCopyConstructor(other:other,withID: false);
                
        }
        public void CopyPropertiesFrom(dboACTPL other, bool withID){

            if(withID){
                this.idactpl= other.idactpl;
            }
                
            this.actual = other.actual;
                
            this.idassvaclientscounties = other.idassvaclientscounties;
                
            this.month = other.month;
                
            this.plan = other.plan;
                
            this.year = other.year;
                
            OnCopyConstructor(other,withID);
        }

        #endregion
        
        #region Properties

                public Int64 idactpl{get;set;}
                

            public Decimal actual { get; set; }
            
            public Int64 idassvaclientscounties { get; set; }
            
            public Int32? month { get; set; }
            
            public Decimal plan { get; set; }
            
            public Int32? year { get; set; }
                    #endregion
        
    }
}
