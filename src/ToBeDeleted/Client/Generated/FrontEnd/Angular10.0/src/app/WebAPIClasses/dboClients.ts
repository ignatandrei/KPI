

export class dboClients
    {
        
        
        public constructor(other:dboClients = null){ 

            if(other != null){
				this.CopyPropertiesFrom(other, true);
			}
                
        }
        public CopyPropertiesFrom(other:dboClients, withID: boolean):void{
            

            if(withID){
                this.idclient= other.idclient;
            }
            
            this.idclient = +other.idclient;
                
            this.nameclient = other.nameclient;
                
            this.shortnameclient = other.shortnameclient;
                
            
        }

        public  idclient: number;
                    

            public nameclient : string;
            
            public shortnameclient : string;
                    
    }

	