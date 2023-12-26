using System;
using System.Web;
using System.Web.Security;

namespace TP1_Movies
{
    public class Global : HttpApplication
    {
        DB db = new DB();
        
        protected void Application_Start(object sender, EventArgs e)
        {
            db.Open();
        }

        protected void Application_End(object sender, EventArgs e)
        {
            db.Close();
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {
            if (HttpContext.Current.User != null)
            {
                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    if (HttpContext.Current.User.Identity is FormsIdentity)
                    {
                        FormsIdentity identity = (FormsIdentity)HttpContext.Current.User.Identity;
                        FormsAuthenticationTicket ticket = identity.Ticket;
                        string[] roles = ticket.UserData.Split(',');
                        HttpContext.Current.User = new System.Security.Principal.GenericPrincipal(identity, roles);
                    }
                }
            }
        }
    }
}