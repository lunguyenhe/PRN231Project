using System;
using System.Collections.Generic;

namespace PRN231API.Models
{
    public partial class Product
    {
        public Product()
        {
            Comments = new HashSet<Comment>();
            TestDriveRegistrations = new HashSet<TestDriveRegistration>();
        }

        public int ProductId { get; set; }
        public string ProductName { get; set; } = null!;
        public string? Description { get; set; }
        public double? Length { get; set; }
        public double? Width { get; set; }
        public double? Height { get; set; }
        public double? Weight { get; set; }
        public double? Wheelbase { get; set; }
        public string? ImageUrl { get; set; }
        public string? ImageUrl2 { get; set; }
        public string? ImageUrl3 { get; set; }
        public decimal Price { get; set; }
        public double AverageRating { get; set; }
        public int? CategoryId { get; set; }
        public int? BrandId { get; set; }

        public virtual Brand? Brand { get; set; }
        public virtual Category? Category { get; set; }
        public virtual ICollection<Comment> Comments { get; set; }
        public virtual ICollection<TestDriveRegistration> TestDriveRegistrations { get; set; }
    }
}
