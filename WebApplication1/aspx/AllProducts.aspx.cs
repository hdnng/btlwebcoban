using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using WebApplication1.model;

namespace WebApplication1.aspx
{
    public partial class AllProducts : System.Web.UI.Page
    {
        protected HtmlGenericControl allproduct;

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
                LoadProducts();
            }
        }

        private void LoadProducts()
        {

            List<Product> products = Application["ProductList"] as List<Product>;
            if (products != null)
            {
                foreach (var product in products)
                {
                    string productHtml = $@"
                    <div class='product-item'>
                        <img src='{product.ImageURL}' alt='{product.ProductName}'>
                        <h3>{product.ProductName}</h3>
                        <p>${product.Price}</p>
                        <div class='product-item-buttons'>
                            <a href='UpdateProduct.aspx?productId={product.Id}'><button class='update-button'>Update</button></a>
                            <a href='AllProducts.aspx?deleteId={product.Id}'><button class='delete-button'>Delete</button></a>
                        </div>
                    </div>";

                    allproduct.InnerHtml += productHtml;
                }
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            // Handle delete request
            string deleteId = Request.QueryString["deleteId"];
            if (!string.IsNullOrEmpty(deleteId))
            {
                int productId = int.Parse(deleteId);
                DeleteProduct(productId);
                // Reload the page after deletion
                Response.Redirect("AllProducts.aspx");
            }
        }

        private void DeleteProduct(int productId)
        {
            List<Product> products = Application["ProductList"] as List<Product>;
            if (products != null)
            {
                Product productToRemove = products.FirstOrDefault(p => p.Id == productId);
                if (productToRemove != null)
                {
                    products.Remove(productToRemove);
                    Application["ProductList"] = products;
                }
            }
        }
    }
}