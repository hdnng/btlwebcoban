using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using WebApplication1.model;

namespace WebApplication1.aspx
{
    public partial class Accessory : System.Web.UI.Page
    {
        protected HtmlGenericControl productContainer;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducts();
            }

            // Xử lý yêu cầu POST khi thêm sản phẩm vào giỏ hàng
            if (Request.HttpMethod == "POST")
            {
                int productId = int.Parse(Request.Form["productId"]);
                int quantity = int.Parse(Request.Form["quantity"]);
                AddToCart(productId, quantity);
            }
        }

        private void LoadProducts()
        {
            List<Product> products = Application["ProductList"] as List<Product>;
            if (products != null)
            {
                List<Product> accessoryProducts = products.Where(p => p.Category == "Accessory").ToList();

                foreach (var product in accessoryProducts)
                {
                    string productHtml = $@"
                    <div class='product-item'>
                        <img src='{product.ImageURL}' alt='{product.ProductName}'>
                        <h3>{product.ProductName}</h3>
                        <p>${product.Price}</p>
                        <div class='product-item-buttons'>
                            <form method='post' action='Accessory.aspx'>
                                <input type='hidden' name='productId' value='{product.Id}' />
                                <label for='quantity-{product.Id}'>Quantity:</label>
                                <input type='number' id='quantity-{product.Id}' name='quantity' value='1' min='1' max='20' />
                                <button type='submit' class='add-to-cart-button'>Add to Cart</button>
                            </form>
                            <a href='ProductDetail.aspx?productId={product.Id}'>
                                <button class='view-details-button'>View Details</button>
                            </a>
                        </div>
                    </div>";

                    productContainer.InnerHtml += productHtml;
                }
            }
        }

        private void AddToCart(int productId, int quantity)
        {
            // Lấy danh sách sản phẩm từ Session
            List<Product> cart = Session["Cart"] as List<Product>;
            if (cart == null)
            {
                cart = new List<Product>();
                Session["Cart"] = cart;
            }

            // Lấy danh sách sản phẩm từ Application
            List<Product> products = Application["ProductList"] as List<Product>;
            Product product = products?.FirstOrDefault(p => p.Id == productId);

            if (product != null)
            {
                // Tìm sản phẩm trong giỏ hàng
                var cartItem = cart.FirstOrDefault(p => p.Id == productId);

                if (cartItem != null)
                {
                    // Tăng số lượng nếu sản phẩm đã tồn tại trong giỏ hàng
                    cartItem.Quantity += quantity;
                }
                else
                {
                    // Thêm sản phẩm mới với số lượng
                    product.Quantity = quantity;
                    cart.Add(product);
                }
                UpdateCartCount();
            }

            // Trả về số lượng hiện tại trong giỏ hàng
            Response.Write(cart.Sum(p => p.Quantity).ToString());
            Response.End();
        }

        private void UpdateCartCount()
        {
            var cartCount = (Session["Cart"] as List<Product>)?.Sum(c => c.Quantity) ?? 0;
            ScriptManager.RegisterStartupScript(this, GetType(), "UpdateCartCount", $"updateCartCount({cartCount});", true);
        }
    }
}