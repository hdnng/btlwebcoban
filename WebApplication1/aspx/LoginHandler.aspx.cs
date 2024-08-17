using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.model;

namespace WebApplication1.aspx
{
    public partial class LoginHandler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["do"] != null && Request.QueryString["do"].Equals("out"))
            {
                Session.Abandon();
                Response.Redirect("login.aspx");
            }
            if (Request.QueryString["do"] != null && Request.QueryString["do"].Equals("fail"))
            {
                Session.Abandon();
                Response.Redirect("login.aspx");
            }

            bool LoginSuccess = false;
            bool isAdmin = false;

            string userName = Request.Form["txtUsername"];
            string userPass = Request.Form["txtPassword"];


            if (!string.IsNullOrEmpty(userName) && !string.IsNullOrEmpty(userPass))
            {
                List<Users> glstusers = Application[Global.user_list] as List<Users>;
                Users user = glstusers.Find(m => m.username.Equals(userName, StringComparison.CurrentCultureIgnoreCase));

                if (user != null)
                {
                    if (userName.Equals("1"))
                    {
                        isAdmin = user.password.Equals(userPass);
                        if (isAdmin)
                        {
                            Session[Global.user_name] = "admin";
                            Response.Redirect("Login.aspx");
                            return;
                        }
                    }
                    LoginSuccess = user.password.Equals(userPass);
                }
            }

            if (LoginSuccess)
            {
                Session[Global.user_name] = userName;
                Response.Redirect("Login.aspx");
            }
            else
            {
                Session[Global.user_name] = "fail";
                ClientScript.RegisterStartupScript(this.GetType(), "LoginFailed", "alert('Login failed. Please check your credentials.'); window.location.href = 'Loginhandler.aspx?do=fail';", true);
            }
        }
    }
}