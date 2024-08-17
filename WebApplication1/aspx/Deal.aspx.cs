using System;
using System.Collections.Generic;
using System.Web.UI;
using WebApplication1.model;

namespace WebApplication1.aspx
{
    public partial class Deal : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDeals();
            }
        }

        private void LoadDeals()
        {
            // Giả sử bạn có một phương thức để lấy danh sách các deal từ cơ sở dữ liệu hoặc danh sách mẫu.
            List<Product> deals = GetDealProducts();

            foreach (var deal in deals)
            {
                // Tạo mã HTML cho từng sản phẩm deal
                string dealHtml = $@"
                    <div class='deal-item'>
                        <img src='{deal.ImageURL}' alt='{deal.ProductName}' />
                        <h2>{deal.ProductName}</h2>
                        <p>{deal.Description}</p>
                        <span>${deal.Price}</span>
                        <a href='ProductDetail.aspx?id={deal.Id}' class='button'>View Details</a>
                    </div>";

                // Thêm mã HTML vào trang
                this.DealContainer.InnerHtml += dealHtml;
            }
        }

        private List<Product> GetDealProducts()
        {
            // Thay thế bằng mã thực tế để lấy danh sách các deal từ cơ sở dữ liệu hoặc nguồn dữ liệu khác
            // Ví dụ mẫu
            return new List<Product>
            {
                new Product { Id = 1, ProductName = "Deal 1", Price = 10.99, Description = "Summer Sale: 20% Off\n Enjoy a 20% discount on all summer items.", ImageURL = "/img/logoproduct/deal1.png" },
                new Product { Id = 2, ProductName = "Deal 2", Price = 15.99, Description = "Summer Sale: 20% Off\n Enjoy a 20% discount on all summer items.", ImageURL = "/img/logoproduct/deal2.png" },
                new Product { Id = 3, ProductName = "Deal 3", Price = 11.99, Description = "Summer Sale: 20% Off\n Enjoy a 20% discount on all summer items.", ImageURL = "/img/logoproduct/deal3.png" },
                new Product { Id = 4, ProductName = "Deal 4", Price = 9.99, Description = "Summer Sale: 20% Off\n Enjoy a 20% discount on all summer items.", ImageURL = "/img/logoproduct/deal4.png" }
                // Thêm các sản phẩm deal khác
            };
        }
    }
}