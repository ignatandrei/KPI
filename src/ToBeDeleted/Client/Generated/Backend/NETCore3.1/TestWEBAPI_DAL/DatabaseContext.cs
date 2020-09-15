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

            public virtual DbSet<NNDvsUniv> NNDvsUniv{ get; set; }
                    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {


            modelBuilder.Entity<NNDvsUniv>()
                .ToTable("NNDvsUniv")
                .HasKey(it=>it.id20200915075727);
         
            OnModelCreatingPartial(modelBuilder);
            Seed(modelBuilder);
        }
        void Seed(ModelBuilder modelBuilder){


                    modelBuilder.Entity<NNDvsUniv>().HasData(
                        new NNDvsUniv(){ id20200915075727 = 1 , salesrepname = @"Dan Ardoare", noofcustomerswithshipment = 100M, universenooftotalcustomersfromsalesreparea = 300M });
                    
                    modelBuilder.Entity<NNDvsUniv>().HasData(
                        new NNDvsUniv(){ id20200915075727 = 2 , salesrepname = @"Tania Mul", noofcustomerswithshipment = 300M, universenooftotalcustomersfromsalesreparea = 200M });
                    
            OnSeed(modelBuilder);


        }
        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
        partial void OnSeed(ModelBuilder modelBuilder);       
    }
}