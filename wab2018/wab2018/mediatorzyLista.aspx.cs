using System;
using System.Web.UI.WebControls;
using DevExpress.Web.Data;
using DevExpress.Web;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;

namespace wab2018
{
    public partial class mediatorzyLista : System.Web.UI.Page
    {
        nowiMediatorzy nm = new nowiMediatorzy();

        Class2 cl = new Class2();
        protected void Page_Load(object sender, EventArgs e)
        {
            //GridViewFeaturesHelper.SetupGlobalGridViewBehavior(grid);

            if (!IsPostBack)
            {
                grid.StartEdit(2);

                string rola = (string)Session["rola"];
                if (rola == "3") //read only
                {
                    grid.Visible = false;
                    grid0.Visible = true;
                }
                else
                {

                    grid.Visible = true;
                    grid0.Visible = false;
                }

            }

        }

        protected void updateMediatora(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {

            //dane osobowe
            e.NewValues["tytul"] = nm.controlText("txTytul", grid);
            e.NewValues["imie"] = nm.controlText("txImie", grid);
            e.NewValues["nazwisko"] = nm.controlText("txNazwisko", grid);
            e.NewValues["data_poczatkowa"] = nm.controlTextDate("txPoczatekPowolania", grid);
            e.NewValues["data_koncowa"] = nm.controlTextDate("txDataKoncaPowolania", grid);
            if (nm.controlText("txPESEL", grid) == null)
            {
                e.NewValues["Pesel"] = 0;
            }
            else
            {
                e.NewValues["Pesel"] = nm.controlText("txPESEL", grid);

            }
            //d_zawieszenia
            bool cos= nm.controlCheckbox("cbZawieszenie", grid);
            e.NewValues["czy_zaw"] = nm.controlCheckbox("cbZawieszenie", grid);
            if (nm.controlCheckbox("cbZawieszenie", grid))
            {
                e.NewValues["d_zawieszenia"] = nm.controlTextDate("txPoczatekZawieszenia", grid);
                e.NewValues["dataKoncaZawieszenia"] =  nm.controlTextDate("txKoniecZawieszenia", grid);
            }
            //dane adresowe
            e.NewValues["ulica"] = nm.controlText("txAdres", grid);
            e.NewValues["kod_poczt"] = nm.controlText("txKodPocztowy", grid);
            e.NewValues["miejscowosc"] = nm.controlText("txMiejscowosc", grid);
            e.NewValues["tel1"] = nm.controlText("txTelefon1", grid);
            e.NewValues["tel2"] = nm.controlText("txTelefon2", grid);
            e.NewValues["email"] = nm.controlText("txEmail", grid);
            //dane korespondencyjne
            e.NewValues["adr_kores"] = nm.controlText("txAdresKorespondencyjny", grid);
            e.NewValues["kod_poczt_kor"] = nm.controlText("txKodPocztowyKorespondencyjny", grid);
            e.NewValues["miejscowosc_kor"] = nm.controlText("txMiejscowoscKorespondencyjny", grid);
            // uwagi i specjalizacje
            e.NewValues["uwagi"] = nm.controlTextMemo("txUwagi", grid);
            e.NewValues["specjalizacja_opis"] = nm.controlTextMemo("txSpecjalizacjeOpis", grid);



        }


        protected void InsertData(object sender, ASPxDataInitNewRowEventArgs e)
        {

            e.NewValues["data_poczatkowa"] = DateTime.Now.Date;
            e.NewValues["data_koncowa"] = DateTime.Now.AddYears(10);
            //d_zawieszenia
            e.NewValues["d_zawieszenia"] = DateTime.Now;
            e.NewValues["dataKoncaZawieszenia"] = DateTime.Now;
            string idOsoby = cl.dodaj_osobe(2,0);

            Session["idMediatora"] = idOsoby;
            Session["id_osoby"] = idOsoby;
        }

        protected void grid_StartRowEditing(object sender, ASPxStartRowEditingEventArgs e)
        {
            string id = e.EditingKeyValue.ToString();


            Session["idMediatora"] = id;
            Session["id_osoby"] = id;
    //        object lst = grid.GetRowValuesByKeyValue(e.EditingKeyValue,new string[] { "czy_zaw" });
         //   ASPxPageControl pageControl = grid.FindEditFormTemplateControl("ASPxPageControl1") as ASPxPageControl;
      //      var txt = pageControl.FindControl("dvPassport") as object;
          //  ASPxCheckBox zawieszenie = pageControl.FindControl("cbZawieszenie") as ASPxCheckBox;
           // zawieszenie.Checked = (bool)lst;
           
            //    controlGridview();

            //   ClientScriptManager sc = Page.ClientScript;
            // sc.RegisterStartupScript(this.GetType(), "key", "alert('Hello!I am an alert box!!');", false);
            //  Page.ClientScript.RegisterClientScriptInclude("Registration", "alert('Hello!I am an alert circle!!');");
            // Page.RegisterStartupScript("key", "alert('Hello!I am an alert traigle!!');");
            //var zawieszeni = lst(0);
            //  ASPxPageControl pageControl = grid.FindEditFormTemplateControl("ASPxPageControl1") as ASPxPageControl;
            //  zawieszenia txt = pageControl.FindControl("zawieszenia1") as zawieszenia;


        }
       

        protected void grid_RowInserting(object sender, ASPxDataInsertingEventArgs e)
        {
            //dane osobowe
            e.NewValues["tytul"] = nm.controlText("txTytul", grid);
            e.NewValues["imie"] = nm.controlText("txImie", grid);
            e.NewValues["nazwisko"] = nm.controlText("txNazwisko", grid);
            e.NewValues["data_poczatkowa"] = nm.controlTextDate("txPoczatekPowolania", grid);
            e.NewValues["data_koncowa"] = nm.controlTextDate("txDataKoncaPowolania", grid);
            if (nm.controlText("txPESEL", grid) == null)
            {
                e.NewValues["Pesel"] = 0;
            }
            else
            {
                e.NewValues["Pesel"] = nm.controlText("txPESEL", grid);

            }
            //d_zawieszenia
            bool cos = nm.controlCheckbox("cbZawieszenie", grid);
            e.NewValues["czy_zaw"] = nm.controlCheckbox("cbZawieszenie", grid);
            if (nm.controlCheckbox("cbZawieszenie", grid))
            {
                e.NewValues["d_zawieszenia"] = nm.controlTextDate("txPoczatekZawieszenia", grid);
                e.NewValues["dataKoncaZawieszenia"] = nm.controlTextDate("txKoniecZawieszenia", grid);
            }
            //dane adresowe
            e.NewValues["ulica"] = nm.controlText("txAdres", grid);
            e.NewValues["kod_poczt"] = nm.controlText("txKodPocztowy", grid);
            e.NewValues["miejscowosc"] = nm.controlText("txMiejscowosc", grid);
            e.NewValues["tel1"] = nm.controlText("txTelefon1", grid);
            e.NewValues["tel2"] = nm.controlText("txTelefon2", grid);
            e.NewValues["email"] = nm.controlText("txEmail", grid);
            //dane korespondencyjne
            e.NewValues["adr_kores"] = nm.controlText("txAdresKorespondencyjny", grid);
            e.NewValues["kod_poczt_kor"] = nm.controlText("txKodPocztowyKorespondencyjny", grid);
            e.NewValues["miejscowosc_kor"] = nm.controlText("txMiejscowoscKorespondencyjny", grid);
            // uwagi i specjalizacje
            e.NewValues["uwagi"] = nm.controlTextMemo("txUwagi", grid);
            e.NewValues["specjalizacja_opis"] = nm.controlTextMemo("txSpecjalizacjeOpis", grid);







        }

        protected void grid_CancelRowEditing(object sender, ASPxStartRowEditingEventArgs e)
        {
            var cos = e.EditingKeyValue;
            if (e.EditingKeyValue==null)
            {
                try
                {
                    int idOsoby = int.Parse((string)Session["id_osoby"]);
                    nm.usunTworzonaOsobe(idOsoby);
                }
                catch (Exception ex)
                {
                    
                }
             

            }

        } // end of grid_CancelRowEditing

        protected void grid_RowInserted(object sender, ASPxDataInsertedEventArgs e)
        {
            var a = e.AffectedRecords;
            
        }

        protected void grid_RowValidating(object sender, ASPxDataValidationEventArgs e)
        {
            var nazwisko = e.NewValues["nazwisko"];
        }

        protected void grid_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            string rola = (string)Session["rola"];
            if (rola == "1") //read only
            {
                if (e.ButtonType==ColumnCommandButtonType.New)
                {
                    e.Visible = false;
                }
            }
        }

     
    }
}