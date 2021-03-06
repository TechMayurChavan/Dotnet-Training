using Core6_Internationalization.Services;
using Microsoft.AspNetCore.Mvc.Razor;
var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

// 1. 
builder.Services.AddLocalization(options => options.ResourcesPath = "Resources");

// Add services to the container.
// 2. 
builder.Services.AddControllersWithViews()
    .AddViewLocalization
    (LanguageViewLocationExpanderFormat.SubFolder)
    .AddDataAnnotationsLocalization();

// 3. 
builder.Services.Configure<RequestLocalizationOptions>(options => {
    var supportedCultures = new[] { "en-US", "fr", "de" };
    options.SetDefaultCulture(supportedCultures[0])
        .AddSupportedCultures(supportedCultures)
        .AddSupportedUICultures(supportedCultures);
});

builder.Services.AddScoped<ProductService>();


var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

// 4. 
var supportedCultures = new[] { "en-US", "fr", "de" };
// 5. 
// Culture from the HttpRequest
var localizationOptions = new RequestLocalizationOptions()
    .SetDefaultCulture(supportedCultures[0])
    .AddSupportedCultures(supportedCultures)
    .AddSupportedUICultures(supportedCultures);

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
