using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Security.Policy;
using System.Web;

namespace WebApplication1.model
{
    public class Product
    {
        public int Id { get; set; }
        public string ProductName { get; set; }
        public string Category { get; set; }
        public double Price { get; set; }
        public string Description { get; set; }
        public string ImageURL { get; set; }
        public int Quantity { get; set; }

        public string trangTHai { get; set; }
    }

    public class Clothes : Product
    {
        // them thuoc tinh
        public int Type { get; set; }
    }

    public class Accessory : Product
    {
        public string Size { get; set; }
    }

    public class Supplement : Product 
    {
        public string Size { get; set; }
        public string Flavor { get; set; }
        // them thuoc tinh
    }
}