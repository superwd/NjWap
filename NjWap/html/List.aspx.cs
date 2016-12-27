using EntityManage;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NjWap.html
{
    public partial class List : System.Web.UI.Page
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
        //分类+内容
        //protected void BindBody()
        //{
        //    if (Request["CID"] != null)
        //    {
        //        string cateid = Request["CID"].ToString();
        //        var eps = DynamicLinqExpressions.True<category_show_view>();
        //        eps = eps.And(c => c.CATEGORY_ID == cateid);
        //        DataTable dt = bu.LoadEntities(eps).ToDataTable();

        //        if (dt.Rows.Count > 0)
        //        {
        //            string HeadList = "";
        //            lblName.Text = dt.Rows[0]["Title"].ToString();
        //            var epsc = DynamicLinqExpressions.True<t_opt_stnet_content>();
        //            epsc = epsc.And(c => c.CID == cateid);
        //            DataTable dtc = cu.LoadEntities(epsc).ToDataTable();
        //            if (dtc.Rows.Count > 0)
        //            {
        //                int hcount = dtc.Rows.Count;
        //                //if (dtc.Rows.Count > 5)
        //                //{
        //                //    hcount = 5;
        //                //}
        //                for (int i = 0; i < hcount; i++)
        //                {
        //                    //if (i == 0)
        //                    //{
        //                    //    string txt = "";
        //                    //    if (dtc.Rows[i]["Text"].ToString().Length > 100)
        //                    //    {
        //                    //        txt = dtc.Rows[i]["Text"].ToString().Substring(0, 100) + "...";
        //                    //    }
        //                    //    else
        //                    //    {
        //                    //        txt = dtc.Rows[i]["Text"].ToString();
        //                    //    }
        //                    //    HeadList += "<li class='first'><a href='Detail.aspx?ConId=" + dtc.Rows[i]["Content_ID"].ToString() + "'><img src='../img/kjzx.jpg'></a><a href='#'><b></b></a>"
        //                    //        + "<b> <a href='Detail.aspx?ConId=" + dtc.Rows[i]["Content_ID"].ToString() + "' target='_blank' title='" + dtc.Rows[i]["Title"].ToString() + "'>" + dtc.Rows[i]["Title"].ToString() + "</a></b>"
        //                    //        + "<span class='InfoContent'><br>" + txt + "</span></li>";
        //                    //}
        //                    //else
        //                    //{
        //                    //    HeadList += "<li><a href='Detail.aspx?ConId=" + dtc.Rows[i]["Content_ID"].ToString() + "' target='_blank' title='" + dtc.Rows[i]["Title"].ToString() + "'>" + dtc.Rows[i]["Title"].ToString() + "</a></li>";
        //                    //}
        //                    HeadList += "<li><a href='Detail.aspx?ConId=" + dtc.Rows[i]["Content_ID"].ToString() + "' target='_blank' title='" + dtc.Rows[i]["Title"].ToString() + "'>" + dtc.Rows[i]["Title"].ToString() + "</a></li>";
        //                }
        //                ltHead.Text = HeadList;
        //            }                  
        //        }
        //    }
        //}

        protected void BindBody()
        {
            if (Request["CID"] != null)
            {
                string cateid = Request["CID"].ToString();
                string cid = ConfigurationManager.AppSettings["CID"];
                if (cateid == cid)
                {
                    Response.Redirect("/In/List.aspx");
                    Response.End();
                }
                if (cateid == "spdb")
                {
                    Response.Redirect("/vedio/List.aspx");
                    Response.End();
                }
                string url = ConfigurationManager.AppSettings["Url"];
                try
                {                   
                    t_info_stnet_category ui = nj.t_info_stnet_category.Where(a => a.CATEGORY_ID == cateid).FirstOrDefault();
                    lblName.Text = ui.TITLE;
                    var epsc = DynamicLinqExpressions.True<t_opt_stnet_content>();
                    epsc = epsc.And(c => c.CID == cateid);
                    IQueryable<t_opt_stnet_content> result = cu.LoadEntities(epsc);
                    DataTable dtc = result.OrderByDescending(p => p.PUBDATE).Take(1).ToDataTable();
                    if (dtc.Rows.Count > 0)
                    {
                        string ContentId = dtc.Rows[0]["CONTENT_ID"].ToString();
                        string txt = "";
                        if (dtc.Rows[0]["Text"].ToString().Length > 150)
                        {
                            txt = dtc.Rows[0]["Text"].ToString().Substring(0, 150) + "...";
                        }
                        else
                        {
                            txt = dtc.Rows[0]["Text"].ToString();
                        }

                        ltTop.Text = "<img style='width:85px;height:99px' src='" + url + "/NJ_Stnet/uploadFiles/uploadImgs/contentImg/" + dtc.Rows[0]["IMGURL"].ToString() + "' class='left first_img'></img><div class='right first_content'>"
                                    + "<h3><a href='Detail.aspx?ConId=" + dtc.Rows[0]["CONTENT_ID"].ToString() + "'>" + dtc.Rows[0]["Title"].ToString() + "</a></h3> <p>" + txt + "</p></div>";

                        AspNetPager1.PageSize = 15;
                        int totalRecord = 0;
                        var eps = DynamicLinqExpressions.True<t_opt_stnet_content>();
                        eps = eps.And(c => c.CID == cateid);
                        eps = eps.And(c => c.CONTENT_ID != ContentId);
                        if (AspNetPager1.CurrentPageIndex > 1)
                        {
                            ltTop.Visible = false;
                        }
                        else
                        {
                            ltTop.Visible = true;
                        }
                        IQueryable<t_opt_stnet_content> result2 = cu.LoadPagerEntities(AspNetPager1.PageSize, AspNetPager1.CurrentPageIndex, out totalRecord, eps, false, c1 => c1.PUBDATE);
                        this.AspNetPager1.RecordCount = totalRecord;
                        rptList.DataSource = result2;
                        rptList.DataBind();
                    }
                }
                catch (Exception)
                {
                                       
                }
            }

        }
        //分页
        protected void AspNetPager1_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
        {
            AspNetPager1.CurrentPageIndex = e.NewPageIndex;
            BindBody();
        }
    }
}