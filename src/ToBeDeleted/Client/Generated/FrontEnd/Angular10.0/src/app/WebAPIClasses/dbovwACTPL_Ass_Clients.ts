

export class dbovwACTPL_Ass_Clients
    {
        
        
        public constructor(other:dbovwACTPL_Ass_Clients = null){ 

            if(other != null){
				this.CopyPropertiesFrom(other, true);
			}
                
        }
        public CopyPropertiesFrom(other:dbovwACTPL_Ass_Clients, withID: boolean):void{
            

            this.actual = +other.actual;
                
            this.idassva = +other.idassva;
                
            this.idassvaclientscounties = +other.idassvaclientscounties;
                
            this.idclient = +other.idclient;
                
            this.idcounty = +other.idcounty;
                
            this.idmanager = +other.idmanager;
                
            this.month = +other.month;
                
            this.nameassva = other.nameassva;
                
            this.nameclient = other.nameclient;
                
            this.namecountry = other.namecountry;
                
            this.namecounty = other.namecounty;
                
            this.plan = +other.plan;
                
            this.shortnameassva = other.shortnameassva;
                
            this.shortnameclient = other.shortnameclient;
                
            this.shortnamecountry = other.shortnamecountry;
                
            this.shortnamecounty = other.shortnamecounty;
                
            this.year = +other.year;
                
            
        }
        

            public actual : number;
            
            public idassva : number;
            
            public idassvaclientscounties : number;
            
            public idclient : number;
            
            public idcounty : number;
            
            public idmanager : number;
            
            public month : number;
            
            public nameassva : string;
            
            public nameclient : string;
            
            public namecountry : string;
            
            public namecounty : string;
            
            public plan : number;
            
            public shortnameassva : string;
            
            public shortnameclient : string;
            
            public shortnamecountry : string;
            
            public shortnamecounty : string;
            
            public year : number;
                    
    }

	