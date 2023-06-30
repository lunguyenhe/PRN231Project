using System;
using System.Collections.Generic;

namespace PRN231API.Models
{
    public partial class Customer
    {
        public Customer()
        {
            Comments = new HashSet<Comment>();
            TestDriveRegistrations = new HashSet<TestDriveRegistration>();
        }

        public int CustomerId { get; set; }
        public string FirstName { get; set; } = null!;
        public string LastName { get; set; } = null!;
        public string Email { get; set; } = null!;
        public string? PhoneNumber { get; set; }
        public string? Address { get; set; }
        public int? AccountId { get; set; }

        public virtual Account? Account { get; set; }
        public virtual ICollection<Comment> Comments { get; set; }
        public virtual ICollection<TestDriveRegistration> TestDriveRegistrations { get; set; }
    }
}
