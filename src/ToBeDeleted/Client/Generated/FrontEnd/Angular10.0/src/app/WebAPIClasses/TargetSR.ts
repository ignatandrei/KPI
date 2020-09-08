

export class TargetSR
    {
        
        
        public constructor(other:TargetSR = null){ 

            if(other != null){
				this.CopyPropertiesFrom(other, true);
			}
                
        }
        public CopyPropertiesFrom(other:TargetSR, withID: boolean):void{
            if(withID){
                this.id20200908075619= other.id20200908075619;
            }

            this.namesr = other.namesr;
                
            this.targetvalue = +other.targetvalue;
                
            this.dataoftarget = +other.dataoftarget;
                
            
        }
        public  id20200908075619: number;
            

            public namesr : string;
            
            public targetvalue : number;
            
            public dataoftarget : number;
                    
    }

	