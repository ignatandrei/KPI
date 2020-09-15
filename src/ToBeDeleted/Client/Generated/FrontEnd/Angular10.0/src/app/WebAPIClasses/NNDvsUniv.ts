

export class NNDvsUniv
    {
        
        
        public constructor(other:NNDvsUniv = null){ 

            if(other != null){
				this.CopyPropertiesFrom(other, true);
			}
                
        }
        public CopyPropertiesFrom(other:NNDvsUniv, withID: boolean):void{
            if(withID){
                this.id20200915075727= other.id20200915075727;
            }

            this.salesrepname = other.salesrepname;
                
            this.noofcustomerswithshipment = +other.noofcustomerswithshipment;
                
            this.universenooftotalcustomersfromsalesreparea = +other.universenooftotalcustomersfromsalesreparea;
                
            
        }
        public  id20200915075727: number;
            

            public salesrepname : string;
            
            public noofcustomerswithshipment : number;
            
            public universenooftotalcustomersfromsalesreparea : number;
                    
    }

	