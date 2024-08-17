using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using WebApplication1.model;

namespace WebApplication1.aspx
{
    public partial class ProductDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int productId;
                if (int.TryParse(Request.QueryString["productId"], out productId))
                {
                    LoadProductDetails(productId);
                }
                else
                {
                    // Hiển thị thông báo lỗi hoặc chuyển hướng đến trang lỗi
                }
            }
        }

        private void LoadProductDetails(int productId)
        {
            List<Product> products = Application["ProductList"] as List<Product>;
            if (products != null)
            {
                Product product = products.FirstOrDefault(p => p.Id == productId);
                if (product != null)
                {
                    // Hiển thị thông tin sản phẩm
                    productImage.Src = product.ImageURL;
                    productName.InnerText = product.ProductName;
                    productDescription.InnerText = product.Description;
                    productPrice.InnerText = $"${product.Price}";

                    // Hiển thị các sản phẩm khác (có thể cần tùy chỉnh thêm)
                    DisplayOtherProducts(productId);
                }
            }
        }

        private void DisplayOtherProducts(int currentProductId)
        {
            List<Product> products = Application["ProductList"] as List<Product>;
            if (products != null)
            {
                var otherProducts = products
                    .Where(p => p.Id != currentProductId)
                    .Take(4) // Hiển thị tối đa 4 sản phẩm khác
                    .ToList();

                foreach (var product in otherProducts)
                {
                    string productHtml = $@"
                    <div class='product-card'>
                        <img src='{product.ImageURL}' alt='{product.ProductName}'>
                        <h3>{product.ProductName}</h3>
                        <p>${product.Price}</p>
                        <a href='ProductDetail.aspx?productId={product.Id}'>
                            <button>View Details</button>
                        </a>
                    </div>";

                    otherProductsContainer.InnerHtml += productHtml;
                }
            }
        }

        protected void AddToCart_Click(object sender, EventArgs e)
        {
            int productId;
            if (int.TryParse(Request.QueryString["productId"], out productId))
            {
                List<Product> products = Application["ProductList"] as List<Product>;
                if (products != null)
                {
                    Product product = products.FirstOrDefault(p => p.Id == productId);
                    if (product != null)
                    {
                        List<Product> cart = Session["Cart"] as List<Product>;
                        if (cart == null)
                        {
                            cart = new List<Product>();
                        }

                        // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
                        var cartProduct = cart.FirstOrDefault(p => p.Id == productId);
                        if (cartProduct != null)
                        {
                            cartProduct.Quantity += int.Parse(quantity.Value);
                        }
                        else
                        {
                            product.Quantity = int.Parse(quantity.Value);
                            cart.Add(product);
                        }

                        Session["Cart"] = cart;

                        // Cập nhật số lượng giỏ hàng hiển thị trên trang
                        int cartCount = cart.Sum(p => p.Quantity);
                        cartCountLabel.InnerText = cartCount.ToString();
                    }
                }
            }
        }
    }
}