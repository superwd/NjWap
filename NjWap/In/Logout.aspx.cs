using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NjWap.In
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User != null && HttpContext.Current.User.Identity.IsAuthenticated)
            {
                try
                {
                    System.Web.Security.FormsAuthentication.SignOut();
                    HttpContext.Current.Session.Abandon();
                    //FormsAuthentication.SignOut();
                    HttpContext.Current.Session.Clear();
                    FormsIdentity id = (FormsIdentity)User.Identity;
                    FormsAuthenticationTicket Ticket = id.Ticket;
                    if (Request.Cookies["Addr"] != null)
                    {
                        Response.Cookies["Addr"].Expires = DateTime.Now.AddDays(-1);
                    }
                    Response.Write("<br>userdata:" + Ticket.UserData);
                    HttpContext.Current.Response.Redirect("Login.aspx");
                    //if (Ticket.UserData == "1")
                    //{

                    //}
                    //else
                    //{
                    //    HttpContext.Current.Response.Redirect("MerchantLogin.aspx");
                    //}
                }
                catch { }
            }
        }
    }
}