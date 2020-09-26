using System;

namespace TestWebAPI_BL
{
    public partial class dbovwAssManager
    {
        #region partial functions
        partial void OnConstructor();
        partial void OnCopyConstructor(dbovwAssManager other, bool withID);
        #endregion

        #region constructors
        public dbovwAssManager (){
            OnConstructor();
        }
        
        public dbovwAssManager(dbovwAssManager other):base(){ 

            OnCopyConstructor(other:other,withID: false);
                
        }
        public void CopyPropertiesFrom(dbovwAssManager other, bool withID){

            this.idassva = other.idassva;
                
            this.idmanager = other.idmanager;
                
            this.manager = other.manager;
                
            this.nameassva = other.nameassva;
                
            this.shortmanager = other.shortmanager;
                
            this.shortnameassva = other.shortnameassva;
                
            OnCopyConstructor(other,withID);
        }

        #endregion
        
        #region Properties


            public Int64 idassva { get; set; }
            
            public Int64? idmanager { get; set; }
            
            public String manager { get; set; }
            
            public String nameassva { get; set; }
            
            public String shortmanager { get; set; }
            
            public String shortnameassva { get; set; }
                    #endregion
        
    }
}
