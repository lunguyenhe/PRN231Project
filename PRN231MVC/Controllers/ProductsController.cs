using Microsoft.AspNetCore.Mvc;
using System.Net.Http.Headers;
using System.Text.Json;
using System.Text;
using PRN231API.Models;
using System.Text.Json.Serialization;

namespace PRN231MVC.Controllers
{
    public class ProductsController : Controller
    {
        private readonly HttpClient client = null;
        private string ProductApiUrl = "";
        private string CommnetApiUrl = "";
        public ProductsController()
        {
            client = new HttpClient();
            var contentType = new MediaTypeWithQualityHeaderValue("application/json");
            client.DefaultRequestHeaders.Accept.Add(contentType);
            ProductApiUrl = "http://localhost:5148/api/Products";

			CommnetApiUrl = "http://localhost:5148/api/Comments";

        }
        public async Task<IActionResult> Index2()
		{ return View(); }

			public async Task<IActionResult> Index()
        {
			//HttpResponseMessage responseMessage = await client.GetAsync(ProductApiUrl);
			//// HttpResponseMessage responseMessage = await client.GetAsync(ProductApiUrl);

			//string strdata = await responseMessage.Content.ReadAsStringAsync();
			//var options = new JsonSerializerOptions
			//{
			//	PropertyNameCaseInsensitive = true,
			//	ReferenceHandler = ReferenceHandler.Preserve,
			//	MaxDepth = 64,
			//};
			//List<Product> products = JsonSerializer.Deserialize<List<Product>>(strdata, options);
	
			return View();

		
        }
		public async Task<IActionResult> Details(int id)
        {
			HttpResponseMessage responseMessageComment = await client.GetAsync(CommnetApiUrl + "/id?id=" + id);
			HttpResponseMessage responseMessage = await client.GetAsync(ProductApiUrl + "/id?id=" + id);
			string strdata = await responseMessage.Content.ReadAsStringAsync();
			string strdatacomment = await responseMessageComment.Content.ReadAsStringAsync();
			var options = new JsonSerializerOptions
			{
				PropertyNameCaseInsensitive = true,
				ReferenceHandler = ReferenceHandler.Preserve,
				MaxDepth = 64,
			};
			Product products = JsonSerializer.Deserialize<Product>(strdata, options);
			List<Comment> comment = JsonSerializer.Deserialize<List<Comment>>(strdatacomment, options);
			if (products == null)
            {
				string errorMessage = $"Failed to add product. Status code: {responseMessage.StatusCode}";
				return View("Error", errorMessage);
			}
            if(comment != null)
            {
                ViewData["ListComment"] = comment;
            }
			ViewData["product"] = products;

			return View();
        }
        public async Task<IActionResult> Details1(int id)
        {
		
			HttpResponseMessage responseMessage = await client.GetAsync(ProductApiUrl + "/id?id=" + id);
			string strdata = await responseMessage.Content.ReadAsStringAsync();
		
			var options = new JsonSerializerOptions
			{
				PropertyNameCaseInsensitive = true,
				ReferenceHandler = ReferenceHandler.Preserve,
				MaxDepth = 64,
			};
			Product product = JsonSerializer.Deserialize<Product>(strdata, options);
			
			if (product == null)
            {
				string errorMessage = $"Failed to add product. Status code: {responseMessage.StatusCode}";
				return View("Error", errorMessage);
			}
            ViewData["product"] = product; 
          
			return View();
        }
        public async Task<IActionResult> Index1()
        {

            HttpResponseMessage responseMessage = await client.GetAsync(ProductApiUrl);
            // HttpResponseMessage responseMessage = await client.GetAsync(ProductApiUrl);

            string strdata = await responseMessage.Content.ReadAsStringAsync();
            var options = new JsonSerializerOptions
            {
                PropertyNameCaseInsensitive = true,
            };
            List<Product> products = JsonSerializer.Deserialize<List<Product>>(strdata,options);
            return View(products);
        }
        public async Task<IActionResult> Create(Product product)
        {
            if (product != null)
            {
                string err = product.ProductName;
                return View("Create");
            }
            else
            {
                var jsonContent = new StringContent(JsonSerializer.Serialize(product), Encoding.UTF8, "application/json");
                HttpResponseMessage responseMessage = await client.PostAsync(ProductApiUrl, jsonContent);
                if (responseMessage.IsSuccessStatusCode)
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    string errorMessage = $"Failed to add product. Status code: {responseMessage.StatusCode}";
                    return View("Error", errorMessage);
                }
            }


        }



        public async Task<IActionResult> Delete(int id)
        {
            HttpResponseMessage responseMessage = await client.DeleteAsync(ProductApiUrl+"/Delete?id=" + id);
            if (responseMessage.IsSuccessStatusCode)
            {
                return RedirectToAction("Index");
            }
            else
            {
                return RedirectToAction("Error");
            }
        }
    }
}

