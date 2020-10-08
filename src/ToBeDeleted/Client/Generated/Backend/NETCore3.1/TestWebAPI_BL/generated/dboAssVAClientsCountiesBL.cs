using System;

namespace TestWebAPI_BL
{
    public partial class dboAssVAClientsCounties
    {
        #region partial functions
        partial void OnConstructor();
        partial void OnCopyConstructor(dboAssVAClientsCounties other, bool withID);
        #endregion

        #region constructors
        public dboAssVAClientsCounties (){
            OnConstructor();
        }
        
        public dboAssVAClientsCounties(dboAssVAClientsCounties other):base(){ 

            OnCopyConstructor(other:other,withID: false);
                
        }
        public void CopyPropertiesFrom(dboAssVAClientsCounties other, bool withID){

            if(withID){
                this.idassvaclientscounties= other.idassvaclientscounties;
            }
                

                var x="";
                
            this.idassva = other.idassva;            
                
            this.idclientscounties = other.idclientscounties;            
                
            OnCopyConstructor(other,withID);
        }

        #endregion
        
        #region Properties

                public Int64 idassvaclientscounties{get;set;}
                

            public Int64 idassva { get; set; }
            
            public Int64 idclientscounties { get; set; }
                    #endregion
        
    }
}
