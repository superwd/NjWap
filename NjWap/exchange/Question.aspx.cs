using EntityManage;
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

namespace NjWap.exchange
{
    public partial class Question : System.Web.UI.Page
    {
        BaseRepository<T_OPT_STNET_CUT> cut = new BaseRepository<T_OPT_STNET_CUT>();
        njEntities nj = new njEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var eps = DynamicLinqExpressions.True<T_OPT_STNET_CUT>();
                IQueryable<T_OPT_STNET_CUT> result = cut.LoadEntities(eps);
                DataTable dt = result.Where(a => a.pid == "46").ToDataTable();
                drpCy.DataSource = dt;
                drpCy.DataTextField = "name";
                drpCy.DataValueField = "id";
                drpCy.DataBind();

                if (Context.User.Identity.Name != "")
                {
                    SYS_USER u = nj.SYS_USER.Where(c => c.USER_ID == Context.User.Identity.Name).FirstOrDefault();
                    lblSf.Text = "您好：【<a href = '/exchange/My.aspx?Id=" + Context.User.Identity.Name + "' >" + u.NAME + "</a>】";
                }

                if (Request.Cookies["Addr"] != null)
                {
                    string address = "";
                    string[] Addr = Request.Cookies["Addr"].Value.ToString().Split('|');
                    int provice = int.Parse(Addr[0]);
                    T_OPT_STNET_NATION tsn = nj.T_OPT_STNET_NATION.Where(c => c.id == provice).FirstOrDefault();
                    address += tsn.province+" ";
                    int city = int.Parse(Addr[1]);
                    tsn = nj.T_OPT_STNET_NATION.Where(c => c.id == city).FirstOrDefault();
                    address += tsn.city + " ";
                    int district = int.Parse(Addr[2]);
                    tsn = nj.T_OPT_STNET_NATION.Where(c => c.id == district).FirstOrDefault();
                    address += tsn.district + " ";
                    this.txtAddr.Text = address;
                }
            }
        }
        protected void btnSub_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["Addr"] != null)
            {
                try
                {
                    string title = this.txtTitle.Text.Trim();
                    string desp = this.txtDesp.Text.Trim();
                    if (title == "")
                    {
                        Page.RegisterStartupScript("", " <script language='javascript'>alert('请输入标题！'); </script>");
                        return;
                    }
                    if (desp == "")
                    {
                        Page.RegisterStartupScript("", " <script language='javascript'>alert('请输入问题内容！'); </script>");
                        return;
                    }
                    btnSub.Enabled = false;
                    string[] Addr = Request.Cookies["Addr"].Value.ToString().Split('|');
                    string url = ConfigurationManager.AppSettings["Url"] + "/NJ_Stnet/mobile/appAsk.do?USER_ID=" + Context.User.Identity.Name + "&TITLE=" + title + "&CONTENT=" + desp + "&INDUSTRY=" + drpCy.SelectedValue + "&PROVINCE=" + Addr[0] + "&CITY=" + Addr[1] + "&DISTRICT=" + Addr[2];
                    WebRequest req = WebRequest.Create(url);
                    req.Method = "POST";
                    WebResponse res = req.GetResponse();
                    StreamReader sr = new StreamReader(res.GetResponseStream(), Encoding.UTF8);
                    string strResponse = sr.ReadToEnd();
                    JObject jo = (JObject)JsonConvert.DeserializeObject(strResponse);
                    string IsTrue = jo["success"].ToString();
                    if (IsTrue.ToLower() == "true")
                    {
                        Page.RegisterStartupScript("", " <script language='javascript'>alert('提问成功！');location.href='/In/List.aspx' </script>");
                    }
                    else
                    {
                        Page.RegisterStartupScript("", " <script language='javascript'>alert('提问失败！');location.href='Question.aspx' </script>");

                    }
                    btnSub.Enabled = true;
                }
                catch (Exception ex)
                {
                    


                }

               
            }
        }
    }
}