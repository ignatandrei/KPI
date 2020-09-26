

export class dbovwClientsBase
    {
        
        
        public constructor(other:dbovwClientsBase = null){ 

            if(other != null){
				this.CopyPropertiesFrom(other, true);
			}
                
        }
        public CopyPropertiesFrom(other:dbovwClientsBase, withID: boolean):void{
            

            this.id = +other.id;
                
            this.idcategory = +other.idcategory;
                
            this.idclient = +other.idclient;
                
            this.namecategory = other.namecategory;
                
            this.nameclient = other.nameclient;
                
            this.shortnamecategory = other.shortnamecategory;
                
            this.shortnameclient = other.shortnameclient;
                
            
        }
        

            public id : number;
            
            public idcategory : number;
            
            public idclient : number;
            
            public namecategory : string;
            
            public nameclient : string;
            
            public shortnamecategory : string;
            
            public shortnameclient : string;
                    
    }

	