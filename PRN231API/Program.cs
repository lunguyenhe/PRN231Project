using System.Text.Json.Serialization;

namespace PRN231API
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

			// Add services to the container.

			builder.Services.AddControllers();
			// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
			builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen();
			builder.Services.AddCors(act =>
			{
				act.AddPolicy("_MainPolicy", options =>
				{
					options.AllowAnyHeader();
					options.AllowAnyMethod();
					options.AllowAnyOrigin();
				});
			});
			var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
            }
          
            app.UseAuthorization();

			app.UseCors("_MainPolicy");
			app.MapControllers();

            app.Run();
        }
    }
}