using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using DevExpress.Web.Demos;
namespace wab2018
{
    public partial class ListaMediatorow : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            //  GridViewFeaturesHelper.SetupGlobalGridViewBehavior(Grid);
            if (!IsPostBack)
                Grid.StartEdit(2);
            /*Grid.SettingsEditing.BatchEditSettings.EditMode = (GridViewBatchEditMode)Enum.Parse(typeof(GridViewBatchEditMode), "Row", true);
            Grid.SettingsEditing.BatchEditSettings.StartEditAction = (GridViewBatchStartEditAction)Enum.Parse(typeof(GridViewBatchStartEditAction), "DblClick", true);
            Grid.SettingsEditing.BatchEditSettings.HighlightDeletedRows =true;*/
        }

        protected void Grid_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
         string cos=   e.NewValues["tytul"].ToString();
        }
    }
}