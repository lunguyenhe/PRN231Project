using System;
using System.Collections.Generic;

namespace PRN231API.Models
{
    public partial class Brand
    {
        public Brand()
        {
            Products = new HashSet<Product>();
        }

        public int BrandId { get; set; }
        public string BrandName { get; set; } = null!;
        public string? Website { get; set; }
        public string? Description { get; set; }
        public string? Logo { get; set; }

        public virtual ICollection<Product> Products { get; set; }
    }
}
