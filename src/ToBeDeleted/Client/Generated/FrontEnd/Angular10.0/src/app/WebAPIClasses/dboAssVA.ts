

export class dboAssVA
    {
        
        
        public constructor(other:dboAssVA = null){ 

            if(other != null){
				this.CopyPropertiesFrom(other, true);
			}
                
        }
        public CopyPropertiesFrom(other:dboAssVA, withID: boolean):void{
            

            if(withID){
                this.idassva= other.idassva;
            }
            
            this.idassva = +other.idassva;
                
            this.idmanager = +other.idmanager;
                
            this.nameassva = other.nameassva;
                
            this.shortnameassva = other.shortnameassva;
                
            
        }

        public  idassva: number;
                    

            public idmanager : number;
            
            public nameassva : string;
            
            public shortnameassva : string;
                    
    }

	