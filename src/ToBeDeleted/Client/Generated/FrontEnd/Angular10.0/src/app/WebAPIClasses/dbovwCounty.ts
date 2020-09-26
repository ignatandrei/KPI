

export class dbovwCounty
    {
        
        
        public constructor(other:dbovwCounty = null){ 

            if(other != null){
				this.CopyPropertiesFrom(other, true);
			}
                
        }
        public CopyPropertiesFrom(other:dbovwCounty, withID: boolean):void{
            

            this.idcountry = +other.idcountry;
                
            this.idcounty = +other.idcounty;
                
            this.namecountry = other.namecountry;
                
            this.namecounty = other.namecounty;
                
            this.shortnamecountry = other.shortnamecountry;
                
            this.shortnamecounty = other.shortnamecounty;
                
            
        }
        

            public idcountry : number;
            
            public idcounty : number;
            
            public namecountry : string;
            
            public namecounty : string;
            
            public shortnamecountry : string;
            
            public shortnamecounty : string;
                    
    }

	