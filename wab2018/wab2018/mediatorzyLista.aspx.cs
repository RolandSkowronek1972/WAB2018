using System;
using System.Web.UI;
using DevExpress.Web.Data;
using DevExpress.Web;
namespace wab2018
{
    public partial class mediatorzyLista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //GridViewFeaturesHelper.SetupGlobalGridViewBehavior(grid);

            if (!IsPostBack)
                grid.StartEdit(2);
        }

        protected void updateMediatora(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {

            var tytul = grid.FindEditFormTemplateControl("tytul");
            e.NewValues["tytul"] = controlText("txTytul");
            e.NewValues["imie"] = controlText("txImie");
            e.NewValues["nazwisko"] = controlText("txnazwisko");
            e.NewValues["pesel"] = controlText("txPESEL");
            e.NewValues["specjalizacje_ops"] = controlText("txSpecjalizacjeOpis");
          
        }
        protected string controlText(string control )
        {
            ASPxPageControl pageControl = grid.FindEditFormTemplateControl("ASPxPageControl1") as ASPxPageControl;
            ASPxTextBox txt = pageControl.FindControl(control) as ASPxTextBox;
            if (txt==null)
            {
                return "";
            }
            return txt.Text;
        }
    }
}