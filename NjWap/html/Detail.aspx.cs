using EntityManage;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NjWap.html
{
    public partial class Detail : System.Web.UI.Page
    {
        BaseRepository<category_show_view> bu = new BaseRepository<category_show_view>();
        BaseRepository<t_opt_stnet_content> cu = new BaseRepository<t_opt_stnet_content>();
        njEntities nj = new njEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindBody();
            }
        }
        //文章
        protected void BindBody()
        {
            if (Request["ConId"] != null)
            {
                try
                {
                    string Id = Request["ConId"].ToString();

                    //var eps = DynamicLinqExpressions.True<category_show_view>();
                    //eps = eps.And(c => c.CATEGORY_ID == ui.CATEGORY_ID);
                    //DataTable dtc = bu.LoadEntities(eps).ToDataTable();
                    t_opt_stnet_content tc = nj.t_opt_stnet_content.Where(a => a.CONTENT_ID == Id).FirstOrDefault();
                    t_info_stnet_category ui = nj.t_info_stnet_category.Where(a => a.CATEGORY_ID == tc.CID).FirstOrDefault();

                    ltCon.Text += "<div id='location'><a href='' title='首页' class='CurrChnlCls'>首页</a>&nbsp;&gt;&nbsp;<a href='List.aspx?CID=" + tc.CID + "' title='" + ui.TITLE + "' class='CurrChnlCls'>" + ui.TITLE + "</a></div>";

                    ltCon.Text += "<h1>" + tc.TITLE + "</h1><p class='public_time'>" + tc.PUBDATE + "</p>" +
                        " <div class='details_content'>" + tc.TEXT.Replace("<img","<img style='width:330px'") + "</div><div style='height: 50px'></div>";

                }
                catch (Exception ex)
                {
                    
                }
            }
        }      
    }
}