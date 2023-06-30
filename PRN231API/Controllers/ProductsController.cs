using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PRN231API.Models;

namespace PRN231API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        [HttpGet]
        public IActionResult Get()
        {
            try
            {
                using (PRN231PROJECTContext context = new PRN231PROJECTContext())
                {
                    var data = context.Products.ToList();
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
        [HttpGet("id")]
        public IActionResult Get(int id)
        {
            try
            {
                using (PRN231PROJECTContext context = new PRN231PROJECTContext())
                {
                    var data = context.Products.Include(c => c.Brand).Include(d => d.Category).ToList().
                     FirstOrDefault(s => s.ProductId == id);

					if (data == null)
					{
						return NotFound();
					}

                
                    //var category = context.Categories.FirstOrDefault(s => s.CategoryId == data.CategoryId);
                    //data.Category = category;
			
					return Ok(data);
				}
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }
        //  Search by name
        [HttpGet("name")]
        public IActionResult Get(string name)
        {
            try
            {
                using (PRN231PROJECTContext context = new PRN231PROJECTContext())
                {
                    var data = context.Products.ToList().FirstOrDefault(s => s.ProductName.Contains(name));
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
        [HttpGet("cate")]
        public IActionResult GetProductbycate(int  cate)
        {
            try
            {
                using (PRN231PROJECTContext context = new PRN231PROJECTContext())
                {
                    var data = context.Products.ToList().FindAll(s => s.CategoryId==cate);
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
        [HttpPost]
        public IActionResult Post(Product p)
        {
            try
            {
                using (PRN231PROJECTContext context = new PRN231PROJECTContext())
                {
                    context.Products.Add(p);
                    context.SaveChanges();
                    return Ok();
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }
        [HttpDelete("id")]
        public IActionResult Delete(int id)
        {
            try
            {
                using (PRN231PROJECTContext context = new PRN231PROJECTContext())
                {
                    Product pro = context.Products.ToList().FirstOrDefault(s => s.ProductId == id);
                    context.Products.Remove(pro);
                    context.SaveChanges();
                    //c2
                    //if (Get(id) == NotFound())
                    //{
                    //    return NotFound();
                    //}
                    //else
                    //{
                    //    context.Categories.Remove(cate);
                    //}
                    return Ok();
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }
        [HttpPut]
        public IActionResult Put(Product pro)
        {
            try
            {
                using (PRN231PROJECTContext context = new PRN231PROJECTContext())
                {
                    Product pro1 = context.Products.ToList().FirstOrDefault(s => s.ProductId == pro.ProductId);
                    if (pro1 == null)
                    {
                        return NotFound();
                    }
                    pro1.CategoryId = pro.CategoryId;
                    pro1.BrandId = pro.BrandId;
                    pro1.ProductName = pro.ProductName;
                    pro1.Width = pro.Width;
                    pro1.AverageRating = pro.AverageRating;
           
                    context.Products.Update(pro1);
                    context.SaveChanges();
                    return Ok();
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }
        //api/Category//Oder by name
        [HttpGet("oderbyname")]
        public IActionResult GetOrder()
        {
            try
            {
                using (PRN231PROJECTContext context = new PRN231PROJECTContext())
                {
                    var data = context.Products.OrderByDescending(s => s.ProductName).ToList();
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

