using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace wab2018.userControls
{
    public partial class skargiBieglych : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            string idBieglego = (string)Session["id_osoby"];
            ASPxGridView1.DataBind();
        }
    }
}