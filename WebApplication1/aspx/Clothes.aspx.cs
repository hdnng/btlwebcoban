

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using WebApplication1.model;

namespace WebApplication1.aspx
{
    public partial class Clothes : System.Web.UI.Page
    {
        protected HtmlGenericControl ProductContainer; // Đổi tên biến để tránh mâu thuẫn

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
                List<Product> clothesProducts = products.Where(p => p.Category == "Clothes").ToList();

                foreach (var product in clothesProducts)
                {
                    string productHtml = $@"
                <div class='product-item'>
                    <img src='{product.ImageURL}' alt='{product.ProductName}'>
                    <h3>{product.ProductName}</h3>
                    <p>${product.Price}</p>
                    <div class='product-item-buttons'>
                        <form method='post' action='Clothes.aspx'>
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

                    ProductContainer.InnerHtml += productHtml;
                }
            }
        }

        private void AddToCart(int productId, int quantity)
        {
            List<Product> cart = Session["Cart"] as List<Product>;
            if (cart == null)
            {
                cart = new List<Product>();
                Session["Cart"] = cart;
            }

            List<Product> products = Application["ProductList"] as List<Product>;
            Product product = products?.FirstOrDefault(p => p.Id == productId);

            if (product != null)
            {
                var cartItem = cart.FirstOrDefault(p => p.Id == productId);

                if (cartItem != null)
                {
                    cartItem.Quantity += quantity;
                }
                else
                {
                    product.Quantity = quantity;
                    cart.Add(product);
                }
                UpdateCartCount();
            }

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