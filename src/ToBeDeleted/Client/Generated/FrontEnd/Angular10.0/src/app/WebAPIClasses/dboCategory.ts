

export class dboCategory
    {
        
        
        public constructor(other:dboCategory = null){ 

            if(other != null){
				this.CopyPropertiesFrom(other, true);
			}
                
        }
        public CopyPropertiesFrom(other:dboCategory, withID: boolean):void{
            

            if(withID){
                this.idcategory= other.idcategory;
            }
            
            this.idcategory = +other.idcategory;
                
            this.namecategory = other.namecategory;
                
            this.shortnamecategory = other.shortnamecategory;
                
            
        }

        public  idcategory: number;
                    

            public namecategory : string;
            
            public shortnamecategory : string;
                    
    }

	