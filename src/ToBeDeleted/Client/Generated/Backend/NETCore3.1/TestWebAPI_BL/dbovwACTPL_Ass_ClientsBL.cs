using System;

namespace TestWebAPI_BL
{
    public partial class dbovwACTPL_Ass_Clients
    {
        #region partial functions
        partial void OnConstructor();
        partial void OnCopyConstructor(dbovwACTPL_Ass_Clients other, bool withID);
        #endregion

        #region constructors
        public dbovwACTPL_Ass_Clients (){
            OnConstructor();
        }
        
        public dbovwACTPL_Ass_Clients(dbovwACTPL_Ass_Clients other):base(){ 

            OnCopyConstructor(other:other,withID: false);
                
        }
        public void CopyPropertiesFrom(dbovwACTPL_Ass_Clients other, bool withID){

            this.actual = other.actual;
                
            this.idassva = other.idassva;
                
            this.idassvaclientscounties = other.idassvaclientscounties;
                
            this.idclient = other.idclient;
                
            this.idcounty = other.idcounty;
                
            this.idmanager = other.idmanager;
                
            this.month = other.month;
                
            this.nameassva = other.nameassva;
                
            this.nameclient = other.nameclient;
                
            this.namecountry = other.namecountry;
                
            this.namecounty = other.namecounty;
                
            this.plan = other.plan;
                
            this.shortnameassva = other.shortnameassva;
                
            this.shortnameclient = other.shortnameclient;
                
            this.shortnamecountry = other.shortnamecountry;
                
            this.shortnamecounty = other.shortnamecounty;
                
            this.year = other.year;
                
            OnCopyConstructor(other,withID);
        }

        #endregion
        
        #region Properties


            public Decimal actual { get; set; }
            
            public Int64 idassva { get; set; }
            
            public Int64 idassvaclientscounties { get; set; }
            
            public Int64 idclient { get; set; }
            
            public Int64 idcounty { get; set; }
            
            public Int64? idmanager { get; set; }
            
            public Int32? month { get; set; }
            
            public String nameassva { get; set; }
            
            public String nameclient { get; set; }
            
            public String namecountry { get; set; }
            
            public String namecounty { get; set; }
            
            public Decimal plan { get; set; }
            
            public String shortnameassva { get; set; }
            
            public String shortnameclient { get; set; }
            
            public String shortnamecountry { get; set; }
            
            public String shortnamecounty { get; set; }
            
            public Int32? year { get; set; }
                    #endregion
        
    }
}
