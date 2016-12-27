using EntityManage;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NjWap.vedio
{
    public partial class List : System.Web.UI.Page
    {
        BaseRepository<vedio_show_view> exc = new BaseRepository<vedio_show_view>();
        njEntities nj = new njEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindExchange();
            }
        }

        protected void AspNetPager1_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
        {
            AspNetPager1.CurrentPageIndex = e.NewPageIndex;
            BindExchange();
        }

        protected void BindExchange()
        {
            AspNetPager1.PageSize = 15;
            int totalRecord = 0;
            var eps = DynamicLinqExpressions.True<vedio_show_view>();
            //eps = eps.And(c => c.PID == "");
            IQueryable<vedio_show_view> result = exc.LoadPagerEntities(AspNetPager1.PageSize, AspNetPager1.CurrentPageIndex, out totalRecord, eps, false, c1 => c1.CREATEDATE);
            this.AspNetPager1.RecordCount = totalRecord;
            rptList.DataSource = result;
            rptList.DataBind();
        }
    }
}