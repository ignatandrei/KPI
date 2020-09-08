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
        public virtual DbSet<SalesRep> SalesRep { get; set; }

        public virtual DbSet<SRCkienti> SRCkienti { get; set; }
        public virtual DbSet<TargetSR> TargetSR { get; set; }

        public virtual DbSet<ValueSR> ValueSR { get; set; }
        public virtual DbSet<Client> Client{ get; set; }
            
            public virtual DbSet<CifreAnuale> CifreAnuale{ get; set; }
                    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<SalesRep>()
                .ToTable("SalesRep")
                .HasKey(it => it.id20200908075449);

            modelBuilder.Entity<SRCkienti>()
                .ToTable("SRCkienti")
                .HasKey(it => it.id20200908075449);
            modelBuilder.Entity<Client>()
                .ToTable("Client")
                .HasKey(it=>it.id20200908075419);
         
            modelBuilder.Entity<CifreAnuale>()
                .ToTable("CifreAnuale")
                .HasKey(it=>it.id20200908075419);

            modelBuilder.Entity<TargetSR>()
               .ToTable("TargetSR")
               .HasKey(it => it.id20200908075619);

            modelBuilder.Entity<ValueSR>()
                .ToTable("ValueSR")
                .HasKey(it => it.id20200908075619);

            OnModelCreatingPartial(modelBuilder);
            Seed(modelBuilder);
        }
        void Seed(ModelBuilder modelBuilder){



            modelBuilder.Entity<SalesRep>().HasData(
                     new SalesRep() { id20200908075449 = 1, nume = @"Mihai", prenume = @"Ardoare" });

            modelBuilder.Entity<SalesRep>().HasData(
                new SalesRep() { id20200908075449 = 2, nume = @"Nadia", prenume = @"Marcov" });

            modelBuilder.Entity<SRCkienti>().HasData(
                new SRCkienti() { id20200908075449 = 1, sr = @"Mihai Ardoare", client = @"Tropsanu SRL" });

            modelBuilder.Entity<SRCkienti>().HasData(
                new SRCkienti() { id20200908075449 = 2, sr = @"Nadia Marcov", client = @"Miraflos SA" });

            modelBuilder.Entity<SRCkienti>().HasData(
                new SRCkienti() { id20200908075449 = 3, sr = @"Mihai Ardoare", client = @"Halbag SRL" });

            modelBuilder.Entity<SRCkienti>().HasData(
                new SRCkienti() { id20200908075449 = 4, sr = @"Nadia Marcov", client = @"Primus SA" });


            modelBuilder.Entity<TargetSR>().HasData(
                new TargetSR() { id20200908075619 = 1, namesr = @"Mihai Ardoare", targetvalue = 1500M, dataoftarget = 43835M });

            modelBuilder.Entity<TargetSR>().HasData(
                new TargetSR() { id20200908075619 = 2, namesr = @"Nadia Marcov", targetvalue = 200M, dataoftarget = 43835M });

            modelBuilder.Entity<ValueSR>().HasData(
                new ValueSR() { id20200908075619 = 1, namesr = @"Mihai Ardoare", valuesr = 1500M, dataoftarget = 43835M });

            modelBuilder.Entity<ValueSR>().HasData(
                new ValueSR() { id20200908075619 = 2, namesr = @"Nadia Marcov", valuesr = 200M, dataoftarget = 43835M });


            modelBuilder.Entity<Client>().HasData(
                        new Client(){ id20200908075419 = 1 , name = @"Tropsanu SRL" });
                    
                    modelBuilder.Entity<Client>().HasData(
                        new Client(){ id20200908075419 = 2 , name = @"Miraflos SA" });
                    
                    modelBuilder.Entity<Client>().HasData(
                        new Client(){ id20200908075419 = 3 , name = @"Halbag SRL" });
                    
                    modelBuilder.Entity<Client>().HasData(
                        new Client(){ id20200908075419 = 4 , name = @"Primus SA" });
                    
                    modelBuilder.Entity<CifreAnuale>().HasData(
                        new CifreAnuale(){ id20200908075419 = 1 , name = @"Tropsanu SRL", an = 2019M, valoarevinduta = 209M, plan = 200M });
                    
                    modelBuilder.Entity<CifreAnuale>().HasData(
                        new CifreAnuale(){ id20200908075419 = 2 , name = @"Miraflos SA", an = 2019M, valoarevinduta = 314M, plan = 300M });
                    
                    modelBuilder.Entity<CifreAnuale>().HasData(
                        new CifreAnuale(){ id20200908075419 = 3 , name = @"Halbag SRL", an = 2019M, valoarevinduta = 42M, plan = 50M });
                    
                    modelBuilder.Entity<CifreAnuale>().HasData(
                        new CifreAnuale(){ id20200908075419 = 4 , name = @"Primus SA", an = 2019M, valoarevinduta = 4323M, plan = 5000M });
                    
                    modelBuilder.Entity<CifreAnuale>().HasData(
                        new CifreAnuale(){ id20200908075419 = 5 , name = @"Tropsanu SRL", an = 2020M, valoarevinduta = 200M, plan = 230M });
                    
                    modelBuilder.Entity<CifreAnuale>().HasData(
                        new CifreAnuale(){ id20200908075419 = 6 , name = @"Miraflos SA", an = 2020M, valoarevinduta = 270M, plan = 330M });
                    
                    modelBuilder.Entity<CifreAnuale>().HasData(
                        new CifreAnuale(){ id20200908075419 = 7 , name = @"Halbag SRL", an = 2020M, valoarevinduta = 34M, plan = 50M });
                    
                    modelBuilder.Entity<CifreAnuale>().HasData(
                        new CifreAnuale(){ id20200908075419 = 8 , name = @"Primus SA", an = 2020M, valoarevinduta = 3000M, plan = 4500M });
                    
            OnSeed(modelBuilder);


        }
        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
        partial void OnSeed(ModelBuilder modelBuilder);       
    }
}