

export class dboClientsCounties
    {
        
        
        public constructor(other:dboClientsCounties = null){ 

            if(other != null){
				this.CopyPropertiesFrom(other, true);
			}
                
        }
        public CopyPropertiesFrom(other:dboClientsCounties, withID: boolean):void{
            

            if(withID){
                this.idclientscounties= other.idclientscounties;
            }
            
            this.idclient = +other.idclient;
                
            this.idclientscounties = +other.idclientscounties;
                
            this.idcounty = +other.idcounty;
                
            
        }

        public  idclientscounties: number;
                    

            public idclient : number;
            
            public idcounty : number;
                    
    }

	