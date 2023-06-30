using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PRN231API.Models;

namespace PRN231API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoryController : ControllerBase
    {
        [HttpGet]
        public IActionResult Get()
        {
            try
            {
                using (PRN231PROJECTContext context = new PRN231PROJECTContext())
                {
                    var data = context.Categories.ToList();
                    if (data == null)
                    {
                        return NotFound();
                    }
                    return Ok(data);
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }
    }
}
