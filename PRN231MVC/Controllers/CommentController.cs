using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PRN231API.Models;
using System.Net.Http.Headers;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace PRN231MVC.Controllers
{
	public class CommentController : Controller
	{
		private readonly HttpClient client = null;
		private string CommentApiUrl = "";
		private string ProductApiUrlCreate = "";
		public CommentController()
		{
			client = new HttpClient();
			var contentType = new MediaTypeWithQualityHeaderValue("application/json");
			client.DefaultRequestHeaders.Accept.Add(contentType);
            CommentApiUrl = "http://localhost:5148/api/Comments";
			// ProductApiUrlDelete = "http://localhost:5148/api/Products";

		}
		public async Task<IActionResult> Index()
		{
			HttpResponseMessage responseMessage = await client.GetAsync(CommentApiUrl);
	
			string strdata = await responseMessage.Content.ReadAsStringAsync();
            var options = new JsonSerializerOptions
			{
				PropertyNameCaseInsensitive = true,
			
			};
			Console.WriteLine(strdata);
			List<Comment> comment = JsonConvert.DeserializeObject<List<Comment>>(strdata);
            return View(comment);


		}
        public async Task<IActionResult> Details(int id)
        {
            HttpResponseMessage responseMessageComment = await client.GetAsync(CommentApiUrl + "/id?id=" + id);
          
          
            string strdatacomment = await responseMessageComment.Content.ReadAsStringAsync();
            var options = new JsonSerializerOptions
            {
                PropertyNameCaseInsensitive = true,
            };
			try
			{
                List<Comment> comment = JsonConvert.DeserializeObject<List<Comment>>(strdatacomment);
                if (comment == null)
                {
                    string errorMessage = $"Failed to add comment. Status code: {responseMessageComment.StatusCode}";
                    return View("Error", errorMessage);
                }
                // ViewData["ListComment"] = comment;
                return View(comment);
            }
            catch (Exception ex)
			{
                string errorMessage = $"Failed to add comment. Status code: {ex.Message}";
                return View("Error", errorMessage);
            }
            	
           
        }
		public async Task<IActionResult> Create(Comment comment)
		{
			comment.ProductId = int.Parse(Request.Form["id"]);
			comment.CustomerId = 1;
			comment.Comment1 = Request.Form["review"];
			comment.RatingStars = int.Parse(Request.Form["rating"]);
			comment.CreatedAt = DateTime.Now;
			if (comment == null)
			{
				string errorMessage = $"Failed to add comment. "; 
				return View("Error", errorMessage);
			}
			else
			{
				var jsonContent = new StringContent(JsonConvert.SerializeObject(comment), Encoding.UTF8, "application/json");
				HttpResponseMessage responseMessage = await client.PostAsync(CommentApiUrl, jsonContent);
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
	}
}
