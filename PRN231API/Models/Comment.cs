using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace PRN231API.Models
{
    public partial class Comment
    {
        public int CommentId { get; set; }
        public int? ProductId { get; set; }
        public int? CustomerId { get; set; }
        public string? Comment1 { get; set; }
        public DateTime? CreatedAt { get; set; }
        public int HelpfulVotes { get; set; }
        public int UnhelpfulVotes { get; set; }
        public int RatingStars { get; set; }
        public string? EmployeeReply { get; set; }
        public int? EmployeeId { get; set; }
	
        public virtual Customer? Customer { get; set; }
        public virtual Employee? Employee { get; set; }
        public virtual Product? Product { get; set; }
    }
}
