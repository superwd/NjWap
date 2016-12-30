using EntityManage;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NjWap.In
{
    public partial class List : System.Web.UI.Page
    {
        BaseRepository<T_OPT_STNET_EXCHANGE> exc = new BaseRepository<T_OPT_STNET_EXCHANGE>();
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
            var eps = DynamicLinqExpressions.True<T_OPT_STNET_EXCHANGE>();
            eps = eps.And(c => c.PID == "");
            if (Context.User.Identity.Name != "" && Request["Uid"] != null)
            {
                string Uid = Request["Uid"];
                eps = eps.And(c => c.CREATEUSER == Uid);
            }
            IQueryable<T_OPT_STNET_EXCHANGE> result = exc.LoadPagerEntities(AspNetPager1.PageSize, AspNetPager1.CurrentPageIndex, out totalRecord, eps, false, c1 => c1.CREATEDATE);
            this.AspNetPager1.RecordCount = totalRecord;
            rptList.DataSource = result;
            rptList.DataBind();
        }
    }
}