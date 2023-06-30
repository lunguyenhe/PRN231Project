using System;
using System.Collections.Generic;

namespace PRN231API.Models
{
    public partial class Employee
    {
        public Employee()
        {
            Comments = new HashSet<Comment>();
        }

        public int EmployeeId { get; set; }
        public string FirstName { get; set; } = null!;
        public string LastName { get; set; } = null!;
        public string Email { get; set; } = null!;
        public DateTime? HireDate { get; set; }
        public decimal? Salary { get; set; }
        public string? Address { get; set; }
        public int? AccountId { get; set; }

        public virtual Account? Account { get; set; }
        public virtual ICollection<Comment> Comments { get; set; }
    }
}
