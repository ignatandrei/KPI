
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using NetCore2Blockly;
using TestWebAPI_BL;
using TestWEBAPI_DAL;

namespace TestWebAPI
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {

            // add swagger
            // add blockly 
			services.AddBlockly();
            // add logging
            services.AddCors();
            services.AddControllers();
            services.AddDbContext<DatabaseContext>(options => 

{
                        var conStr = Configuration.GetConnectionString("DefaultConnection");
                        if(string.IsNullOrWhiteSpace(conStr)){
                            options.UseInMemoryDatabase("myInMemory");
                        }
                        else{
                            options.UseSqlServer(conStr);
                        }
                    
                    
                            
                    });
                    
			services.AddTransient<IRepository<dboACTPL,Int64>, dboACTPL_Repository>();;
            
			services.AddTransient<IRepository<dboAssVA,Int64>, dboAssVA_Repository>();;
            
			services.AddTransient<IRepository<dboAssVAClientsCounties,Int64>, dboAssVAClientsCounties_Repository>();;
            
			services.AddTransient<IRepository<dboCategory,Int32>, dboCategory_Repository>();;
            
			services.AddTransient<IRepository<dboClients,Int64>, dboClients_Repository>();;
            
			services.AddTransient<IRepository<dboClientsCategory,Int64>, dboClientsCategory_Repository>();;
            
			services.AddTransient<IRepository<dboClientsCounties,Int64>, dboClientsCounties_Repository>();;
            
			services.AddTransient<IRepository<dboCountry,Int32>, dboCountry_Repository>();;
            
			services.AddTransient<IRepository<dboCounty,Int64>, dboCounty_Repository>();;
            
			services.AddTransient<IRepositoryView<dboKPI11>, dboKPI11_Repository>();;
            
			services.AddTransient<IRepositoryView<dbovwACTPL_Ass_Clients>, dbovwACTPL_Ass_Clients_Repository>();;
            
			services.AddTransient<IRepositoryView<dbovwAssClients>, dbovwAssClients_Repository>();;
            
			services.AddTransient<IRepositoryView<dbovwAssManager>, dbovwAssManager_Repository>();;
            
			services.AddTransient<IRepositoryView<dbovwClientsBase>, dbovwClientsBase_Repository>();;
            
			services.AddTransient<IRepositoryView<dbovwClientsCountryCategory>, dbovwClientsCountryCategory_Repository>();;
            
			services.AddTransient<IRepositoryView<dbovwCounty>, dbovwCounty_Repository>();;
             
         }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
			
			app.UseBlockly();
            app.UseBlocklyUI();
            
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
//put in a json settings file
            app
                .UseCors(opt =>
                {
                    opt.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader();
                });
            
            app.UseHttpsRedirection();

            app.UseDefaultFiles();
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                

			endpoints.MapFallbackToFile("dboactpl/{**slug}","/index.html");
            
			endpoints.MapFallbackToFile("dboassva/{**slug}","/index.html");
            
			endpoints.MapFallbackToFile("dboassvaclientscounties/{**slug}","/index.html");
            
			endpoints.MapFallbackToFile("dbocategory/{**slug}","/index.html");
            
			endpoints.MapFallbackToFile("dboclients/{**slug}","/index.html");
            
			endpoints.MapFallbackToFile("dboclientscategory/{**slug}","/index.html");
            
			endpoints.MapFallbackToFile("dboclientscounties/{**slug}","/index.html");
            
			endpoints.MapFallbackToFile("dbocountry/{**slug}","/index.html");
            
			endpoints.MapFallbackToFile("dbocounty/{**slug}","/index.html");
            
			endpoints.MapFallbackToFile("dbokpi11/{**slug}","/index.html");
            
			endpoints.MapFallbackToFile("dbovwactpl_ass_clients/{**slug}","/index.html");
            
			endpoints.MapFallbackToFile("dbovwassclients/{**slug}","/index.html");
            
			endpoints.MapFallbackToFile("dbovwassmanager/{**slug}","/index.html");
            
			endpoints.MapFallbackToFile("dbovwclientsbase/{**slug}","/index.html");
            
			endpoints.MapFallbackToFile("dbovwclientscountrycategory/{**slug}","/index.html");
            
			endpoints.MapFallbackToFile("dbovwcounty/{**slug}","/index.html");
                         
                endpoints.MapControllers();
                endpoints.MapFallbackToFile("{**slug}", "/index.html");
            });
            CreateDatabase(app);
            
        }
        private void CreateDatabase(IApplicationBuilder app){
            using var scope = app.ApplicationServices.CreateScope();
            using var context = scope.ServiceProvider.GetService<DatabaseContext>();
            context.Database.EnsureCreated();
        }
    }
}
