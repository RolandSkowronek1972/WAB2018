using System;

namespace wab2018.userControls
{
    public partial class skargiBieglych : System.Web.UI.UserControl
    {
        public Class2 cl = new Class2();
        protected void Page_Load(object sender, EventArgs e)
        {


            string idBieglego = (string)Session["id_osoby"];
            ASPxGridView1.DataBind();
        }

        protected void startDodawanianowejSkargi(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            
            string idBieglego = (string)Session["id_osoby"];
            string numer = cl.podajNumerSkargiwRoku(idBieglego,DateTime.Now.Year);
            e.NewValues["rok"] = DateTime.Now.Year; 
            e.NewValues["numer"]=numer;
            e.NewValues.Add("rok", DateTime.Now.Year);
            e.NewValues.Add("numer", numer);
        }

        protected void ASPxGridView1_CellEditorInitialize(object sender, DevExpress.Web.ASPxGridViewEditorEventArgs e)
        {
            string idBieglego = (string)Session["id_osoby"];
            if (e.Column.FieldName == "Numer")
            {
                e.Editor.Value =  cl.podajNumerSkargiwRoku(idBieglego, DateTime.Now.Year); ;
            }
            if (e.Column.FieldName == "Numer")
            {
                e.Editor.Value =  DateTime.Now.Year ;
                
            }
        }
    }
}