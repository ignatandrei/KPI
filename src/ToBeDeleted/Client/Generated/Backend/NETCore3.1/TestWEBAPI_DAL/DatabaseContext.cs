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
            
            public virtual DbSet<dboCountry> dboCountry{ get; set; }
            
            public virtual DbSet<dboCounty> dboCounty{ get; set; }
            
            public virtual DbSet<dboKPI11> dboKPI11{ get; set; }
            
            public virtual DbSet<dbovwACTPL_Ass_Clients> dbovwACTPL_Ass_Clients{ get; set; }
            
            public virtual DbSet<dbovwAssClients> dbovwAssClients{ get; set; }
            
            public virtual DbSet<dbovwAssManager> dbovwAssManager{ get; set; }
            
            public virtual DbSet<dbovwClientsBase> dbovwClientsBase{ get; set; }
            
            public virtual DbSet<dbovwClientsCountryCategory> dbovwClientsCountryCategory{ get; set; }
            
            public virtual DbSet<dbovwCounty> dbovwCounty{ get; set; }
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
         
            modelBuilder.Entity<dboCountry>()
                .ToTable("Country","dbo")
                .HasKey(it=>it.idcountry);
         
            modelBuilder.Entity<dboCounty>()
                .ToTable("County","dbo")
                .HasKey(it=>it.idcounty);
         
            modelBuilder.Entity<dboKPI11>()
                .ToView("KPI11","dbo")
                .HasNoKey();
         
            modelBuilder.Entity<dbovwACTPL_Ass_Clients>()
                .ToView("vwACTPL_Ass_Clients","dbo")
                .HasNoKey();
         
            modelBuilder.Entity<dbovwAssClients>()
                .ToView("vwAssClients","dbo")
                .HasNoKey();
         
            modelBuilder.Entity<dbovwAssManager>()
                .ToView("vwAssManager","dbo")
                .HasNoKey();
         
            modelBuilder.Entity<dbovwClientsBase>()
                .ToView("vwClientsBase","dbo")
                .HasNoKey();
         
            modelBuilder.Entity<dbovwClientsCountryCategory>()
                .ToView("vwClientsCountryCategory","dbo")
                .HasNoKey();
         
            modelBuilder.Entity<dbovwCounty>()
                .ToView("vwCounty","dbo")
                .HasNoKey();
         
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