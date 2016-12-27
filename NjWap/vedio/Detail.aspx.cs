using EntityManage;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NjWap.vedio
{
    public partial class Detail : System.Web.UI.Page
    {
        njEntities nj = new njEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["Id"] !=null)
                {
                    string Id = Request["Id"];
                    vedio_show_view vv = nj.vedio_show_view.Where(c => c.ID == Id).FirstOrDefault();
                    if (vv != null)
                    {
                        lblTitle.Text = vv.TITLE;
                        lblDate.Text = vv.CREATEDATE;
                        ltVedio.Text = "<source src='" + ConfigurationManager.AppSettings["Url"] + "/NJ_Sttrain/" + vv.VEDIOURL + "' type='video/ogg'>" +
                            "<source src='" + ConfigurationManager.AppSettings["Url"] + "/NJ_Sttrain/" + vv.VEDIOURL + "' type='video/mp4'>" +
                            "<source src='" + ConfigurationManager.AppSettings["Url"] + "/NJ_Sttrain/" + vv.VEDIOURL + "' type='video/webm'>" +
                            "<object data='" + ConfigurationManager.AppSettings["Url"] + "/NJ_Sttrain/" + vv.VEDIOURL + "' width='320' height='240'>";
                    }
                }
               
            }
        }
    }
}