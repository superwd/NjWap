using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NjWap.In
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                

            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                string UserName = this.txtUName.Text.Trim();
                string Pwd = this.txtPwd.Text.Trim();
                if (UserName == "")
                {
                    Page.RegisterStartupScript("", " <script language='javascript'>alert('请输入姓名！'); </script>");
                    return;
                }
                if (Pwd == "")
                {
                    Page.RegisterStartupScript("", " <script language='javascript'>alert('请输入密码！'); </script>");
                    return;
                }
                string url = ConfigurationManager.AppSettings["Url"] + "/NJ_Stnet/appcustomerUser/login.do?USERNAME="+ UserName + "&PASSWORD="+Pwd;
                WebRequest req = WebRequest.Create(url);
                req.Method = "POST";
                WebResponse res = req.GetResponse();
                StreamReader sr = new StreamReader(res.GetResponseStream(), Encoding.UTF8);
                string strResponse = sr.ReadToEnd();
                JObject jo = (JObject)JsonConvert.DeserializeObject(strResponse);
                string IsTrue = jo["success"].ToString();
                if (IsTrue.ToLower() == "true")
                {
                    string Id = jo["data"]["USER_ID"].ToString();
                    string Addr = jo["data"]["PROVINCE"].ToString() + "|" + jo["data"]["CITY"].ToString()+"|"+ jo["data"]["DISTRICT"].ToString();
                    HttpCookie cookieUserName = new HttpCookie("Addr");  //创建帐号的cookie实例
                    cookieUserName.Value = Addr;
                    cookieUserName.Expires = DateTime.Now.AddHours(2);
                    Response.Cookies.Add(cookieUserName);
                    //建立身份验证票对象
                    FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, Id, DateTime.Now, DateTime.Now.AddMinutes(60), false, "1");
                    //加密序列化验证票为字符串
                    string hashTicket = FormsAuthentication.Encrypt(ticket);
                    HttpCookie userCookie = new HttpCookie(FormsAuthentication.FormsCookieName, hashTicket);
                    HttpContext.Current.Response.Cookies.Add(userCookie);
                    if (Request.QueryString["ReturnUrl"] != null)
                    {
                        Response.Redirect(Request.QueryString["ReturnUrl"]);
                    }
                    else
                    {
                        Response.Redirect("/exchange/List.aspx", false);
                    }
                }
            }
            catch (Exception ex)
            {
                Page.RegisterStartupScript("", " <script language='javascript'>alert('登录失败！'); </script>");
            }
        }
    }
}