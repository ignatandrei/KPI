

export class dbovwAssManager
    {
        
        
        public constructor(other:dbovwAssManager = null){ 

            if(other != null){
				this.CopyPropertiesFrom(other, true);
			}
                
        }
        public CopyPropertiesFrom(other:dbovwAssManager, withID: boolean):void{
            

            this.idassva = +other.idassva;
                
            this.idmanager = +other.idmanager;
                
            this.manager = other.manager;
                
            this.nameassva = other.nameassva;
                
            this.shortmanager = other.shortmanager;
                
            this.shortnameassva = other.shortnameassva;
                
            
        }
        

            public idassva : number;
            
            public idmanager : number;
            
            public manager : string;
            
            public nameassva : string;
            
            public shortmanager : string;
            
            public shortnameassva : string;
                    
    }

	