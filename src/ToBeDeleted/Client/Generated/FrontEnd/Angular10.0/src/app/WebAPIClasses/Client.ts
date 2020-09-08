

export class Client
    {
        
        
        public constructor(other:Client = null){ 

            if(other != null){
				this.CopyPropertiesFrom(other, true);
			}
                
        }
        public CopyPropertiesFrom(other:Client, withID: boolean):void{
            if(withID){
                this.id20200908075419= other.id20200908075419;
            }

            this.name = other.name;
                
            
        }
        public  id20200908075419: number;
            

            public name : string;
                    
    }

	