

export class dboACTPL
    {
        
        
        public constructor(other:dboACTPL = null){ 

            if(other != null){
				this.CopyPropertiesFrom(other, true);
			}
                
        }
        public CopyPropertiesFrom(other:dboACTPL, withID: boolean):void{
            

            if(withID){
                this.idactpl= other.idactpl;
            }
            
            this.actual = +other.actual;
                
            this.idactpl = +other.idactpl;
                
            this.idassvaclientscounties = +other.idassvaclientscounties;
                
            this.month = +other.month;
                
            this.plan = +other.plan;
                
            this.year = +other.year;
                
            
        }

        public  idactpl: number;
                    

            public actual : number;
            
            public idassvaclientscounties : number;
            
            public month : number;
            
            public plan : number;
            
            public year : number;
                    
    }

	