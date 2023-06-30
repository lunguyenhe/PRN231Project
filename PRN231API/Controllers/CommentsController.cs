using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PRN231API.Models;
using System.Xml.Linq;

namespace PRN231API.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class CommentsController : ControllerBase
	{
		[HttpGet]
		public IActionResult Get()
		{
			try
			{
				using (PRN231PROJECTContext context = new PRN231PROJECTContext())
				{
					var data = context.Comments.Include(c=>c.Customer).ToList();
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
					var data = context.Comments.Include(d=>d.Customer).ToList().FindAll(s => s.ProductId == id);

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
					var data = context.Comments.ToList().FirstOrDefault(s => s.Comment1.Contains(name));
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
		public IActionResult Post(Comment c)
		{
			try
			{
				using (PRN231PROJECTContext context = new PRN231PROJECTContext())
				{
					context.Comments.Add(c);
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
					Comment pro = context.Comments.ToList().FirstOrDefault(s => s.CommentId == id);
					context.Comments.Remove(pro);
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
		public IActionResult Put(Comment comment)
		{
			try
			{
				using (PRN231PROJECTContext context = new PRN231PROJECTContext())
				{
					Comment comment1 = context.Comments.ToList().FirstOrDefault(s => s.CommentId == comment.CommentId);
					if (comment1 == null)
					{
						return NotFound();
					}
					comment1.Comment1 = comment.Comment1;
					comment1.ProductId = comment.ProductId;
					comment1.HelpfulVotes = comment.HelpfulVotes;
					comment1.UnhelpfulVotes = comment.UnhelpfulVotes;
					comment1.EmployeeReply = comment.EmployeeReply;
					comment1.RatingStars = comment.RatingStars;
					context.Comments.Update(comment1);
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
		[HttpGet("oderbystart")]
		public IActionResult GetOrder()
		{
			try
			{
				using (PRN231PROJECTContext context = new PRN231PROJECTContext())
				{
					var data = context.Comments.OrderByDescending(s => s.RatingStars).ToList();
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
