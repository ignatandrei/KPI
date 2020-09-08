

export class ValueSR
    {
        
        
        public constructor(other:ValueSR = null){ 

            if(other != null){
				this.CopyPropertiesFrom(other, true);
			}
                
        }
        public CopyPropertiesFrom(other:ValueSR, withID: boolean):void{
            if(withID){
                this.id20200908075619= other.id20200908075619;
            }

            this.namesr = other.namesr;
                
            this.valuesr = +other.valuesr;
                
            this.dataoftarget = +other.dataoftarget;
                
            
        }
        public  id20200908075619: number;
            

            public namesr : string;
            
            public valuesr : number;
            
            public dataoftarget : number;
                    
    }

	