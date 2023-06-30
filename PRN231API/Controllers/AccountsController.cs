using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PRN231API.Models;

namespace PRN231API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountsController : ControllerBase
    {
        [HttpGet]
        public IActionResult Get()
        {
            try
            {
                using (PRN231PROJECTContext context = new PRN231PROJECTContext())
                {
                    var data = context.Accounts.ToList();
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
        [HttpGet("Login")]
        public IActionResult Get(string user,string pass)
        {
            try
            {
                using (PRN231PROJECTContext context = new PRN231PROJECTContext())
                {
                    var data = context.Accounts.ToList().FirstOrDefault(s=>s.Usename.Equals(user)&&s.Password.Equals(pass));
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
                    var data = context.Accounts.ToList().FirstOrDefault(s=>s.AccountId == id);

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
  
        
        [HttpPost]
        public IActionResult Post(Account c)
        {
            try
            {
                using (PRN231PROJECTContext context = new PRN231PROJECTContext())
                {
                    context.Accounts.Add(c);
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
                    Account pro = context.Accounts.ToList().FirstOrDefault(s => s.AccountId == id);
                    context.Accounts.Remove(pro);
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
        public IActionResult Put(Account account)
        {
            try
            {
                using (PRN231PROJECTContext context = new PRN231PROJECTContext())
                {
                    Account account1 = context.Accounts.ToList().FirstOrDefault(s => s.AccountId == account.AccountId);
                    if (account1 == null)
                    {
                        return NotFound();
                    }
                    account1.Usename=account.Usename;
                    account1.Password=account.Password;
                    account1.Role=account.Role;
                   
                    context.Accounts.Update(account1);
                    context.SaveChanges();
                    return Ok();
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }
       
    
}
}
