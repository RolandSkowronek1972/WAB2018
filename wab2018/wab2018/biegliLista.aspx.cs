using System;
using DevExpress.Web.Data;
using DevExpress.Web;
using System.IO;
using DevExpress.XtraPrinting;
using System.Web;
using System.Net.Mime;

using System.Data;
using DevExpress.Web;
using System.Collections;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Configuration;
using System.IO;
using DevExpress.XtraPrinting;
using System.Net;


namespace wab2018
{
    public partial class biegliLista : System.Web.UI.Page
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
                


            }
            ustawKwerendeOdczytu();
            var parametr = Request.QueryString["skarga"];
            if (parametr != null)
            {
                string staraSkarhe = (string)Session["skargaId"];
                if (staraSkarhe!= parametr)
                {
                    Session["flagaSkarg"] = 0;
                }
                Session["skargaId"] = parametr;
                int flagaSkarg = 0;
                try
                {
                    flagaSkarg=(int)Session["flagaSkarg"];
                }
                catch (Exception)
                {
                    
                }
               
                if (flagaSkarg==0)
                {
                    int idBieglego = cl.podajIdOsobyPoNumerzeSkargi(int.Parse(parametr));
                    Session["id_osoby"] = idBieglego;
                    string nazwisko = cl.podajNazwiskoOsobyPoNumerzeSkargi(int.Parse(parametr));
                    int visibleIndex = grid.FindVisibleIndexByKeyValue(idBieglego);

                    //Remove the items
                    grid.Selection.SelectRow(visibleIndex);
                    grid.StartEdit(visibleIndex);
                    try
                    {
                        ASPxPageControl pageControl = grid.FindEditFormTemplateControl("ASPxPageControl1") as ASPxPageControl;
                        pageControl.ActiveTabIndex = 6;
                        Session["flagaSkarg"] = 1;

                    }
                    catch (Exception)
                    {

                        
                    }
                }
                Session["skargaId"] = parametr;
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
            string userId = (string)Session["user_id"];
            string idOsoby = cl.dodaj_osobe(1,int.Parse (userId ) );

            Session["idMediatora"] = idOsoby;
            Session["id_osoby"] = idOsoby;
        }

        protected void grid_StartRowEditing(object sender, ASPxStartRowEditingEventArgs e)
        {
            //txKoniecZawieszenia.
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

       

        protected void grid_BeforePerformDataSelect(object sender, EventArgs e)
        {
            ustawKwerendeOdczytu();
            mediatorzy.SelectCommand = (string)Session["kwerenda"];
        }

     
        protected void poSpecjalizacji(object sender, EventArgs e)
        {
            ustawKwerendeOdczytu();
        }
        
        protected void ustawKwerendeOdczytu()
        {
            string kwerendabazowa = "SELECT DISTINCT ulica, kod_poczt, miejscowosc, COALESCE(czy_zaw, 0) AS czy_zaw, tel2, email, COALESCE (d_zawieszenia, '1900-01-01') AS d_zawieszenia, COALESCE (dataKoncaZawieszenia, '1900-01-01') AS dataKoncaZawieszenia, GETDATE() AS now, tytul, uwagi, specjalizacja_opis, specjalizacjeWidok, miejscowosc_kor, kod_poczt_kor, adr_kores, imie, ident,   data_poczatkowa, data_koncowa, pesel, tel1, typ, nazwisko, instytucja FROM            tbl_osoby WHERE(czyus = 0) AND(typ < 2) AND(data_koncowa >= GETDATE()) ";
            Session["kwerenda"] = kwerendabazowa;
            if (!ASPxCheckBox1 .Checked)
            {
                Session["kwerenda"] = kwerendabazowa;
            }
            else
            {
                Session["kwerenda"] = "SELECT DISTINCT ulica, kod_poczt, miejscowosc, COALESCE(czy_zaw, 0) AS czy_zaw, tel2, email, COALESCE (d_zawieszenia, '1900-01-01') AS d_zawieszenia, COALESCE (dataKoncaZawieszenia, '1900-01-01') AS dataKoncaZawieszenia, GETDATE() AS now, tytul, uwagi, specjalizacja_opis, specjalizacjeWidok, miejscowosc_kor, kod_poczt_kor, adr_kores, imie, ident,   data_poczatkowa, data_koncowa, pesel, tel1, typ, nazwisko, instytucja FROM            tbl_osoby WHERE(czyus = 0) AND(typ < 2) AND(data_koncowa < GETDATE())";
            }
            // po specjalizacji
            if (DropDownList1.SelectedIndex==-1)
            {
                DropDownList1.SelectedIndex = 0;
            }
            string kwerenda=(string)Session["kwerenda"];
            try
            {
                if (ASPxCheckBox2.Checked)
                {
                    string specjalizacja = DropDownList1.SelectedValue;
                  
                    kwerenda = kwerenda + "  and (select count(*) from tbl_specjalizacje_osob where id_specjalizacji =" + specjalizacja.Trim() + " and id_osoby=tbl_osoby.ident )=1 ";
                }
               
                
            }
            catch (Exception)
            {   }
            Session["kwerenda"] = kwerenda + " order by nazwisko";
            mediatorzy.DataBind();


        }

        protected void zminaArchiwum(object sender, EventArgs e)
        {

            ustawKwerendeOdczytu();
        }

        protected void ASPxCheckBox2_CheckedChanged(object sender, EventArgs e)
        {
            DropDownList1.Enabled = ASPxCheckBox2.Checked;
            ustawKwerendeOdczytu();
        }

        protected void _print(object sender, EventArgs e)
        {
            
            using (MemoryStream ms = new MemoryStream())
            {
                PrintableComponentLink pcl = new PrintableComponentLink(new PrintingSystem());
                //listaBieglych.Columns[0].Visible = false;
                
                ASPxGridViewExporter1.FileName = "Wykaz biegłych";
                pcl.Component = ASPxGridViewExporter1;

                pcl.Margins.Left = pcl.Margins.Right = 50;
                pcl.Landscape = true;
                pcl.CreateDocument(false);
                pcl.PrintingSystem.Document.AutoFitToPagesWidth = 1;
                pcl.ExportToPdf(ms);
                WriteResponse(this.Response, ms.ToArray(), System.Net.Mime.DispositionTypeNames.Inline.ToString());
            }
            //  ASPxGridViewExporter1..GridView = ASPxGridView2;
            /*PxGridViewExporter1.PrintSelectCheckBox = true;
            ASPxGridViewExporter1.Landscape = true;

            
            ASPxGridViewExporter1.Landscape = true;
            
            ASPxGridViewExporter1.WritePdfToResponse();
            */
            //listaBieglych.Columns["Column"].Visible = true;
        }
        public static void WriteResponse(HttpResponse response, byte[] filearray, string type)
        {
            response.ClearContent();
            response.Buffer = true;
            response.Cache.SetCacheability(HttpCacheability.Private);
            response.ContentType = "application/pdf";
            ContentDisposition contentDisposition = new ContentDisposition();
            contentDisposition.FileName = "test.pdf";
            contentDisposition.DispositionType = type;
            response.AddHeader("Content-Disposition", contentDisposition.ToString());
            response.BinaryWrite(filearray);
            HttpContext.Current.ApplicationInstance.CompleteRequest();
            try
            {
                response.End();
            }
            catch (System.Threading.ThreadAbortException)
            {
            }

        }

        protected void twórzZestawienie(object sender, EventArgs e)
        {
            internationalPDF();
            if (ASPxCheckBox2.Checked)
            {
                //jedna
                robRaportjednejSpecjalizacji(DropDownList1.SelectedItem.Value.Trim());

            }
            else
            {
                robRaportWszystkichSpecjalizacji();
            }
        }

        protected void robRaportjednejSpecjalizacji(String specjalizacja)
        {
            //podliczenie
            DataTable specjalizacjeWyliczenie = new DataTable();
            specjalizacjeWyliczenie.Columns.Add("nr", typeof(string));
            specjalizacjeWyliczenie.Columns.Add("str", typeof(string));
            DataTable specjalizacje = new DataTable();
            specjalizacje = cl.odczytaj_specjalizacjeLista();


            DataTable Biegli = new DataTable();
            string idSpecjalizacji = specjalizacja;
            string nazwaSpecjalizacji = DropDownList1.SelectedItem.Text.Trim();
            int iloscStron = 0;
            Biegli = cl.wyciagnijBieglychZSpecjalizacja(idSpecjalizacji, ASPxCheckBox2.Checked);
            if (Biegli.Rows.Count > 0)
            {
                iloscStron = 1;
                PdfPTable tabelaGlowna = new PdfPTable(4);
                int[] tblWidth = { 8, 30, 30, 32 };

                tabelaGlowna = new PdfPTable(4);
                tabelaGlowna = generujCzescRaportu(Biegli, nazwaSpecjalizacji);

                if (tabelaGlowna.Rows.Count > 15)
                {
                    int counter = 0;
                    PdfPTable newTable = new PdfPTable(4);
                    newTable.SetWidths(tblWidth);
                    // podziel tabele

                    foreach (var TableRow in tabelaGlowna.Rows)
                    {
                        counter++;
                        newTable.Rows.Add(TableRow);
                        if (counter == 15)
                        {
                            iloscStron++;
                            counter = 0;
                        }
                    }
                    DataRow wyliczenie = specjalizacjeWyliczenie.NewRow();
                    wyliczenie[0] = nazwaSpecjalizacji;
                    wyliczenie[1] = iloscStron.ToString();
                    specjalizacjeWyliczenie.Rows.Add(wyliczenie);

                }
                else
                {
                    DataRow wyliczenie = specjalizacjeWyliczenie.NewRow();
                    wyliczenie[0] = nazwaSpecjalizacji;
                    wyliczenie[1] = iloscStron.ToString();
                    specjalizacjeWyliczenie.Rows.Add(wyliczenie);
                }
                // uttwórz listę osób z taka specjalizacją 
            }



            //==============================================================


            // wyciąfnij listę ludzi z dana specjalizacją 
            //        BaseFont cl.plFont2NEW = BaseFont.CreateFont(Server.MapPath("/fonts/") + "ARIAL.TTF", BaseFont.CP1257, BaseFont.EMBEDDED);

            string sylfaenpath = Environment.GetEnvironmentVariable("SystemRoot") + "\\fonts\\sylfaen.ttf";
            BaseFont sylfaen = BaseFont.CreateFont(sylfaenpath, BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            Font head = new Font(sylfaen, 12f, Font.NORMAL, BaseColor.BLACK);
            Font normal = new Font(sylfaen, 10f, Font.NORMAL, BaseColor.BLACK);
            Font underline = new Font(sylfaen, 10f, Font.UNDERLINE, BaseColor.BLACK);




            //    var cl.plFontBIG = FontFactory.GetFont(BaseFont.HELVETICA, BaseFont.CP1257, 35, Font.NORMAL);



            iTextSharp.text.Document pdfDoc = new iTextSharp.text.Document(PageSize.A4, 10f, 10f, 10f, 0f);
            string path = Server.MapPath("//pdf");// Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments);
            string fileName = path + "//zestawienie_Specjalizacji_" + DateTime.Now.ToString().Replace(":", "-") + ".pdf";
            PdfWriter writer = PdfWriter.GetInstance(pdfDoc, new FileStream(fileName, FileMode.Create));
            pdfDoc.Open();


            pdfDoc.AddTitle("zestawienie_Specjalizacji");
            pdfDoc.AddCreationDate();


            pdfDoc.Open();

            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;" + "filename=zestawienie_Specjalizacji.pdf");


            PdfPTable fitst = new PdfPTable(1);
            fitst.DefaultCell.Border = Rectangle.NO_BORDER;
            PdfPCell cell = new PdfPCell(new Paragraph(" ", head));
            cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
            cell.Border = Rectangle.NO_BORDER;
            cell.FixedHeight = 100;
            fitst.AddCell(cell);

            cell = new PdfPCell(new Paragraph("LISTA", head));
            cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;

            cell.Border = Rectangle.NO_BORDER;
            fitst.AddCell(cell);
            string text = "BIEGŁYCH SĄDOWYCH ";

            cell = new PdfPCell(new Paragraph(text, head));
            cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
            cell.Border = Rectangle.NO_BORDER;
            cell.FixedHeight = 100;
            fitst.AddCell(cell);

            cell = new PdfPCell(new Paragraph("", head));
            cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
            cell.Border = Rectangle.NO_BORDER;
            cell.FixedHeight = 100;
            fitst.AddCell(cell);

            cell = new PdfPCell(new Paragraph("SĄDU OKRĘGOWEGO", head));
            cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
            cell.FixedHeight = 100;
            cell.Border = Rectangle.NO_BORDER;
            fitst.AddCell(cell);
            pdfDoc.Add(fitst);
            pdfDoc.NewPage();
            PdfPTable tab = new PdfPTable(3);
            int[] tblWidth2 = { 10, 80, 10 };
            tab.SetWidths(tblWidth2);
            cell = new PdfPCell(new Paragraph("", cl.plFontBIG));
            cell.FixedHeight = 100;
            cell.Border = Rectangle.NO_BORDER;
            tab.AddCell(cell);
            tab.AddCell(cell);
            tab.AddCell(cell);

            cell = new PdfPCell(new Paragraph("Lp.", cl.plFont2));

            tab.AddCell(cell);

            cell = new PdfPCell(new Paragraph("Zakres", cl.plFont2));

            tab.AddCell(cell);

            cell = new PdfPCell(new Paragraph("Numer strony", cl.plFont2));

            tab.AddCell(cell);

            int biezacaStrona = 0;
            int il = 0;
            foreach (DataRow dRow in specjalizacjeWyliczenie.Rows)
            {
                il++;
                tab.AddCell(new Paragraph(il.ToString(), cl.plFont2));
                tab.AddCell(new Paragraph(dRow[0].ToString(), cl.plFont2));
                biezacaStrona = biezacaStrona + int.Parse(dRow[1].ToString());
                tab.AddCell(new Paragraph(biezacaStrona.ToString(), cl.plFont2));
            }

            pdfDoc.Add(tab);

            pdfDoc.NewPage();

            Biegli = new DataTable();
            iloscStron = 0;
            Biegli = cl.wyciagnijBieglychZSpecjalizacja(idSpecjalizacji, ASPxCheckBox2.Checked);
            if (Biegli.Rows.Count > 0)
            {
                iloscStron = 1;
                pdfDoc.Add(new Paragraph(" "));
                pdfDoc.Add(new Paragraph(new Paragraph("        " + nazwaSpecjalizacji, cl.plFont1)));
                pdfDoc.Add(new Paragraph(" "));
                PdfPTable tabelaGlowna = new PdfPTable(4);
                int[] tblWidth = { 8, 30, 30, 32 };
                tabelaGlowna.SetWidths(tblWidth);
                tabelaGlowna.AddCell(new Paragraph("Lp.", cl.plFont2));
                tabelaGlowna.AddCell(new Paragraph("Nazwisko i imię", cl.plFont2));
                tabelaGlowna.AddCell(new Paragraph("Adres- telefon", cl.plFont2));
                tabelaGlowna.AddCell(new Paragraph("Zakres", cl.plFont2));


                pdfDoc.Add(tabelaGlowna);
                tabelaGlowna = new PdfPTable(4);

                tabelaGlowna = generujCzescRaportu(Biegli, nazwaSpecjalizacji);

                if (tabelaGlowna.Rows.Count > 15)
                {
                    int counter = 0;
                    PdfPTable newTable = new PdfPTable(4);
                    newTable.SetWidths(tblWidth);
                    // podziel tabele

                    foreach (var TableRow in tabelaGlowna.Rows)
                    {
                        counter++;
                        newTable.Rows.Add(TableRow);
                        if (counter == 15)
                        {
                            iloscStron++;
                            counter = 0;
                            pdfDoc.Add(newTable);
                            pdfDoc.NewPage();
                            pdfDoc.Add(new Paragraph(" "));
                            pdfDoc.Add(new Paragraph(new Paragraph("        " + nazwaSpecjalizacji + " ciąg dalszy", cl.plFont1)));
                            pdfDoc.Add(new Paragraph(" "));

                            tabelaGlowna = new PdfPTable(4);

                            tabelaGlowna.AddCell(new Paragraph("Lp.", cl.plFont2));
                            tabelaGlowna.AddCell(new Paragraph("Nazwisko i imię", cl.plFont2));
                            tabelaGlowna.AddCell(new Paragraph("Adres- telefon", cl.plFont2));

                            tabelaGlowna.AddCell(new Paragraph("Zakres", cl.plFont2));
                            tabelaGlowna.SetWidths(tblWidth);
                        }
                    }
                    DataRow wyliczenie = specjalizacjeWyliczenie.NewRow();
                    wyliczenie[0] = nazwaSpecjalizacji;
                    wyliczenie[1] = iloscStron.ToString();
                    specjalizacjeWyliczenie.Rows.Add(wyliczenie);
                    pdfDoc.Add(newTable);
                    pdfDoc.NewPage();
                }
                else
                {
                    DataRow wyliczenie = specjalizacjeWyliczenie.NewRow();
                    wyliczenie[0] = nazwaSpecjalizacji;
                    wyliczenie[1] = iloscStron.ToString();
                    specjalizacjeWyliczenie.Rows.Add(wyliczenie);

                    pdfDoc.Add(tabelaGlowna);
                    pdfDoc.NewPage();

                }
                // uttwórz listę osób z taka specjalizacją 
            }

            pdfDoc.Close();
            pdfDoc.Close();
            WebClient client = new WebClient();
            Byte[] buffer = client.DownloadData(fileName);
            if (buffer != null)
            {
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-lenght", buffer.Length.ToString());
                Response.BinaryWrite(buffer);
            }


        }



        protected void robRaportWszystkichSpecjalizacji()
        {
            //podliczenie
            DataTable specjalizacjeWyliczenie = new DataTable();
            specjalizacjeWyliczenie.Columns.Add("nr", typeof(string));
            specjalizacjeWyliczenie.Columns.Add("str", typeof(string));
            DataTable specjalizacje = new DataTable();
            specjalizacje = cl.odczytaj_specjalizacjeLista();

            foreach (DataRow dRow in specjalizacje.Rows)
            {

                DataTable Biegli = new DataTable();
                string idSpecjalizacji = dRow[0].ToString().Trim();
                string nazwaSpecjalizacji = dRow[1].ToString().Trim();
                int iloscStron = 0;

                Biegli = cl.wyciagnijBieglychZSpecjalizacja(idSpecjalizacji, ASPxCheckBox2.Checked);
                if (Biegli.Rows.Count > 0)
                {
                    iloscStron = 1;
                    PdfPTable tabelaGlowna = new PdfPTable(4);
                    int[] tblWidth = { 8, 30, 30, 32 };

                    tabelaGlowna = new PdfPTable(4);
                    tabelaGlowna = generujCzescRaportu(Biegli, nazwaSpecjalizacji);

                    if (tabelaGlowna.Rows.Count > 15)
                    {
                        int counter = 0;
                        PdfPTable newTable = new PdfPTable(4);
                        newTable.SetWidths(tblWidth);
                        // podziel tabele

                        foreach (var TableRow in tabelaGlowna.Rows)
                        {
                            counter++;
                            newTable.Rows.Add(TableRow);
                            if (counter == 15)
                            {
                                iloscStron++;
                                counter = 0;
                            }
                        }
                        DataRow wyliczenie = specjalizacjeWyliczenie.NewRow();
                        wyliczenie[0] = nazwaSpecjalizacji;
                        wyliczenie[1] = iloscStron.ToString();
                        specjalizacjeWyliczenie.Rows.Add(wyliczenie);

                    }
                    else
                    {
                        DataRow wyliczenie = specjalizacjeWyliczenie.NewRow();
                        wyliczenie[0] = nazwaSpecjalizacji;
                        wyliczenie[1] = iloscStron.ToString();
                        specjalizacjeWyliczenie.Rows.Add(wyliczenie);
                    }
                    // uttwórz listę osób z taka specjalizacją 
                }

            }// end of each




            //==============================================================



            // wyciąfnij listę ludzi z dana specjalizacją 

            iTextSharp.text.Document pdfDoc = new iTextSharp.text.Document(PageSize.A4, 10f, 10f, 10f, 0f);
            //  PdfWriter writer = PdfWriter.GetInstance(pdfDoc, new FileStream("C:\\temp\\" + filename, FileMode.Create));

            string path = Server.MapPath("//pdf"); //Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments );
            string fileName = path + "//zestawienie_Specjalizacji_" + DateTime.Now.ToString().Replace(":", "-") + ".pdf";
            PdfWriter writer = PdfWriter.GetInstance(pdfDoc, new FileStream(fileName, FileMode.Create));
            pdfDoc.Open();


            pdfDoc.AddTitle("zestawienie_Specjalizacji");
            pdfDoc.AddCreationDate();

            PdfPTable fitst = new PdfPTable(1);
            fitst.DefaultCell.Border = Rectangle.NO_BORDER;
            PdfPCell cell = new PdfPCell(new Paragraph(" ", cl.plFontBIG));
            cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
            cell.Border = Rectangle.NO_BORDER;
            cell.FixedHeight = 100;
            fitst.AddCell(cell);
            cell = new PdfPCell(new Paragraph("LISTA", cl.plFontBIG));


            cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;

            cell.Border = Rectangle.NO_BORDER;
            fitst.AddCell(cell);
            cell = new PdfPCell(new Paragraph("BIEGŁYCH SĄDOWYCH", cl.plFontBIG));

            cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
            cell.Border = Rectangle.NO_BORDER;
            cell.FixedHeight = 100;
            fitst.AddCell(cell);

            cell = new PdfPCell(new Paragraph("", cl.plFontBIG));
            cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
            cell.Border = Rectangle.NO_BORDER;
            cell.FixedHeight = 100;
            fitst.AddCell(cell);

            cell = new PdfPCell(new Paragraph("SĄDU OKRĘGOWEGO", cl.plFontBIG));
            cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
            cell.FixedHeight = 100;
            cell.Border = Rectangle.NO_BORDER;
            fitst.AddCell(cell);
            pdfDoc.Add(fitst);
            pdfDoc.NewPage();
            PdfPTable tab = new PdfPTable(3);
            int[] tblWidth2 = { 10, 80, 10 };
            tab.SetWidths(tblWidth2);
            cell = new PdfPCell(new Paragraph("", cl.plFontBIG));
            cell.FixedHeight = 100;
            cell.Border = Rectangle.NO_BORDER;
            tab.AddCell(cell);
            tab.AddCell(cell);
            tab.AddCell(cell);

            cell = new PdfPCell(new Paragraph("Lp.", cl.plFont2));

            tab.AddCell(cell);

            cell = new PdfPCell(new Paragraph("Zakres", cl.plFont2));

            tab.AddCell(cell);

            cell = new PdfPCell(new Paragraph("Numer strony", cl.plFont2));

            tab.AddCell(cell);

            int biezacaStrona = 0;
            int il = 0;
            foreach (DataRow dRow in specjalizacjeWyliczenie.Rows)
            {
                il++;
                tab.AddCell(new Paragraph(il.ToString(), cl.plFont2));
                tab.AddCell(new Paragraph(dRow[0].ToString(), cl.plFont2));
                biezacaStrona = biezacaStrona + int.Parse(dRow[1].ToString());
                tab.AddCell(new Paragraph(biezacaStrona.ToString(), cl.plFont2));
            }

            pdfDoc.Add(tab);

            pdfDoc.NewPage();

            foreach (DataRow dRow in specjalizacje.Rows)
            {

                DataTable Biegli = new DataTable();
                string idSpecjalizacji = dRow[0].ToString().Trim();
                string nazwaSpecjalizacji = dRow[1].ToString().Trim();
                int iloscStron = 0;
                Biegli = cl.wyciagnijBieglychZSpecjalizacja(idSpecjalizacji, ASPxCheckBox2.Checked);
                if (Biegli.Rows.Count > 0)
                {
                    iloscStron = 1;
                    pdfDoc.Add(new Paragraph(" "));
                    pdfDoc.Add(new Paragraph(new Paragraph("        " + nazwaSpecjalizacji, cl.plFont3)));
                    pdfDoc.Add(new Paragraph(" "));
                    PdfPTable tabelaGlowna = new PdfPTable(4);
                    int[] tblWidth = { 8, 30, 30, 32 };
                    tabelaGlowna.AddCell(new Paragraph("Lp.", cl.plFont2));
                    tabelaGlowna.AddCell(new Paragraph("Nazwisko i imię", cl.plFont2));
                    tabelaGlowna.AddCell(new Paragraph("Adres- telefon", cl.plFont2));

                    tabelaGlowna.AddCell(new Paragraph("Zakres", cl.plFont2));
                    tabelaGlowna.SetWidths(tblWidth);


                    pdfDoc.Add(tabelaGlowna);
                    tabelaGlowna = new PdfPTable(5);

                    tabelaGlowna = generujCzescRaportu(Biegli, nazwaSpecjalizacji);

                    if (tabelaGlowna.Rows.Count > 15)
                    {
                        int counter = 0;
                        PdfPTable newTable = new PdfPTable(4);
                        newTable.SetWidths(tblWidth);
                        // podziel tabele

                        foreach (var TableRow in tabelaGlowna.Rows)
                        {
                            counter++;
                            newTable.Rows.Add(TableRow);
                            if (counter == 15)
                            {
                                iloscStron++;
                                counter = 0;
                                pdfDoc.Add(newTable);
                                pdfDoc.NewPage();
                                pdfDoc.Add(new Paragraph(" "));
                                pdfDoc.Add(new Paragraph(new Paragraph("        " + nazwaSpecjalizacji + " ciąg dalszy", cl.plFont3)));
                                pdfDoc.Add(new Paragraph(" "));

                                tabelaGlowna = new PdfPTable(4);
                                tabelaGlowna.SetWidths(tblWidth);
                                tabelaGlowna.AddCell(new Paragraph("Lp.", cl.plFont2));
                                tabelaGlowna.AddCell(new Paragraph("Nazwisko i imię", cl.plFont2));
                                tabelaGlowna.AddCell(new Paragraph("Adres- telefon", cl.plFont2));


                                tabelaGlowna.AddCell(new Paragraph("Zakres", cl.plFont2));
                            }
                        }
                        DataRow wyliczenie = specjalizacjeWyliczenie.NewRow();
                        wyliczenie[0] = nazwaSpecjalizacji;
                        wyliczenie[1] = iloscStron.ToString();
                        specjalizacjeWyliczenie.Rows.Add(wyliczenie);
                        pdfDoc.Add(newTable);
                        pdfDoc.NewPage();
                    }
                    else
                    {
                        DataRow wyliczenie = specjalizacjeWyliczenie.NewRow();
                        wyliczenie[0] = nazwaSpecjalizacji;
                        wyliczenie[1] = iloscStron.ToString();
                        specjalizacjeWyliczenie.Rows.Add(wyliczenie);

                        pdfDoc.Add(tabelaGlowna);
                        pdfDoc.NewPage();

                    }
                    // uttwórz listę osób z taka specjalizacją 
                }

            }// end of each


            pdfDoc.Close();
            WebClient client = new WebClient();
            Byte[] buffer = client.DownloadData(fileName);
            if (buffer != null)
            {
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-lenght", buffer.Length.ToString());
                Response.BinaryWrite(buffer);
            }


        }
        protected PdfPTable generujCzescRaportu(DataTable biegli, string specjalizacje)
        {

            int[] tblWidth = { 8, 30, 30, 32 };


            PdfPTable tabelaGlowna = new PdfPTable(4);
            tabelaGlowna.SetWidths(tblWidth);
            int iterator = 0;
            foreach (DataRow biegly in biegli.Rows)
            {
                iterator++;
                string Idbieglego = biegly[0].ToString();
                DataTable listaSpecjalizacjiBieglego = new DataTable();
                listaSpecjalizacjiBieglego = cl.odczytaj_specjalizacje_osoby2(Idbieglego);
                //dbo.tbl_osoby.ident, dbo.tbl_osoby.imie, dbo.tbl_osoby.nazwisko, dbo.tbl_osoby.ulica, dbo.tbl_osoby.kod_poczt, dbo.tbl_osoby.miejscowosc,   dbo.tbl_osoby.data_koncowa,  dbo.tbl_osoby.tytul,
                string imie = biegly[1].ToString();
                string nazwisko = biegly[2].ToString();
                string tytul = biegly[7].ToString();
                string dataKonca = string.Empty;
                try
                {
                    dataKonca = DateTime.Parse(biegly[6].ToString()).ToShortDateString();
                }
                catch (Exception ex)
                {


                }

                string innerTable = imie + Environment.NewLine + nazwisko + Environment.NewLine + tytul + Environment.NewLine + "kadencja do dnia: " + dataKonca;
                tabelaGlowna.AddCell(new Paragraph(iterator.ToString(), cl.plFont1));
                tabelaGlowna.AddCell(new Paragraph(innerTable, cl.plFont1));
                string ulica = biegly[3].ToString();
                string kod = biegly[4].ToString();
                string miejscowosc = biegly[5].ToString();
                string tel = biegly[8].ToString();
                string adresTable = ulica + Environment.NewLine + kod + " " + miejscowosc + Environment.NewLine + tel;
                tabelaGlowna.AddCell(new Paragraph(adresTable, cl.plFont1));
                string specki = string.Empty;
                string specjalizacjaOpis = cl.odczytaj_specjalizacje_osobyOpis(Idbieglego);
                // tabelaGlowna.AddCell(new Paragraph(specjalizacjaOpis, cl.plFont2));
                foreach (DataRow specRow in listaSpecjalizacjiBieglego.Rows)
                {
                    specki = specki + specRow[0].ToString().ToLower() + "; ";
                }
                specki = specki + specjalizacjaOpis;
                tabelaGlowna.AddCell(new Paragraph(specki, cl.plFont1));
            }


            return tabelaGlowna;

        }
        static private void internationalPDF()
        {
            try
            {
                iTextSharp.text.Document document = new iTextSharp.text.Document(PageSize.A4, 72, 65, 72, 65);

                string filename = "international" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + ".pdf";
                PdfWriter writer = PdfWriter.GetInstance(document, new FileStream("C:\\temp\\" + filename, FileMode.Create));
                document.AddAuthor("RussianPDFtest");
                document.AddTitle("Załączone zdjęcie");
                document.AddCreationDate();

                string sylfaenpath = Environment.GetEnvironmentVariable("SystemRoot") + "\\fonts\\sylfaen.ttf";
                BaseFont sylfaen = BaseFont.CreateFont(sylfaenpath, BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
                Font head = new Font(sylfaen, 12f, Font.NORMAL, BaseColor.BLUE);
                Font normal = new Font(sylfaen, 10f, Font.NORMAL, BaseColor.BLACK);
                Font underline = new Font(sylfaen, 10f, Font.UNDERLINE, BaseColor.BLACK);

                document.Open();
                document.Add(new Paragraph("CZ-Reservation / Załączone zdjęcie          BU-16122011-37", head));
                document.Add(new Paragraph(" ", normal));
                document.Add(new Paragraph(" ", normal));
                document.Add(new Paragraph("Informacje te są przesyłane bezpośrednio do właściciela:", underline));
                document.Add(new Paragraph(" ", normal));
                PdfPTable table1 = new PdfPTable(2);
                table1.TotalWidth = document.PageSize.Width - 72f - 65f;
                table1.LockedWidth = true;
                float[] widths1 = new float[] { 1f, 4f };
                table1.SetWidths(widths1);
                table1.HorizontalAlignment = 0;
                PdfPCell table1cell11 = new PdfPCell(new Phrase("Usunięcie się powiodło:", normal));
                table1cell11.Border = 0;
                table1.AddCell(table1cell11);
                PdfPCell table1cell12 = new PdfPCell(new Phrase("Ferienhaus 'Waldesruh'", normal));
                table1cell12.Border = 0;
                table1.AddCell(table1cell12);
                PdfPCell table1cell21 = new PdfPCell(new Phrase("Menu główne:", normal));
                table1cell21.Border = 0;
                table1.AddCell(table1cell21);
                PdfPCell table1cell22 = new PdfPCell(new Phrase("15344 Strausberg, Am Marienberg 45", normal));
                table1cell22.Border = 0;
                table1.AddCell(table1cell22);
                PdfPCell table1cell31 = new PdfPCell(new Phrase("D'évènement:", normal));
                table1cell31.Border = 0;
                table1.AddCell(table1cell31);
                PdfPCell table1cell32 = new PdfPCell(new Phrase("czr04012012", normal));
                table1cell32.Border = 0;
                table1.AddCell(table1cell32);
                PdfPCell table1cell41 = new PdfPCell(new Phrase("Centres bien-être:", normal));
                table1cell41.Border = 0;
                table1.AddCell(table1cell41);
                PdfPCell table1cell42 = new PdfPCell(new Phrase("12.02.2012", normal));
                table1cell42.Border = 0;
                table1.AddCell(table1cell42);
                PdfPCell table1cell51 = new PdfPCell(new Phrase("Accès handicapés:", normal));
                table1cell51.Border = 0;
                table1.AddCell(table1cell51);
                PdfPCell table1cell52 = new PdfPCell(new Phrase("18.02.2012", normal));
                table1cell52.Border = 0;
                table1.AddCell(table1cell52);
                PdfPCell table1cell61 = new PdfPCell(new Phrase("Août:", normal));
                table1cell61.Border = 0;
                table1.AddCell(table1cell61);
                PdfPCell table1cell62 = new PdfPCell(new Phrase("5", normal));
                table1cell62.Border = 0;
                table1.AddCell(table1cell62);
                document.Add(table1);
                document.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Try-Catch-Fehler!");
                Console.WriteLine(ex.Message);
                Console.ReadLine();
            }
        }

        protected void makeExcell(object sender, EventArgs e)
        {
            ASPxGridViewExporter1.FileName = "Wykaz Biegłych";
            ASPxGridViewExporter1.WriteXlsToResponse();
        }
    }

}