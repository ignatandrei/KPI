

export class dboCounty
    {
        
        
        public constructor(other:dboCounty = null){ 

            if(other != null){
				this.CopyPropertiesFrom(other, true);
			}
                
        }
        public CopyPropertiesFrom(other:dboCounty, withID: boolean):void{
            

            if(withID){
                this.idcounty= other.idcounty;
            }
            
            this.idcountry = +other.idcountry;
                
            this.idcounty = +other.idcounty;
                
            this.namecounty = other.namecounty;
                
            this.shortnamecounty = other.shortnamecounty;
                
            
        }

        public  idcounty: number;
                    

            public idcountry : number;
            
            public namecounty : string;
            
            public shortnamecounty : string;
                    
    }

	