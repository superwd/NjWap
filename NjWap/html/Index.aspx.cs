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
    public partial class Index : System.Web.UI.Page
    {
        BaseRepository<category_show_view> bu = new BaseRepository<category_show_view>();
        BaseRepository<t_opt_stnet_content> cu = new BaseRepository<t_opt_stnet_content>();
        public static int Tcount=0;
        public static string List = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindImgList();
                BindBodyTop();
                BindBodyMain();
            }
        }
        //头
        

        //首页轮播
        protected void BindImgList()
        {
            try
            {
                string cateid = ConfigurationManager.AppSettings["SID"];
                string url = ConfigurationManager.AppSettings["Url"];
                var epsc = DynamicLinqExpressions.True<t_opt_stnet_content>();
                epsc = epsc.And(c => c.CID == cateid);
                DataTable dtc = cu.LoadEntities(epsc).ToDataTable();
                if (dtc.Rows.Count > 0)
                {
                    foreach (DataRow dr in dtc.Rows)
                    {
                        ltSy.Text += "<li><a href='Detail.aspx?ConId=" + dr["Content_ID"].ToString() + "'><span style='background-image:url(" + url + "/NJ_Stnet/uploadFiles/uploadImgs/contentImg/" + dr["IMGURL"].ToString() + ")'></span></a></li>";
                    }

                }
            }
            catch (Exception)
            {

                throw;
            }

        }

        //绑定分类头
        protected void BindBodyTop()
        {
            try
            {
                var eps = DynamicLinqExpressions.True<category_show_view>();
                IQueryable<category_show_view> result = bu.LoadEntities(eps);
                rptBodyTop.DataSource = result.OrderBy(p => p.CATEGORY_ID).Take(1).ToDataTable();
                rptBodyTop.DataBind();
            }
            catch (Exception)
            {
                return;
            }        

        }

        //绑定分类中间部分
        protected void BindBodyMain()
        {
            try
            {
                var eps = DynamicLinqExpressions.True<category_show_view>();
            string cateId= ConfigurationManager.AppSettings["CID"];
            eps = eps.And(c => c.CATEGORY_ID != cateId);
            
                int count = bu.LoadEntitiesCount(eps);
                //Tcount = count;
                IQueryable<category_show_view> result = bu.LoadEntities(eps);
                DataTable dts = result.OrderBy(p => p.CATEGORY_ID).Take(1).ToDataTable();
                string HeadList = "";
                string cateid = "";
                if (dts.Rows.Count > 0)
                {
                    cateid = dts.Rows[0]["CATEGORY_ID"].ToString();
                    var epsc = DynamicLinqExpressions.True<t_opt_stnet_content>();
                    epsc = epsc.And(c => c.CID == cateid);
                    DataTable dtc = cu.LoadEntities(epsc).ToDataTable();
                    if (dtc.Rows.Count > 0)
                    {
                        int hcount = dtc.Rows.Count;
                        if (dtc.Rows.Count > 5)
                        {
                            hcount = 5;
                        }
                        for (int i = 0; i < hcount; i++)
                        {
                            if (i == 0)
                            {
                                string txt = "";
                                if (dtc.Rows[i]["Text"].ToString().Length > 150)
                                {
                                    txt = dtc.Rows[i]["Text"].ToString().Substring(0, 150) + "...";
                                }
                                else
                                {
                                    txt = dtc.Rows[i]["Text"].ToString();
                                }
                                HeadList += "<li class='first'><a href='Detail.aspx?ConId=" + dtc.Rows[i]["Content_ID"].ToString() + "'><img style='width:85px;height:99px' src='" + dts.Rows[0]["CATEGORY_ID"].ToString() + "'></a><a href='#'><b></b></a>"
                                    + "<b> <a href='Detail.aspx?ConId=" + dtc.Rows[i]["Content_ID"].ToString() + "' target='_blank' title='" + dtc.Rows[i]["Title"].ToString() + "'>" + dtc.Rows[i]["Title"].ToString() + "</a></b>"
                                    + "<span class='InfoContent'><br>" + txt + "</span>";
                            }
                            else
                            {
                                HeadList += "<li><a href='Detail.aspx?ConId=" + dtc.Rows[i]["Content_ID"].ToString() + "' target='_blank' title='" + dtc.Rows[i]["Title"].ToString() + "'>" + dtc.Rows[i]["Title"].ToString() + "</a></li>";
                            }
                        }
                        ltHead.Text = HeadList;
                    }
                }
                int totalRecord = 0;
                string div = "";
                for (int i = 1; i < count - 1; i++)
                {
                    string array = "";
                    eps = eps.And(c => c.CATEGORY_ID != cateid);
                    DataTable dt2 = bu.LoadPagerEntities(3, i, out totalRecord, eps, true, p => p.CATEGORY_ID).ToDataTable();
                    if (dt2.Rows.Count > 0)
                    {
                        string cate = "";
                        for (int j = 0; j < dt2.Rows.Count; j++)
                        {
                            if (j == 0)
                            {
                                string guid = Guid.NewGuid().ToString();
                                cate += "<li class='current' id=" + guid + " onclick='cate(\"" + guid + "\",\"ui_tab" + i + "\"," + j + ")'>" + dt2.Rows[j]["Title"].ToString() + "</li>";
                            }
                            else
                            {
                                string guid = Guid.NewGuid().ToString();
                                cate += "<li id=" + guid + " onclick='cate(\"" + guid + "\",\"ui_tab" + i + "\"," + j + ")'>" + dt2.Rows[j]["Title"].ToString() + "</li>";
                            }
                        }
                        array += "<ul class='ui_tab_nav ui-border - b'>" + cate + "</ul> ";
                        string contents = "";
                        for (int j = 0; j < dt2.Rows.Count; j++)
                        {
                            string neirong = "";
                            var epsc = DynamicLinqExpressions.True<t_opt_stnet_content>();
                            string CID = dt2.Rows[j]["CATEGORY_ID"].ToString();
                            epsc = epsc.And(c => c.CID == CID);
                            DataTable dt3 = cu.LoadEntities(epsc).OrderByDescending(c => c.PUBDATE).ToDataTable();
                            int Count = dt3.Rows.Count;
                            if (dt3.Rows.Count > 5)
                            {
                                Count = 5;
                            }
                            for (int t = 0; t < Count; t++)
                            {
                                neirong += "<li><a href='Detail.aspx?ConId=" + dt3.Rows[t]["Content_ID"].ToString() + "' target='_blank' title='" + dt3.Rows[t]["Title"].ToString() + "'>" + dt3.Rows[t]["Title"].ToString() + "</a></li>";
                            }
                            contents += "<li class='ui_tab_content_item'><ul class='textlist'>" + neirong + "</ul><a href='List.aspx?CID=" + dt2.Rows[j]["CATEGORY_ID"].ToString() + "' class='bot_link_more'>查看更多</a></li>";
                        }
                        array += "<ul class='ui_tab_content'>" + contents + "</ul>";

                        div += "<div id='ui_tab" + i + "' class='ui-tab' >" + array + "</div>";
                    }
                    else
                    {
                        break;
                    }
                }
                ltBody.Text = div;
            }
            catch (Exception)
            {
                return;
            }
        }

        protected void rptBodyMain_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {           
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                //Literal Literal1 = e.Item.FindControl("Literal1") as Literal;
                //string str = "";
                //DataRowView rowv = (DataRowView)e.Item.DataItem;
                //if (e.Item.ItemIndex + 1 == 1)
                //{
                //    str = "<div id='ui_tab" + e.Item.ItemIndex + "' class='ui-tab'><ul class='ui_tab_nav ui-border-b'><li class='current' id='li"+ e.Item.ItemIndex + "' onclick='cate(\"li" + e.Item.ItemIndex + "\", 0)'>" + rowv["Title"].ToString() + "</li>";
                //    List = "";
                //}
                //else
                //{
                //    if ((e.Item.ItemIndex + 1) == Tcount - 1)
                //    {
                //        str += "<li id='li" + e.Item.ItemIndex + "' onclick='cate(\"li" + e.Item.ItemIndex + "\", 0)'>" + rowv["Title"].ToString() + "</li></ul></div>";
                //    }
                //    if ((e.Item.ItemIndex + 1) % 3 == 0)
                //    {                             
                //            str += "<li id='li" + e.Item.ItemIndex + "' onclick='cate(\"li" + e.Item.ItemIndex + "\", 0)'>" + rowv["Title"].ToString() + "</li></ul>"
                //                + ""
                //                +"</div><div id='ui_tab" + e.Item.ItemIndex + "' class='ui-tab'><ul class='ui_tab_nav ui-border-b'>";                  
                //    }
                //    else
                //    {
                //        if ((e.Item.ItemIndex) % 3 == 0)
                //        {
                //            str = "<li class='current' id='li" + e.Item.ItemIndex + "' onclick='cate(\"li" + e.Item.ItemIndex + "\", 0)'>" + rowv["Title"].ToString() + "</li>";
                //        }
                //        else
                //        {
                //            str = "<li id='li" + e.Item.ItemIndex + "' onclick='cate(\"li" + e.Item.ItemIndex + "\", 0)'>" + rowv["Title"].ToString() + "</li>";
                //        }                      
                //    }
                //}             
                //Literal1.Text = str;
            }
            
        }
    }
}