using EntityManage;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NjWap.In
{
    public partial class Registe : System.Web.UI.Page
    {
        BaseRepository<T_OPT_STNET_CUT> cut = new BaseRepository<T_OPT_STNET_CUT>();
        BaseRepository<T_OPT_STNET_NATION> nat = new BaseRepository<T_OPT_STNET_NATION>();
        njEntities nj = new njEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindAllList();
            }
        }

        protected void BindAllList()
        {
            try
            {
                //省市县
                var epsc = DynamicLinqExpressions.True<T_OPT_STNET_NATION>();
                IQueryable<T_OPT_STNET_NATION> pro = nat.LoadEntities(epsc);
                DataTable dtp = pro.Where(a => a.parent_id == 1).ToDataTable();
                drpPro.DataSource = dtp;
                drpPro.DataTextField = "province";
                drpPro.DataValueField = "id";
                drpPro.DataBind();
                drpPro.SelectedValue = "1479";

                int c = int.Parse(drpPro.SelectedValue);
                DataTable dtc = pro.Where(a => a.parent_id == c).ToDataTable();
                drpCity.DataSource = dtc;
                drpCity.DataTextField = "city";
                drpCity.DataValueField = "id";
                drpCity.DataBind();

                int x = int.Parse(drpCity.SelectedValue);
                DataTable dtd = pro.Where(a => a.parent_id == x).ToDataTable();
                drpX.DataSource = dtd;
                drpX.DataTextField = "district";
                drpX.DataValueField = "id";
                drpX.DataBind();

                //产业
                var eps = DynamicLinqExpressions.True<T_OPT_STNET_CUT>();
                IQueryable<T_OPT_STNET_CUT> result = cut.LoadEntities(eps);
                DataTable dt = result.Where(a => a.pid == "46").ToDataTable();
                chkCy.DataSource = dt;
                chkCy.DataTextField = "name";
                chkCy.DataValueField = "id";
                chkCy.DataBind();

                //身份
                DataTable dt2 = result.Where(a => a.pid == "38").ToDataTable();
                drpSf.DataSource = dt2;
                drpSf.DataTextField = "name";
                drpSf.DataValueField = "id";
                drpSf.DataBind();
            }
            catch (Exception ex)
            {
                throw;
            }

        }
        protected void btnReg_Click(object sender, EventArgs e)
        {
            string UName = txtUName.Text.Trim();
            string Pwd = txtPwd.Text.Trim();
            string Pwd2 = txtPwd2.Text.Trim();
            string Mobile = txtMobile.Text.Trim();
            string Email = txtEmail.Text.Trim();
            string Name = txtName.Text.Trim();
            string Id = txtId.Text.Trim();
            string Address = txtAddress.Text.Trim();
            string gm = txtGm.Text.Trim();
            if (UName == "")
            {
                Page.RegisterStartupScript("", " <script language='javascript'>alert('请输入用户名！'); </script>");
                return;
            }
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
            if (Name == "")
            {
                Page.RegisterStartupScript("", " <script language='javascript'>alert('请输入姓名！'); </script>");
                return;
            }
            if (Address == "")
            {
                Page.RegisterStartupScript("", " <script language='javascript'>alert('请输入详细地址！'); </script>");
                return;
            }
        }

        protected void drpPro_SelectedIndexChanged(object sender, EventArgs e)
        {
            var epsc = DynamicLinqExpressions.True<T_OPT_STNET_NATION>();
            IQueryable<T_OPT_STNET_NATION> pro = nat.LoadEntities(epsc);
            int c = int.Parse(drpPro.SelectedValue);
            DataTable dtc = pro.Where(a => a.parent_id == c).ToDataTable();
            if (dtc.Rows[0]["city"].ToString()!="")
            {
                drpCity.DataSource = dtc;
                drpCity.DataTextField = "city";
                drpCity.DataValueField = "id";
                drpCity.DataBind();
                drpCity_SelectedIndexChanged(sender, e);
            }
            else
            {
                drpCity.Items.Clear();
                drpCity.Items.Add(new ListItem("暂无", "-1"));
                DataTable dtd = pro.Where(a => a.parent_id == c).ToDataTable();
                drpX.DataSource = dtd;
                drpX.DataTextField = "district";
                drpX.DataValueField = "id";
                drpX.DataBind();
            }
           
        }

        protected void drpCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            var epsc = DynamicLinqExpressions.True<T_OPT_STNET_NATION>();
            IQueryable<T_OPT_STNET_NATION> pro = nat.LoadEntities(epsc);
            if (drpCity.SelectedValue != "-1")
            {
                int x = int.Parse(drpCity.SelectedValue);
                DataTable dtd = pro.Where(a => a.parent_id == x).ToDataTable();
                drpX.DataSource = dtd;
                drpX.DataTextField = "district";
                drpX.DataValueField = "id";
                drpX.DataBind();
            }
        }
    }
}