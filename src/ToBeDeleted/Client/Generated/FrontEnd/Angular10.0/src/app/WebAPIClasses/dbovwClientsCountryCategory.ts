

export class dbovwClientsCountryCategory
    {
        
        
        public constructor(other:dbovwClientsCountryCategory = null){ 

            if(other != null){
				this.CopyPropertiesFrom(other, true);
			}
                
        }
        public CopyPropertiesFrom(other:dbovwClientsCountryCategory, withID: boolean):void{
            

            this.idclient = +other.idclient;
                
            this.namecategory = other.namecategory;
                
            this.nameclient = other.nameclient;
                
            this.namecountry = other.namecountry;
                
            this.namecounty = other.namecounty;
                
            this.shortnamecategory = other.shortnamecategory;
                
            this.shortnameclient = other.shortnameclient;
                
            this.shortnamecountry = other.shortnamecountry;
                
            this.shortnamecounty = other.shortnamecounty;
                
            
        }
        

            public idclient : number;
            
            public namecategory : string;
            
            public nameclient : string;
            
            public namecountry : string;
            
            public namecounty : string;
            
            public shortnamecategory : string;
            
            public shortnameclient : string;
            
            public shortnamecountry : string;
            
            public shortnamecounty : string;
                    
    }

	