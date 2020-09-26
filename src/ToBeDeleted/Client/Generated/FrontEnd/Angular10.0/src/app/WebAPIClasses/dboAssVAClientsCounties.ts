

export class dboAssVAClientsCounties
    {
        
        
        public constructor(other:dboAssVAClientsCounties = null){ 

            if(other != null){
				this.CopyPropertiesFrom(other, true);
			}
                
        }
        public CopyPropertiesFrom(other:dboAssVAClientsCounties, withID: boolean):void{
            

            if(withID){
                this.idassvaclientscounties= other.idassvaclientscounties;
            }
            
            this.idassva = +other.idassva;
                
            this.idassvaclientscounties = +other.idassvaclientscounties;
                
            this.idclientscounties = +other.idclientscounties;
                
            
        }

        public  idassvaclientscounties: number;
                    

            public idassva : number;
            
            public idclientscounties : number;
                    
    }

	