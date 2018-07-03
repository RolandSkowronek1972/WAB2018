using System;
using System.Web.UI;
using DevExpress.Web.Data;
using DevExpress.Web;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;

namespace wab2018
{
    public partial class mediatorzyLista : System.Web.UI.Page
    {

        Class2 cl = new Class2();
        protected void Page_Load(object sender, EventArgs e)
        {
            //GridViewFeaturesHelper.SetupGlobalGridViewBehavior(grid);

            if (!IsPostBack)
                grid.StartEdit(2);
        }

        protected void updateMediatora(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            
            
            string id= e.OldValues["ident"].ToString();
            Session["idMediatora"] = e.OldValues["ident"].ToString();
            var tytul = grid.FindEditFormTemplateControl("tytul");
            e.NewValues["tytul"] = controlText("txTytul");
            e.NewValues["imie"] = controlText("txImie");
            e.NewValues["nazwisko"] = controlText("txnazwisko");
            e.NewValues["pesel"] = controlText("txPESEL");
            e.NewValues["specjalizacje_ops"] = controlText("txSpecjalizacjeOpis");
            //daty
            e.NewValues["data_poczatkowa"] = controlTextDate("txPoczatekPowolania");
            e.NewValues["data_koncowa"] = controlTextDate("txDataKoncaPowolania");

       
            //zawieszenie
            e.NewValues["pesel"] = controlText("txPESEL");
            e.NewValues["email"] = controlText("txEmail");
            e.NewValues["ulica"] = controlText("txAdres");
            e.NewValues["kod_poczt"] = controlText("txKodPocztowy");
            e.NewValues["tel1"] = controlText("txTelefon1");
            e.NewValues["tel2"] = controlText("txTelefon2");
            e.NewValues["adr_kores"] = controlText("txAdresKorespondencyjny");
            e.NewValues["kod_poczt_kor"] = controlText("txKodPocztowyKorespondencyjny");
            e.NewValues["miejscowosc_kor"] = controlText("txMiejscowoscKorespondencyjny");
            e.NewValues["miejscowosc"] = controlText("txMiejscowosc");
            e.NewValues["miejscowosc"] = controlText("txMiejscowosc");
            // zrobić czeckboxa
            //cbZawieszenie
            e.NewValues["czy_zaw"] = controlCheckbox("cbZawieszenie");


            //daty
            if (controlCheckbox("cbZawieszenie"))
            {
                e.NewValues["d_zawieszenia"] = controlTextDate("txPoczatekZawieszenia");
                e.NewValues["dataKoncaZawieszenia"] = controlTextDate("txKoniecZawieszenia");
            }
            // specjalizacje
            controlGridview();
            //gridSpecjalizacje
        }
        protected void  controlGridview()
        {
            ASPxPageControl pageControl = grid.FindEditFormTemplateControl("ASPxPageControl1") as ASPxPageControl;
            ASPxGridView gridView = pageControl.FindControl("gridSpecjalizacje") as ASPxGridView;
          /*  for (int i = 0; i < gridView.VisibleRowCount; i++)
            {
                gridView.Selection.SelectRow(i);
                    
            }*/
            
        }
        protected bool controlCheckbox(string control)
        {
            ASPxPageControl pageControl = grid.FindEditFormTemplateControl("ASPxPageControl1") as ASPxPageControl;
            ASPxCheckBox txt = pageControl.FindControl(control) as ASPxCheckBox;
           
            return txt.Checked;
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
        protected string controlTextDate(string control)
        {
            ASPxPageControl pageControl = grid.FindEditFormTemplateControl("ASPxPageControl1") as ASPxPageControl;
            ASPxDateEdit txt = pageControl.FindControl(control) as ASPxDateEdit;
            if (txt == null)
            {
                return "";
            }
            return txt.Date.ToShortDateString();
        }
        protected bool controlCheckboxfromWUC()
        {
            ASPxPageControl pageControl = grid.FindEditFormTemplateControl("ASPxPageControl1") as ASPxPageControl;
            zawieszenia txt = pageControl.FindControl("zawieszenia1") as zawieszenia;
            return txt.czyZawieszenie;

        }
        protected DateTime controlPoczatekZawieszeniafromWUC()
        {
            ASPxPageControl pageControl = grid.FindEditFormTemplateControl("ASPxPageControl1") as ASPxPageControl;
            zawieszenia  txt = pageControl.FindControl("zawieszenia1") as zawieszenia;
            return txt.pocztek.Date;
        }

        protected DateTime controlKoniecZawieszeniafromWUC()
        {
            ASPxPageControl pageControl = grid.FindEditFormTemplateControl("ASPxPageControl1") as ASPxPageControl;
            zawieszenia txt = pageControl.FindControl("zawieszenia1") as zawieszenia;
            return txt.koniec.Date;
        }

        protected void InsertData(object sender, ASPxDataInitNewRowEventArgs e)
        {

            e.NewValues["data_poczatkowa"] = DateTime.Now.Date;
            e.NewValues["data_koncowa"] = DateTime.Now.AddYears(10);
            //d_zawieszenia
            e.NewValues["d_zawieszenia"] = DateTime.Now;
            e.NewValues["dataKoncaZawieszenia"] = DateTime.Now;
        }

        protected void grid_StartRowEditing(object sender, ASPxStartRowEditingEventArgs e)
        {
            string id = e.EditingKeyValue.ToString();


            Session["idMediatora"] = id;
            Session["id_osoby"] = id;
            object lst = grid.GetRowValuesByKeyValue(e.EditingKeyValue,new string[] { "czy_zaw" });
            ASPxPageControl pageControl = grid.FindEditFormTemplateControl("ASPxPageControl1") as ASPxPageControl;
            var txt = pageControl.FindControl("dvPassport") as object;
        //    controlGridview();

            //   ClientScriptManager sc = Page.ClientScript;
            // sc.RegisterStartupScript(this.GetType(), "key", "alert('Hello!I am an alert box!!');", false);
            //  Page.ClientScript.RegisterClientScriptInclude("Registration", "alert('Hello!I am an alert circle!!');");
            // Page.RegisterStartupScript("key", "alert('Hello!I am an alert traigle!!');");
            //var zawieszeni = lst(0);
            //  ASPxPageControl pageControl = grid.FindEditFormTemplateControl("ASPxPageControl1") as ASPxPageControl;
            //  zawieszenia txt = pageControl.FindControl("zawieszenia1") as zawieszenia;


        }
        protected void grid_BatchUpdate(object sender, ASPxDataBatchUpdateEventArgs e)
        {
            var cos = e.UpdateValues;
        }
    }
}