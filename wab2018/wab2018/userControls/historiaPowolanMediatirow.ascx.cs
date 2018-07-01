using System;
using System.Web.UI;
using DevExpress.Web;

namespace wab2018
{
    public partial class historiaPowolanMediatirow : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string[] names = Enum.GetNames(typeof(GridViewEditingMode));
//foreach (string name in names)
            //        ddlEditMode.Items.Add(name);
           //     ddlEditMode.Text = grid.SettingsEditing.Mode.ToString();
                ASPxGridView1.StartEdit(1);
            }
        }

        protected void ASPxGridView1_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
          
          
        }

        protected void ASPxGridView1_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["data_od"] = DateTime.Now;
            e.NewValues["data_do"] = DateTime.Now.AddYears(10);
            string biegly = (string)Session["idMoediatora"];
            e.NewValues["id_bieglego"] = biegly;
            e.NewValues["d_kreacji"] = DateTime.Now.Date;
            e.NewValues["kreator"] = (string)Session["user_id"];
            e.NewValues["czyue"] = "0";
            //INSERT INTO[tbl_powolania]([id_bieglego], [id_powolania], [data_od], [data_do], [kreator], [modyfikator], [czyus]) VALUES(@id_bieglego, @id_powolania, @data_od, @data_do, @d_kreacji, @d_modyfikacji, @kreator, @modyfikator, @czyus)


        }

        protected void ASPxGridView1_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            int index = 0;
           
                ASPxGridView1.SettingsEditing.Mode = (GridViewEditingMode)index;
        }

        protected void ASPxTextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}