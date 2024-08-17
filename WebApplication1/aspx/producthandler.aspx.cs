using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.model;

namespace WebApplication1.aspx
{
    public partial class producthandler : System.Web.UI.Page
    {
        public static int ConvertStringToInt(string str)
        {
            if (int.TryParse(str, out int integerValue))
            {
                return integerValue;
            }
            else
            {
                Console.WriteLine($"Conversion of \"{str}\" to an integer failed.");
                return 0;
            }
        }

        public static float ConvertStringToFloat(string str)
        {
            if (float.TryParse(str, out float floatValue))
            {
                return floatValue;
            }
            else
            {
                Console.WriteLine($"Conversion of \"{str}\" to an float failed.");
                return 0;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            int txtNewproductID = int.Parse(Request.Form["txtNewproductID"]);
            string txtNewproductName = Request.Form["txtNewproductName"];
            string txtNewproductDescription = Request.Form["txtNewproductDescription"];
            string txtNewproductType = Request.Form["txtNewproductType"];
            string txtNewproductPrice = Request.Form["txtNewproductPrice"];
            string txtNewproductPath = "/src/PRODUCTPICS/" + txtNewproductType + ".jpg";
            string MST = Request.Form["MST"];
            string trangthai = Request.Form["txtTRangthai"];
            Product p = new Product();

            p.Id = txtNewproductID;
            p.ProductName = txtNewproductName;
            p.ImageURL = txtNewproductPath;
            p.Description = txtNewproductDescription;
            p.Category = txtNewproductType;
            p.Price = ConvertStringToFloat(txtNewproductPrice);
            p.trangTHai = trangthai;

            var glstProduct = Application[WebApplication1.Global.product_list] as List<WebApplication1.model.Product>;

            glstProduct.Add(p);

            Application[WebApplication1.Global.product_list] = glstProduct;

            Response.Redirect("Homepage.aspx");
        }
    }
}