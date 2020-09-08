

export class CifreAnuale
    {
        
        
        public constructor(other:CifreAnuale = null){ 

            if(other != null){
				this.CopyPropertiesFrom(other, true);
			}
                
        }
        public CopyPropertiesFrom(other:CifreAnuale, withID: boolean):void{
            if(withID){
                this.id20200908075419= other.id20200908075419;
            }

            this.name = other.name;
                
            this.an = +other.an;
                
            this.valoarevinduta = +other.valoarevinduta;
                
            this.plan = +other.plan;
                
            
        }
        public  id20200908075419: number;
            

            public name : string;
            
            public an : number;
            
            public valoarevinduta : number;
            
            public plan : number;
                    
    }

	