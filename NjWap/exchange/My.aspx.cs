using EntityManage;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NjWap.exchange
{
    public partial class My : System.Web.UI.Page
    {
        njEntities nj = new njEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["Id"] != null)
                {
                    string Id = Request["Id"];
                    lbMyQuestion.PostBackUrl = "/In/List.aspx?Uid=" + Id;
                    SYS_USER user = nj.SYS_USER.Where(a => a.USER_ID == Id).FirstOrDefault();
                    if (user != null)
                    {
                        this.txtMobile.Text = user.PHONE;
                        this.txtEmail.Text = user.EMAIL;
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string Pwd = txtPwd.Text.Trim();
            string Pwd2 = txtPwd2.Text.Trim();
            string Mobile = txtMobile.Text.Trim();
            string Email = txtEmail.Text.Trim();
            if (Pwd == "")
            {
                Page.RegisterStartupScript("", " <script language='javascript'>alert('请输入密码！'); </script>");
                return;
            }
            if (Pwd != Pwd2)
            {
                Page.RegisterStartupScript("", " <script language='javascript'>alert('两次输入的密码不一致！'); </script>");
                return;
            }
            Match m = Regex.Match(Mobile, "(13|15|18)\\d{9}");
            if (!m.Success)
            {
                Page.RegisterStartupScript("", " <script language='javascript'>alert('请输入有效的手机号码！'); </script>");
                return;
            }
            Match m2 = Regex.Match(Email, "[A-Za-z0-9][@][A-Za-z0-9]+[.][A-Za-z0-9]");
            if (!m2.Success)
            {
                Page.RegisterStartupScript("", " <script language='javascript'>alert('请输入正确的邮箱地址！'); </script>");
                return;
            }
            
        }
    }
}