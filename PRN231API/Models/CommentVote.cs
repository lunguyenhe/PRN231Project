using System;
using System.Collections.Generic;

namespace PRN231API.Models
{
    public partial class CommentVote
    {
        public int? CommentId { get; set; }
        public int? CustomerId { get; set; }
        public string? VoteType { get; set; }

        public virtual Comment? Comment { get; set; }
        public virtual Customer? Customer { get; set; }
    }
}
