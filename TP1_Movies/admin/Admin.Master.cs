using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace TP1_Movies.admin
{
    public partial class Admin : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btnLogout.Visible = HttpContext.Current.User.Identity.IsAuthenticated;
            pnlSidebar.Visible = HttpContext.Current.User.Identity.IsAuthenticated;

            foreach (Control item in pnlSidebar.Controls)
            {
                if (item is HtmlAnchor && Request.RawUrl.Equals(((HtmlAnchor)item).HRef))
                {
                    ((HtmlAnchor)item).Attributes.Add("class","active");
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("/admin/login.aspx");
        }
    }
}