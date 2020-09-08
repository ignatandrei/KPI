
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
                    
			services.AddTransient<IRepository<Client,long>, Client_Repository>();;
            
			services.AddTransient<IRepository<CifreAnuale,long>, CifreAnuale_Repository>();;

            services.AddTransient<IRepository<SalesRep, long>, SalesRep_Repository>(); ;

            services.AddTransient<IRepository<SRCkienti, long>, SRCkienti_Repository>();
            services.AddTransient<IRepository<TargetSR, long>, TargetSR_Repository>(); ;

            services.AddTransient<IRepository<ValueSR, long>, ValueSR_Repository>(); ;

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
                

			endpoints.MapFallbackToFile("client/{**slug}","/index.html");
            
			endpoints.MapFallbackToFile("cifreanuale/{**slug}","/index.html");
                endpoints.MapFallbackToFile("salesrep/{**slug}", "/index.html");

                endpoints.MapFallbackToFile("srckienti/{**slug}", "/index.html");
                endpoints.MapFallbackToFile("targetsr/{**slug}", "/index.html");

                endpoints.MapFallbackToFile("valuesr/{**slug}", "/index.html");

                endpoints.MapControllers();
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