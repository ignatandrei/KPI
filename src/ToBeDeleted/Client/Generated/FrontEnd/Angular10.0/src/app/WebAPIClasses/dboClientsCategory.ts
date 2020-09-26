

export class dboClientsCategory
    {
        
        
        public constructor(other:dboClientsCategory = null){ 

            if(other != null){
				this.CopyPropertiesFrom(other, true);
			}
                
        }
        public CopyPropertiesFrom(other:dboClientsCategory, withID: boolean):void{
            

            if(withID){
                this.id= other.id;
            }
            
            this.id = +other.id;
                
            this.idcategory = +other.idcategory;
                
            this.idclient = +other.idclient;
                
            
        }

        public  id: number;
                    

            public idcategory : number;
            
            public idclient : number;
                    
    }

	