using System;
using System.Collections.Generic;

namespace PRN231API.Models
{
    public partial class Account
    {
        public Account()
        {
            Customers = new HashSet<Customer>();
            Employees = new HashSet<Employee>();
        }

        public int AccountId { get; set; }
        public string Usename { get; set; } = null!;
        public string Password { get; set; } = null!;
        public int Role { get; set; }

        public virtual ICollection<Customer>? Customers { get; set; }
        public virtual ICollection<Employee>? Employees { get; set; }
    }
}
