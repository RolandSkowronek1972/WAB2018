using System;
using System.Web.UI;
using DevExpress.Web;

namespace wab2018
{
    public partial class specjalizacjeBieglych : System.Web.UI.UserControl
    {
        Class2 cl = new Class2();
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void ASPxGridView1_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {

            var a= e.AffectedRecords;
           
        }

        protected void ASPxGridView1_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["data_od"] = DateTime.Now;
            e.NewValues["data_do"] = DateTime.Now.AddYears(5);
            string biegly = (string)Session["idMediatora"];
            e.NewValues["id_bieglego"] = biegly;
            e.NewValues["d_kreacji"] = DateTime.Now.Date;
            e.NewValues["kreator"] = (string)Session["user_id"];
            e.NewValues["czyus"] = "0";
          

        }

       

      
        protected void ASPxGridView1_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            e.Editor.ReadOnly = false;
            if (e.Column.FieldName == "nazwa")
            {
                e.Editor.ReadOnly = true;
            }
        }

        protected void ASPxGridView1_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
           
            var ident = e.NewValues["ident"];
        }

       

        protected void ASPxGridView1_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            string biegly = (string)Session["idMediatora"];
          
            e.NewValues["id_bieglego"] = biegly;
        }

        protected void dodajSpecjalizacje(object sender, EventArgs e)
        {
            // ASPxComboBox1.cl
            var cos = ASPxComboBox1.SelectedItem.Value;
                var specjalizacja = ASPxComboBox1.SelectedItem.GetFieldValue("id_");
            string biegly = (string)Session["idMediatora"];
            cl.dodaj_specjalizacje_osoby(specjalizacja.ToString(), biegly);
        }

        protected void ASPxGridView1_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            
        }
    }
}