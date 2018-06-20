using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using DevExpress.Web.Demos;

namespace wab2018
{
    public partial class mediatorzy : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
           // GridViewFeaturesHelper.SetupGlobalGridViewBehavior(ASPxGridView1);

          //  DemoHelper.Instance.ControlAreaMaxWidth = Unit.Pixel(1200);
            if (!IsCallback && !IsPostBack)
            {
                ASPxGridView1.DataBind();
                ASPxGridView1.DetailRows.ExpandRow(2);
            }
        }
    }
}