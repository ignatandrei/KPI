

export class dbovwAssClients
    {
        
        
        public constructor(other:dbovwAssClients = null){ 

            if(other != null){
				this.CopyPropertiesFrom(other, true);
			}
                
        }
        public CopyPropertiesFrom(other:dbovwAssClients, withID: boolean):void{
            

            this.idassva = +other.idassva;
                
            this.idassvaclientscounties = +other.idassvaclientscounties;
                
            this.idclient = +other.idclient;
                
            this.idcounty = +other.idcounty;
                
            this.idmanager = +other.idmanager;
                
            this.nameassva = other.nameassva;
                
            this.nameclient = other.nameclient;
                
            this.namecountry = other.namecountry;
                
            this.namecounty = other.namecounty;
                
            this.shortnameassva = other.shortnameassva;
                
            this.shortnameclient = other.shortnameclient;
                
            this.shortnamecountry = other.shortnamecountry;
                
            this.shortnamecounty = other.shortnamecounty;
                
            
        }
        

            public idassva : number;
            
            public idassvaclientscounties : number;
            
            public idclient : number;
            
            public idcounty : number;
            
            public idmanager : number;
            
            public nameassva : string;
            
            public nameclient : string;
            
            public namecountry : string;
            
            public namecounty : string;
            
            public shortnameassva : string;
            
            public shortnameclient : string;
            
            public shortnamecountry : string;
            
            public shortnamecounty : string;
                    
    }

	