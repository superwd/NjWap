using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NjWap
{
    public partial class WebControlHeader : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindHead();
            }
        }
        protected void BindHead()
        {
            NjWap.Code.Tool tool = new Code.Tool();
            DataTable dt = tool.GetBindHead();
            //DataRow newRow;
            //newRow = dt.NewRow();
            //newRow["MODULE_ID"] = "";
            //newRow["TITLE"] = "视频点播";
            //newRow["DESP"] = "视频点播";
            //newRow["CATEGORY_ID"] = "spdb";
            //newRow["IMGURL"] = "";
            //dt.Rows.Add(newRow);
            if (dt.Rows.Count > 0)
            {
                rptHead.DataSource = dt;
                rptHead.DataBind();
            }
        }
    }
}