using Microsoft.AspNetCore.Mvc;

[ApiController]
[Route("/")] // 👈 root path
public class HomeController : ControllerBase
{
    [HttpGet]
    public IActionResult Get()
    {
        return Content(@"
        <html>
            <head><title>Welcome</title></head>
            <body style='font-family:sans-serif;text-align:center;margin-top:50px;'>
                <h1>Welcome to Chemical Report API</h1>
                <p>Use <a href='/ChemicalReportAPI/swagger'>Swagger</a> to explore the endpoints.</p>
            </body>
        </html>", "text/html");
    }
}
