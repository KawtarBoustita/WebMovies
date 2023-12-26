using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP1_Movies.admin
{
    public partial class login : Page
    {
        DB db = new DB();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User != null && HttpContext.Current.User.Identity.IsAuthenticated)
            {
                string returnUrl = Request.QueryString["ReturnUrl"];
                if (returnUrl == null) returnUrl = "~/admin/movies/list.aspx";
                Response.Redirect(returnUrl);
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string query = $"SELECT count(username) FROM Users WHERE Username = '{txtUsername.Text}'" +
                           $" AND Password = '{txtPassword.Text}'";

            int count = Convert.ToInt32(db.ExecuteScalar(query));

            if (count > 0)
            {
                FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, txtUsername.Text, DateTime.Now,
                    DateTime.Now.AddMinutes(60), false, "", FormsAuthentication.FormsCookiePath);
                string hashCookies = FormsAuthentication.Encrypt(ticket);
                HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, hashCookies);
                Response.Cookies.Add(cookie);
                string returnUrl = Request.QueryString["ReturnUrl"];
                if (returnUrl == null) returnUrl = "~/admin/movies/list.aspx";
                Response.Redirect(returnUrl);
            }
            else
            {
                CustomValidator err = new CustomValidator();
                err.ValidationGroup = "Login";
                err.IsValid = false;
                err.ErrorMessage = "Entered credentials are invalid.";
                Page.Validators.Add(err);
            }
        }
    }
}