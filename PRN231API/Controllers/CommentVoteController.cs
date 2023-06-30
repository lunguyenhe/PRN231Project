using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PRN231API.Models;

namespace PRN231API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CommentVoteController : ControllerBase
    {
        [HttpGet]
        public IActionResult Get()
        {
            try
            {
                using (PRN231PROJECTContext context = new PRN231PROJECTContext())
                {
                    var data = context.CommentVotes.ToList();
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
                    var data = context.CommentVotes.ToList().FirstOrDefault(s => s.CommentId == id);

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
        public IActionResult Post(CommentVote c)
        {
            try
            {
                using (PRN231PROJECTContext context = new PRN231PROJECTContext())
                {
                    context.CommentVotes.Add(c);
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
                    CommentVote pro = context.CommentVotes.ToList().FirstOrDefault(s => s.CommentId == id);
                    context.CommentVotes.Remove(pro);
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
        public IActionResult Put(CommentVote commentVote)
        {
            try
            {
                using (PRN231PROJECTContext context = new PRN231PROJECTContext())
                {
                    CommentVote c = context.CommentVotes.ToList().FirstOrDefault(s => s.CommentId == commentVote.CommentId);
                    if (c == null)
                    {
                        return NotFound();
                    }
                    c.VoteType = commentVote.VoteType;

                    context.CommentVotes.Update(c);
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
