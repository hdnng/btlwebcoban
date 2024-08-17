using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using WebApplication1.model;

namespace WebApplication1.aspx
{
    public partial class UpdateProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session[WebApplication1.Global.user_name] != null && Session[WebApplication1.Global.user_name].Equals("guest"))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "LoginFailed", "alert('You must log in to use this feature.'); window.location.href = 'Login.aspx';", true);
                return;
            }
            if (Session[WebApplication1.Global.user_name] != null && !Session[WebApplication1.Global.user_name].Equals("admin"))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "AccessDenied", "alert('You do not have permission to access this page.'); window.location.href = 'Homepage.aspx';", true);
                return;
            }

            if (!IsPostBack)
            {
                int productId;
                if (int.TryParse(Request.QueryString["productId"], out productId))
                {
                    LoadProduct(productId);
                }
            }
        }

        private void LoadProduct(int productId)
        {
            List<Product> products = Application["ProductList"] as List<Product>;
            Product product = products?.FirstOrDefault(p => p.Id == productId);

            if (product != null)
            {
                productIdField.Value = product.Id.ToString();
                productName.Text = product.ProductName;
                productPrice.Text = product.Price.ToString();
                productImageURL.Text = product.ImageURL;
                productDescription.Text = product.Description;
                trangthai.Text = product.trangTHai;
            }
        }

        protected void UpdateProductForm_Submit(object sender, EventArgs e)
        {
            int productId;
            if (int.TryParse(productIdField.Value, out productId))
            {
                string productName = this.productName.Text;
                double productPrice;
                if (double.TryParse(this.productPrice.Text, out productPrice))
                {
                    string productImageURL = this.productImageURL.Text;
                    string productDescription = this.productDescription.Text;
                    string trangthai = this.trangthai.Text;

                    List<Product> products = Application["ProductList"] as List<Product>;
                    Product product = products?.FirstOrDefault(p => p.Id == productId);

                    if (product != null)
                    {
                        product.ProductName = productName;
                        product.Price = productPrice;
                        product.ImageURL = productImageURL;
                        product.Description = productDescription;
                        product.trangTHai = trangthai;

                        Application["ProductList"] = products;
                        Response.Redirect("AllProducts.aspx");
                    }
                }
                else
                {
                    // Handle invalid price format
                    // You can add a message to show the user that the price is invalid
                }
            }
            else
            {
                // Handle invalid product ID
                // You can add a message to show the user that the product ID is invalid
            }
        }
    }
}