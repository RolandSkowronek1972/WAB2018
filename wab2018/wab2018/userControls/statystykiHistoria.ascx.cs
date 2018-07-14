using System;
using System.Data;

namespace wab2018.userControls
{
    public partial class statystykiHistoria : System.Web.UI.UserControl
    {
        cm Cm = new cm();

        protected void Page_Load(object sender, EventArgs e)
        {
            if ( (gridDaneStatystyczne.DataSource == null))
            {
            //    pokazStatystyke();
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            pokazStatystyke();
         }
        private void pokazStatystyke()
        {

            string kwerenda = DropDownList1.SelectedValue.ToString();

            DataTable parametry = Cm.makeParameterTable();
            parametry.Rows.Add("@idBieglego", (string)Session["id_osoby"]);
           // DataTable daneStatystyczne = Cm.getDataTable(kwerenda, Cm.con_str, parametry);
           
            SqlDataSource1.SelectCommand = kwerenda;

            /*  gridDaneStatystyczne.DataSource = null;
              gridDaneStatystyczne.DataSourceID = null;

              gridDaneStatystyczne.DataSource = daneStatystyczne;*/
            gridDaneStatystyczne.Columns.Clear();
            gridDaneStatystyczne.DataBind();

        }
    }
}