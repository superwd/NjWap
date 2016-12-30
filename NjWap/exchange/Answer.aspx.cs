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
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NjWap.exchange
{
    public partial class Answer : System.Web.UI.Page
    {
        BaseRepository<T_OPT_STNET_EXCHANGE> exc = new BaseRepository<T_OPT_STNET_EXCHANGE>();
        njEntities nj = new njEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["ID"]!=null)
                {
                    try
                    {
                        if (Context.User.Identity.Name != "")
                        {
                            SYS_USER u = nj.SYS_USER.Where(c => c.USER_ID == Context.User.Identity.Name).FirstOrDefault();
                            lblSf.Text = "您好：【<a href = '/exchange/My.aspx?Id=" + Context.User.Identity.Name + "' >" + u.NAME + "</a>】";
                        }
                        string Id = Request["ID"];
                        T_OPT_STNET_EXCHANGE se = nj.T_OPT_STNET_EXCHANGE.Where(c => c.ID == Id).FirstOrDefault();
                        lblTitle.Text = se.TITLE;
                        lblDesp.Text = se.CONTENT;
                        SYS_USER user = nj.SYS_USER.Where(c => c.USER_ID == se.CREATEUSER).FirstOrDefault();
                        if (user != null)
                        {
                            lblUser.Text = user.NAME + " / " + se.CREATEDATE;
                            var eps = DynamicLinqExpressions.True<T_OPT_STNET_EXCHANGE>();
                            IQueryable<T_OPT_STNET_EXCHANGE> result = exc.LoadEntities(eps);
                            DataTable dt = result.Where(a => a.PID == Id).OrderByDescending(a => a.CREATEDATE).ToDataTable();
                            if (dt.Rows.Count > 0)
                            {
                                lblCount.Text = dt.Rows.Count.ToString() + "条回答";
                                rptList.DataSource = dt;
                                rptList.DataBind();
                            }
                        }
          

                    }
                    catch (Exception ex)
                    {

                        throw;
                    }
                }            

            }
        }

        protected string GetUserName(string Uid)
        {
            SYS_USER user = nj.SYS_USER.Where(c => c.USER_ID == Uid).FirstOrDefault();
            if (user!=null)
            {
                return user.NAME;
            }
            else
            {
                return "无";
            }
            
        }

        protected void btnSub_Click(object sender, EventArgs e)
        {
            if (Request["ID"] != null)
            {
                string desp = this.txtDesp.Text.Trim();
                if (desp == "")
                {
                    Page.RegisterStartupScript("", " <script language='javascript'>alert('请输入回答内容！'); </script>");
                    return;
                }
                btnSub.Enabled = false;
                string url = ConfigurationManager.AppSettings["Url"] + "/NJ_Stnet/mobile/appAnswer.do?USER_ID=" + Context.User.Identity.Name + "&TITLE="+ desp + "&&PID=" + Request["ID"];
                WebRequest req = WebRequest.Create(url);
                req.Method = "POST";
                WebResponse res = req.GetResponse();
                StreamReader sr = new StreamReader(res.GetResponseStream(), Encoding.UTF8);
                string strResponse = sr.ReadToEnd();
                JObject jo = (JObject)JsonConvert.DeserializeObject(strResponse);
                string IsTrue = jo["success"].ToString();
                if (IsTrue.ToLower() == "true")
                {
                    Page.RegisterStartupScript("", " <script language='javascript'>alert('回答成功！');location.href='/In/List.aspx' </script>");
                }
                else
                {
                    Page.RegisterStartupScript("", " <script language='javascript'>alert('回答失败！');location.href='Answer.aspx"+ Request["ID"] + "' </script>");

                }
                btnSub.Enabled = true;
            }
        }
    }
}