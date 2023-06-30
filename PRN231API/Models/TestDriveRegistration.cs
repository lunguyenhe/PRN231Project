using System;
using System.Collections.Generic;

namespace PRN231API.Models
{
    public partial class TestDriveRegistration
    {
        public int RegistrationId { get; set; }
        public int ProductId { get; set; }
        public int? CustomerId { get; set; }
        public string FullName { get; set; } = null!;
        public string PhoneNumber { get; set; } = null!;
        public string Email { get; set; } = null!;
        public DateTime TestDriveDate { get; set; }

        public virtual Customer? Customer { get; set; }
        public virtual Product Product { get; set; } = null!;
    }
}
