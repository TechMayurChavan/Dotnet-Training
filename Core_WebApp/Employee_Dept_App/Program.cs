using Employee_Dept_App.Models;
using Employee_Dept_App.Services;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
//1. REgister the DbContext in Dependency COntainer as a Service
builder.Services.AddDbContext<Enterprise1Context>(options =>
{
    options.UseSqlServer(builder.Configuration.GetConnectionString("AppConnStr"));
});

// 2. Register Custom Service in DI COntainer
builder.Services.AddScoped<IServices<Employee, int>, EmployeeServices>();
builder.Services.AddScoped<IServices<Department, int>, DeptService>();

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
