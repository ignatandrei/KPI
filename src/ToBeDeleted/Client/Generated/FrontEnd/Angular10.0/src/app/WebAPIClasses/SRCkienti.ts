

export class SRCkienti
    {
        
        
        public constructor(other:SRCkienti = null){ 

            if(other != null){
				this.CopyPropertiesFrom(other, true);
			}
                
        }
        public CopyPropertiesFrom(other:SRCkienti, withID: boolean):void{
            if(withID){
                this.id20200908075449= other.id20200908075449;
            }

            this.sr = other.sr;
                
            this.client = other.client;
                
            
        }
        public  id20200908075449: number;
            

            public sr : string;
            
            public client : string;
                    
    }

	