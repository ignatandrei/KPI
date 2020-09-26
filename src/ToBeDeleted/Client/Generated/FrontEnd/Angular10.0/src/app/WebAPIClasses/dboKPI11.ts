export class Series {
    name: string;
    value: number;
}

export class KPI11Graph {
    name: string;
    series: Series[];
}

export class dboKPI11
    {
        
        
        public constructor(other:dboKPI11 = null){ 

            if(other != null){
				this.CopyPropertiesFrom(other, true);
			}
                
        }
        public CopyPropertiesFrom(other:dboKPI11, withID: boolean):void{
            

            this.actualytd = +other.actualytd;
                
            this.idassva = +other.idassva;
                
            this.idclient = +other.idclient;
                
            this.idcounty = +other.idcounty;
                
            this.idmanager = +other.idmanager;
                
            this.planytd = +other.planytd;
                
            
        }
        

            public actualytd : number;
            
            public idassva : number;
            
            public idclient : number;
            
            public idcounty : number;
            
            public idmanager : number;
            
            public planytd : number;
                    
    }

	