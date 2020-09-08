

export class SalesRep
    {
        
        
        public constructor(other:SalesRep = null){ 

            if(other != null){
				this.CopyPropertiesFrom(other, true);
			}
                
        }
        public CopyPropertiesFrom(other:SalesRep, withID: boolean):void{
            if(withID){
                this.id20200908075449= other.id20200908075449;
            }

            this.nume = other.nume;
                
            this.prenume = other.prenume;
                
            
        }
        public  id20200908075449: number;
            

            public nume : string;
            
            public prenume : string;
                    
    }

	