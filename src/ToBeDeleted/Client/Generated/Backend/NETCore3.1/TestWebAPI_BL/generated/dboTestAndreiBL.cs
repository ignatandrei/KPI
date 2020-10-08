using System;

namespace TestWebAPI_BL
{
    public partial class dboTestAndrei
    {
        #region partial functions
        partial void OnConstructor();
        partial void OnCopyConstructor(dboTestAndrei other, bool withID);
        #endregion

        #region constructors
        public dboTestAndrei (){
            OnConstructor();
        }
        
        public dboTestAndrei(dboTestAndrei other):base(){ 

            OnCopyConstructor(other:other,withID: false);
                
        }
        public void CopyPropertiesFrom(dboTestAndrei other, bool withID){

            if(withID){
                this.id= other.id;
            }
                

                var x="";
                
            this.a10 = other.a10;            
                
            this.a11 = other.a11;            
                
            this.a12 = other.a12;            
                
            this.a13 = other.a13;            
                
            this.a14 = other.a14;            
                
            this.a15 = other.a15;            
                
            this.a16 = other.a16;            
                
            this.a17 = other.a17;            
                
            this.a18 = other.a18;            
                
            this.a19 = other.a19;            
                
            this.a2 = other.a2;            
                
            this.a20 = other.a20;            
                
            this.a21 = other.a21;            
                
            this.a22 = other.a22;            
                
            this.a23 = other.a23;            
                
            this.a24 = other.a24;            
                
            this.a25 = other.a25;            
                
            this.a26 = other.a26;            
                
            this.a27 = other.a27;            
                
            this.a28 = other.a28;            
                
            this.a29 = other.a29;            
                
            this.a3 = other.a3;            
                
            this.a30 = other.a30;            
                
            this.a31 = other.a31;            
                
            this.a32 = other.a32;            
                
            this.a33 = other.a33;            
                
            this.a34 = other.a34;            
                
            this.a4 = other.a4;            
                
            this.a5 = other.a5;            
                
            this.a6 = other.a6;            
                
            this.a7 = other.a7;            
                
            this.a8 = other.a8;            
                
            this.a9 = other.a9;            
                
            OnCopyConstructor(other,withID);
        }

        #endregion
        
        #region Properties

                public Int32 id{get;set;}
                

            public String a10 { get; set; }
            
            public String a11 { get; set; }
            
            public String a12 { get; set; }
            
            public Byte[]? a13 { get; set; }
            
            public Boolean? a14 { get; set; }
            
            public Byte? a15 { get; set; }
            
            public Int16? a16 { get; set; }
            
            public Int32? a17 { get; set; }
            
            public Int64? a18 { get; set; }
            
            public Decimal? a19 { get; set; }
            
            public String a2 { get; set; }
            
            public Decimal? a20 { get; set; }
            
            public Decimal? a21 { get; set; }
            
            public Decimal? a22 { get; set; }
            
            public Double? a23 { get; set; }
            
            public Single? a24 { get; set; }
            
            public DateTime? a25 { get; set; }
            
            public DateTime? a26 { get; set; }
            
            public DateTime? a27 { get; set; }
            
            public DateTime? a28 { get; set; }
            
            public DateTime? a29 { get; set; }
            
            public String a3 { get; set; }
            
            public DateTime? a30 { get; set; }
            
            public Byte[] a31 { get; set; }
            
            public String a32 { get; set; }
            
            public Guid? a33 { get; set; }
            
            public String a34 { get; set; }
            
            public String a4 { get; set; }
            
            public String a5 { get; set; }
            
            public String a6 { get; set; }
            
            public String a7 { get; set; }
            
            public String a8 { get; set; }
            
            public String a9 { get; set; }
                    #endregion
        
    }
}
