using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using TestWebAPI_BL;

namespace TestWEBAPI_DAL
{
    public partial class DatabaseContext : DbContext
    {
        public DatabaseContext()
        {

        }
        public DatabaseContext(DbContextOptions<DatabaseContext> options)
        : base(options)
        {
        }

            public virtual DbSet<dboACTPL> dboACTPL{ get; set; }
            
            public virtual DbSet<dboAssVA> dboAssVA{ get; set; }
            
            public virtual DbSet<dboAssVAClientsCounties> dboAssVAClientsCounties{ get; set; }
            
            public virtual DbSet<dboCategory> dboCategory{ get; set; }
            
            public virtual DbSet<dboClients> dboClients{ get; set; }
            
            public virtual DbSet<dboClientsCategory> dboClientsCategory{ get; set; }
            
            public virtual DbSet<dboClientsCounties> dboClientsCounties{ get; set; }
            
            public virtual DbSet<dboRegion> dboRegion{ get; set; }
            
            public virtual DbSet<dboCounty> dboCounty{ get; set; }
            
            public virtual DbSet<dbotest> dbotest{ get; set; }
            
            public virtual DbSet<dboTestAndrei> dboTestAndrei{ get; set; }
                    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {


            modelBuilder.Entity<dboACTPL>()
                .ToTable("ACTPL","dbo")
                .HasKey(it=>it.idactpl);
         
            modelBuilder.Entity<dboAssVA>()
                .ToTable("AssVA","dbo")
                .HasKey(it=>it.idassva);
         
            modelBuilder.Entity<dboAssVAClientsCounties>()
                .ToTable("AssVAClientsCounties","dbo")
                .HasKey(it=>it.idassvaclientscounties);
         
            modelBuilder.Entity<dboCategory>()
                .ToTable("Category","dbo")
                .HasKey(it=>it.idcategory);
         
            modelBuilder.Entity<dboClients>()
                .ToTable("Clients","dbo")
                .HasKey(it=>it.idclient);
         
            modelBuilder.Entity<dboClientsCategory>()
                .ToTable("ClientsCategory","dbo")
                .HasKey(it=>it.id);
         
            modelBuilder.Entity<dboClientsCounties>()
                .ToTable("ClientsCounties","dbo")
                .HasKey(it=>it.idclientscounties);
         
            modelBuilder.Entity<dboRegion>()
                .ToTable("Region","dbo")
                .HasKey(it=>it.idRegion);
         
            modelBuilder.Entity<dboCounty>()
                .ToTable("County","dbo")
                .HasKey(it=>it.idcounty);
         
            modelBuilder.Entity<dbotest>()
                .ToView("test","dbo")
                .HasNoKey();
         
            modelBuilder.Entity<dboTestAndrei>()
                .ToTable("TestAndrei","dbo")
                .HasKey(it=>it.id);
                     //mapping columns if have spaces


                        modelBuilder.Entity<dboACTPL>().Property(it => it.actual).HasColumnName("Actual");
                    
                        modelBuilder.Entity<dboACTPL>().Property(it => it.idactpl).HasColumnName("IDACTPL");
                    
                        modelBuilder.Entity<dboACTPL>().Property(it => it.idassvaclientscounties).HasColumnName("IDAssVAClientsCounties");
                    
                        modelBuilder.Entity<dboACTPL>().Property(it => it.month).HasColumnName("Month");
                    
                        modelBuilder.Entity<dboACTPL>().Property(it => it.plan).HasColumnName("Plan");
                    
                        modelBuilder.Entity<dboACTPL>().Property(it => it.year).HasColumnName("Year");
                    
                        modelBuilder.Entity<dboAssVA>().Property(it => it.idassva).HasColumnName("IDAssVA");
                    
                        modelBuilder.Entity<dboAssVA>().Property(it => it.idmanager).HasColumnName("IDManager");
                    
                        modelBuilder.Entity<dboAssVA>().Property(it => it.nameassva).HasColumnName("NameAssVA");
                    
                        modelBuilder.Entity<dboAssVA>().Property(it => it.shortnameassva).HasColumnName("ShortNameAssVA");
                    
                        modelBuilder.Entity<dboAssVAClientsCounties>().Property(it => it.idassva).HasColumnName("IDAssVA");
                    
                        modelBuilder.Entity<dboAssVAClientsCounties>().Property(it => it.idassvaclientscounties).HasColumnName("IDAssVAClientsCounties");
                    
                        modelBuilder.Entity<dboAssVAClientsCounties>().Property(it => it.idclientscounties).HasColumnName("IDClientsCounties");
                    
                        modelBuilder.Entity<dboCategory>().Property(it => it.idcategory).HasColumnName("IDCategory");
                    
                        modelBuilder.Entity<dboCategory>().Property(it => it.namecategory).HasColumnName("NameCategory");
                    
                        modelBuilder.Entity<dboCategory>().Property(it => it.shortnamecategory).HasColumnName("ShortNameCategory");
                    
                        modelBuilder.Entity<dboClients>().Property(it => it.idclient).HasColumnName("IDClient");
                    
                        modelBuilder.Entity<dboClients>().Property(it => it.nameclient).HasColumnName("NameClient");
                    
                        modelBuilder.Entity<dboClients>().Property(it => it.shortnameclient).HasColumnName("ShortNameClient");
                    
                        modelBuilder.Entity<dboClientsCategory>().Property(it => it.id).HasColumnName("ID");
                    
                        modelBuilder.Entity<dboClientsCategory>().Property(it => it.idcategory).HasColumnName("IDCategory");
                    
                        modelBuilder.Entity<dboClientsCategory>().Property(it => it.idclient).HasColumnName("IDClient");
                    
                        modelBuilder.Entity<dboClientsCounties>().Property(it => it.idclient).HasColumnName("IDClient");
                    
                        modelBuilder.Entity<dboClientsCounties>().Property(it => it.idclientscounties).HasColumnName("IDClientsCounties");
                    
                        modelBuilder.Entity<dboClientsCounties>().Property(it => it.idcounty).HasColumnName("IDCounty");
                    
                        modelBuilder.Entity<dboRegion>().Property(it => it.idRegion).HasColumnName("IDRegion");
                    
                        modelBuilder.Entity<dboRegion>().Property(it => it.nameRegion).HasColumnName("NameRegion");
                    
                        modelBuilder.Entity<dboRegion>().Property(it => it.shortnameRegion).HasColumnName("ShortNameRegion");
                    
                        modelBuilder.Entity<dboCounty>().Property(it => it.idRegion).HasColumnName("IDRegion");
                    
                        modelBuilder.Entity<dboCounty>().Property(it => it.idcounty).HasColumnName("IDCounty");
                    
                        modelBuilder.Entity<dboCounty>().Property(it => it.namecounty).HasColumnName("NameCounty");
                    
                        modelBuilder.Entity<dboCounty>().Property(it => it.shortnamecounty).HasColumnName("ShortNameCounty");
                    
                        modelBuilder.Entity<dbotest>().Property(it => it.id).HasColumnName("id");
                    
                        modelBuilder.Entity<dbotest>().Property(it => it.name).HasColumnName("name");
                    
                        modelBuilder.Entity<dboTestAndrei>().Property(it => it.a10).HasColumnName("A10");
                    
                        modelBuilder.Entity<dboTestAndrei>().Property(it => it.a11).HasColumnName("A11");
                    
                        modelBuilder.Entity<dboTestAndrei>().Property(it => it.a12).HasColumnName("A12");
                    
                        modelBuilder.Entity<dboTestAndrei>().Property(it => it.a13).HasColumnName("A13");
                    
                        modelBuilder.Entity<dboTestAndrei>().Property(it => it.a14).HasColumnName("A14");
                    
                        modelBuilder.Entity<dboTestAndrei>().Property(it => it.a15).HasColumnName("A15");
                    
                        modelBuilder.Entity<dboTestAndrei>().Property(it => it.a16).HasColumnName("A16");
                    
                        modelBuilder.Entity<dboTestAndrei>().Property(it => it.a17).HasColumnName("A17");
                    
                        modelBuilder.Entity<dboTestAndrei>().Property(it => it.a18).HasColumnName("A18");
                    
                        modelBuilder.Entity<dboTestAndrei>().Property(it => it.a19).HasColumnName("A19");
                    
                        modelBuilder.Entity<dboTestAndrei>().Property(it => it.a2).HasColumnName("A2");
                    
                        modelBuilder.Entity<dboTestAndrei>().Property(it => it.a20).HasColumnName("A20");
                    
                        modelBuilder.Entity<dboTestAndrei>().Property(it => it.a21).HasColumnName("A21");
                    
                        modelBuilder.Entity<dboTestAndrei>().Property(it => it.a22).HasColumnName("A22");
                    
                        modelBuilder.Entity<dboTestAndrei>().Property(it => it.a23).HasColumnName("A23");
                    
                        modelBuilder.Entity<dboTestAndrei>().Property(it => it.a24).HasColumnName("A24");
                    
                        modelBuilder.Entity<dboTestAndrei>().Property(it => it.a25).HasColumnName("A25");
                    
                        modelBuilder.Entity<dboTestAndrei>().Property(it => it.a26).HasColumnName("A26");
                    
                        modelBuilder.Entity<dboTestAndrei>().Property(it => it.a27).HasColumnName("A27");
                    
                        modelBuilder.Entity<dboTestAndrei>().Property(it => it.a28).HasColumnName("A28");
                    
                        modelBuilder.Entity<dboTestAndrei>().Property(it => it.a29).HasColumnName("A29");
                    
                        modelBuilder.Entity<dboTestAndrei>().Property(it => it.a3).HasColumnName("A3");
                    
                        modelBuilder.Entity<dboTestAndrei>().Property(it => it.a30).HasColumnName("A30");
                    
                        modelBuilder.Entity<dboTestAndrei>().Property(it => it.a31).HasColumnName("A31");
                    
                        modelBuilder.Entity<dboTestAndrei>().Property(it => it.a32).HasColumnName("A32");
                    
                        modelBuilder.Entity<dboTestAndrei>().Property(it => it.a33).HasColumnName("A33");
                    
                        modelBuilder.Entity<dboTestAndrei>().Property(it => it.a34).HasColumnName("A34");
                    
                        modelBuilder.Entity<dboTestAndrei>().Property(it => it.a4).HasColumnName("A4");
                    
                        modelBuilder.Entity<dboTestAndrei>().Property(it => it.a5).HasColumnName("A5");
                    
                        modelBuilder.Entity<dboTestAndrei>().Property(it => it.a6).HasColumnName("A6");
                    
                        modelBuilder.Entity<dboTestAndrei>().Property(it => it.a7).HasColumnName("A7");
                    
                        modelBuilder.Entity<dboTestAndrei>().Property(it => it.a8).HasColumnName("A8");
                    
                        modelBuilder.Entity<dboTestAndrei>().Property(it => it.a9).HasColumnName("A9");
                    
                        modelBuilder.Entity<dboTestAndrei>().Property(it => it.id).HasColumnName("id");
                                OnModelCreatingPartial(modelBuilder);
            Seed(modelBuilder);
        }
        void Seed(ModelBuilder modelBuilder){


            OnSeed(modelBuilder);


        }
        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
        partial void OnSeed(ModelBuilder modelBuilder);       
    }
}