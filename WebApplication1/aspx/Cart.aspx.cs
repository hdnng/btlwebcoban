using System.Collections.Generic;
using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using Newtonsoft.Json;
using WebApplication1.model;

namespace WebApplication1.aspx
{
    public partial class Cart : System.Web.UI.Page
    {
        protected HtmlGenericControl cartContainer;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCart();
            }
        }

        protected void Page_LoadComplete(object sender, EventArgs e)
        {
            if (Request.HttpMethod == "POST")
            {
                int productId = int.Parse(Request.Form["productId"]);
                RemoveFromCart(productId);
                LoadCart(); // Tải lại giỏ hàng sau khi xóa sản phẩm
            }
        }

        private void LoadCart()
        {
            List<Product> cart = Session["Cart"] as List<Product>;

            if (cart != null && cart.Any())
            {
                cartContainer.InnerHtml = string.Empty;
                decimal totalAmount = 0;

                foreach (var product in cart)
                {
                    double priceDouble = product.Price; // Giá trị price kiểu double
                    int quantity = product.Quantity; // Số lượng kiểu int

                    // Chuyển đổi price từ double sang decimal
                    decimal priceDecimal = (decimal)priceDouble;

                    // Tính tổng tiền cho sản phẩm
                    decimal totalPrice = priceDecimal * quantity;

                    // Cập nhật tổng tiền
                    totalAmount += totalPrice;

                    string cartItemHtml = $@"
                    <div class='cart-item'>
                        <img src='{product.ImageURL}' alt='{product.ProductName}'>
                        <div class='cart-item-details'>
                            <h3>{product.ProductName}</h3>
                            <p>Price: ${priceDecimal}</p>
                            <p>Quantity: {quantity}</p>
                            <p>Total: ${totalPrice}</p> <!-- Hiển thị tổng tiền cho sản phẩm -->
                        </div>
                        <button class='remove-button' onclick='removeFromCart({product.Id})'>Remove</button>
                    </div>";
                    cartContainer.InnerHtml += cartItemHtml;
                }
                // Hiển thị tổng tiền của tất cả các sản phẩm
                totalAmountLabel.Text = $"Total Amount: ${totalAmount:F2}";
            }
            else
            {
                cartContainer.InnerHtml = "<p>Your cart is empty.</p>";
                totalAmountLabel.Text = "Total Amount: $0.00";
            }
        }

        private void RemoveFromCart(int productId)
        {
            List<Product> cart = Session["Cart"] as List<Product>;

            if (cart != null)
            {
                var product = cart.FirstOrDefault(p => p.Id == productId);

                if (product != null)
                {
                    cart.Remove(product);
                    Session["Cart"] = cart;
                }
            }

            // Tính tổng tiền và tạo HTML cho giỏ hàng
            decimal totalAmount = 0;
            string cartHtml = string.Empty;

            if (cart != null && cart.Any())
            {
                foreach (var product in cart)
                {
                    double priceDouble = product.Price;
                    int quantity = product.Quantity;
                    decimal priceDecimal = (decimal)priceDouble;
                    decimal totalPrice = priceDecimal * quantity;
                    totalAmount += totalPrice;

                    cartHtml += $@"
                         <div class='cart-item'>
                            <img src='{product.ImageURL}' alt='{product.ProductName}'>
                            <div class='cart-item-details'>
                                <h3>{product.ProductName}</h3>
                                <p>Price: ${priceDecimal}</p>
                                <p>Quantity: {quantity}</p>
                                <p>Total: ${totalPrice}</p>
                            </div>
                            <button class='remove-button' onclick='removeFromCart({product.Id})'>Remove</button>
                     </div>";
                }
            }
            else
            {
                cartHtml = "<p>Your cart is empty.</p>";
            }

            // Trả về dữ liệu dưới dạng JSON
            var responseData = new
            {
                cartHtml = cartHtml,
                totalAmount = totalAmount.ToString("F2")
            };

            Response.ContentType = "application/json";
            Response.Write(JsonConvert.SerializeObject(responseData));
            Response.End();
        }
    }
}