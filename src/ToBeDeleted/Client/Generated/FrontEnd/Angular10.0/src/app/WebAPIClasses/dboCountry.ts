

export class dboCountry
    {
        
        
        public constructor(other:dboCountry = null){ 

            if(other != null){
				this.CopyPropertiesFrom(other, true);
			}
                
        }
        public CopyPropertiesFrom(other:dboCountry, withID: boolean):void{
            

            if(withID){
                this.idcountry= other.idcountry;
            }
            
            this.idcountry = +other.idcountry;
                
            this.namecountry = other.namecountry;
                
            this.shortnamecountry = other.shortnamecountry;
                
            
        }

        public  idcountry: number;
                    

            public namecountry : string;
            
            public shortnamecountry : string;
                    
    }

	