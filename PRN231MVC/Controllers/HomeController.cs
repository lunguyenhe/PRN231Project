using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using PRN231API.Models;
using PRN231MVC.Models;
using System.Diagnostics;
using System.Text.Json;

namespace PRN231MVC.Controllers
{
    public class HomeController : Controller
    {
        string AccApiUrl = "http://localhost:5148/api/Accounts";
		public IActionResult Index()
        {
			ViewBag.Layout = false;

			return View("Index");
		}
        public async Task<IActionResult> LoginAsync(string username, string password)
        {

            if (string.IsNullOrEmpty(username))
            {
                return View();
            }
            using (HttpClient client = new HttpClient())
            {

                using (HttpResponseMessage res = await client.GetAsync(AccApiUrl + "/Login?user=" + username + "&pass=" + password))
                {
                    using (HttpContent content = res.Content)
                    {
                        string data = await content.ReadAsStringAsync();
                        //   Console.WriteLine($"{data}");
                        Account account = JsonSerializer.Deserialize<Account>(data);
                        if (account== null)
                        {

                            ViewData["message"] = "Do not have that account!";
                        }
                        else
                        {
                            if (account.Role == 1)
                            {

                                HttpContext.Session.SetInt32("role", account.Role);
                                HttpContext.Session.SetString("user", username);
                                return RedirectToAction("Index", "Product");
                            }
                            else
                            {
                                HttpContext.Session.SetInt32("role", account.Role);
                                HttpContext.Session.SetString("user", username);
                                return RedirectToAction("Index", "Product");
                            }

                        }


                    }
                }
                return View();
            }
        }

        public IActionResult Product()
        {


            return View();
        }
        public IActionResult Details()
        {


            return View();
        }
    }
}