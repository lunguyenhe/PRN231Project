using Microsoft.AspNetCore.Mvc;

namespace PRN231MVC.Controllers
{
	public class ChatController : Controller
	{
		public IActionResult Index()
		{
			return View();
		}
	}
}
