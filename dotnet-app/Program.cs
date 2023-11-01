var contentRootPath = Directory.GetCurrentDirectory();
if (!String.IsNullOrWhiteSpace(Environment.GetEnvironmentVariable("CONTENT_ROOT")))
{
    contentRootPath = Environment.GetEnvironmentVariable("CONTENT_ROOT");
}

WebApplicationOptions options = new WebApplicationOptions
{
    ContentRootPath = contentRootPath
};

var builder = WebApplication.CreateBuilder(options);
builder.Services.AddRazorPages();

Console.WriteLine($"Content root: {builder.Environment.ContentRootPath}");

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapRazorPages();

app.Run();