using System;
using DevExpress.Web.Data;


namespace wab2018
{
    public partial class biegliLista_old : System.Web.UI.Page
    {
        nowiMediatorzy nm = new nowiMediatorzy();
        cm Cm = new cm();
        Class2 cl = new Class2();
        protected void Page_Load(object sender, EventArgs e)
        {
            //GridViewFeaturesHelper.SetupGlobalGridViewBehavior(grid);

            if (!IsPostBack)
            {


                if (Session["user_id"] == null)
                {
                    Server.Transfer("logowanie.aspx");
                }

          

                string rola = (string)Session["rola"];
                if (rola == "1") //read only
                {
                    grid.Visible = false;
                    grid0.Visible = true;
                }
                else
                {

                    grid.Visible = true;
                    grid0.Visible = false;
                }
             
            //    grid.StartEdit(2);

            }

        }

        protected void updateMediatora(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            string txt=mediatorzy.SelectCommand;
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
            e.NewValues["instytucja"] = nm.controlText("txInstytucja", grid);


        }


        protected void InsertData(object sender, ASPxDataInitNewRowEventArgs e)
        {

            e.NewValues["data_poczatkowa"] = DateTime.Now.Date;
            DateTime   dataKoncz =  DateTime.Parse ( DateTime.Now.AddYears(5).Year.ToString() +"-"+ DateTime.Now.AddMonths(1).Month .ToString("D2") + "-01").AddDays (-1);
            e.NewValues["data_koncowa"] = dataKoncz;
            //d_zawieszenia
            e.NewValues["d_zawieszenia"] = DateTime.Now;
            e.NewValues["dataKoncaZawieszenia"] = dataKoncz;
            string idOsoby = cl.dodaj_osobe(2,0);

            Session["idMediatora"] = idOsoby;
            Session["id_osoby"] = idOsoby;
        }

        protected void grid_StartRowEditing(object sender, ASPxStartRowEditingEventArgs e)
        {

            string id = e.EditingKeyValue.ToString();
            Session["idMediatora"] = id;
            Session["id_osoby"] = id;
           // ustawbaze();
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
            e.NewValues["instytucja"] = nm.controlText("txInstytucja", grid);






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

      

        protected void grid_RowValidating(object sender, ASPxDataValidationEventArgs e)
        {
            var nazwisko = e.NewValues["nazwisko"];
        }

      
  
    }
}