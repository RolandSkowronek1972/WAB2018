using System;
using System.Collections.Generic;
using System.Linq;
using DevExpress.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace wab2018.userControls
{
    public partial class speckiBieglych : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxGridView1_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            string biegly = (string)Session["idMediatora"];

            e.NewValues["id_bieglego"] = biegly;
        }



        protected void ASPxGridView1_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            string biegly = (string)Session["idMediatora"];

            e.NewValues["id_bieglego"] = biegly;
            ASPxPageControl pageControl = ASPxGridView1.FindEditFormTemplateControl("ASPxPageControl1") as ASPxPageControl;
            // ASPxComboBox combobox = pageControl.FindControl("ASPxComboBox1") as ASPxComboBox;
            ASPxComboBox combobox = ASPxGridView1.FindEditRowCellTemplateControl((GridViewDataColumn)ASPxGridView1.Columns["nazwa"], "ASPxComboBox1") as ASPxComboBox;
            var id = e.OldValues["id_"];
            try
            {
                var idspecjalizacji = combobox.SelectedItem.Value;
                e.NewValues["id_specjalizacji"] = idspecjalizacji;
                Int64 te = (Int64)Session["key"];
                e.NewValues["id"] = te;
                e.NewValues["id_"] = te;
            }
            catch (Exception ex)
            { }

            Session["flagaSkarg"] = 1;
        }


        protected void ASPxGridView1_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            Session["key"] = e.EditingKeyValue;
        }

    }

      
}