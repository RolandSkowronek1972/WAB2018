using System;
using System.Collections.Generic;

using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using NPOI.HPSF;
using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using System.Diagnostics;
using System.ComponentModel;
using System.Globalization;
using System.Drawing;
using System.IO;

namespace wab2018
{
    public partial class Lista_01 : System.Web.UI.Page
    {
        public Class2 cl = new Class2();
        private HSSFWorkbook hssfworkbook;

        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {

                try
                {

                    GridView2.DataBind();
                    if ((GridView2.Rows.Count >= 0) && (GridView2.SelectedIndex == -1))
                    {
                        GridView2.SelectedIndex = 0;
                        Session["id_osoby"] = GridView2.SelectedDataKey[0].ToString();

                    }
                }
                catch
                { }
                if (Session["user_id"] == null)
                {
                    Server.Transfer("logowanie.aspx");
                }
                else
                {
                    Session["level"] = cl.acces_level(int.Parse((string)Session["user_id"]));
                }
                ustaw_baze();
            }
            //   Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "alert('oj') ;", true);

        }// end of Page_Load



        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

            string rola = (string)Session["rola"];

            try
            {
                HiddenField myHiden = GridView2.Rows[GridView2.SelectedIndex].FindControl("HiddenField1") as HiddenField;
                Session["id_osoby"] = myHiden.Value.ToString().Trim();
                CheckBox1.Checked = false;
                Session["sesja"] = null;



            }
            catch (Exception)
            { }






        }// end of GridView2_SelectedIndexChanged


        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            ustaw_baze();
        }// end of CheckBox1_CheckedChanged

        protected void ustaw_baze()
        {
            SqlDataSource2.SelectCommand = "SELECT [imie], [nazwisko], [ulica], [kod_poczt], [miejscowosc], [data_poczatkowa], [data_koncowa], [ident],tytul,pesel,czy_zaw,tel1,tel2,email FROM [View_lista_osob_aktywnych] order by nazwisko";
            if (CheckBox1.Checked)
            {

                if (DropDownList1.SelectedIndex == -1) DropDownList1.SelectedIndex = 0;

                DropDownList1.Enabled = true;
                try
                {
                    if (DropDownList1.SelectedIndex == -1)
                    {
                        if (DropDownList1.Items.Count == 0)
                        {
                            DropDownList1.DataBind();
                            DropDownList1.SelectedIndex = 0;
                        }

                    }
                    Session["id_spec"] = DropDownList1.SelectedValue.ToString();
                    //SELECT DISTINCT View_lista_osob_z_kategoriami.imie, View_lista_osob_z_kategoriami.nazwisko, View_lista_osob_z_kategoriami.ulica, View_lista_osob_z_kategoriami.kod_poczt, View_lista_osob_z_kategoriami.miejscowosc, View_lista_osob_z_kategoriami.data_poczatkowa, View_lista_osob_z_kategoriami.data_koncowa, View_lista_osob_z_kategoriami.ident, View_lista_osob_z_kategoriami.tytul, tbl_osoby.pesel, View_lista_osob_z_kategoriami.zawieszony, COALESCE (View_lista_osob_z_kategoriami.adr_kores, '') AS adr_koresp2, COALESCE (View_lista_osob_z_kategoriami.kod_poczt_kor, '') AS kod_poczt_kor2, COALESCE (View_lista_osob_z_kategoriami.miejscowosc_kor, '') AS miejscowosc_kor2, View_lista_osob_z_kategoriami.adr_kores, View_lista_osob_z_kategoriami.kod_poczt_kor, View_lista_osob_z_kategoriami.miejscowosc_kor FROM View_lista_osob_z_kategoriami LEFT OUTER JOIN tbl_osoby ON View_lista_osob_z_kategoriami.ident = tbl_osoby.ident ORDER BY View_lista_osob_z_kategoriami.nazwisko View_lista_osob_z_kategoriami.id_specjalizacji=" + DropDownList1.SelectedValue.ToString().Trim() + "  ORDER BY View_lista_osob_z_kategoriami.nazwisko";
                    //  SqlDataSource2.SelectCommand = "SELECT DISTINCT View_lista_osob_z_kategoriami.imie as imie, View_lista_osob_z_kategoriami.nazwisko as nazwisko, View_lista_osob_z_kategoriami.ulica as ulica, View_lista_osob_z_kategoriami.kod_poczt as kod_poczt, view_lista_osob_z_kategoriami.miejscowosc as miejscowosc, View_lista_osob_z_kategoriami.data_poczatkowa as data_poczatkowa, View_lista_osob_z_kategoriami.data_koncowa as data_koncowa, View_lista_osob_z_kategoriami.ident as ident, View_lista_osob_z_kategoriami.tytul as tytul, tbl_osoby.pesel as pesel, view_lista_osob_z_kategoriami.zawieszony FROM View_lista_osob_z_kategoriami LEFT OUTER JOIN tbl_osoby ON View_lista_osob_z_kategoriami.ident = tbl_osoby.ident where View_lista_osob_z_kategoriami.id_specjalizacji=" + DropDownList1.SelectedValue.ToString().Trim() + "  ORDER BY View_lista_osob_z_kategoriami.nazwisko";
                    SqlDataSource2.SelectCommand = "SELECT DISTINCT View_lista_osob_z_kategoriami.imie, View_lista_osob_z_kategoriami.nazwisko, View_lista_osob_z_kategoriami.ulica, View_lista_osob_z_kategoriami.kod_poczt, View_lista_osob_z_kategoriami.miejscowosc, View_lista_osob_z_kategoriami.data_poczatkowa, View_lista_osob_z_kategoriami.data_koncowa, View_lista_osob_z_kategoriami.ident, View_lista_osob_z_kategoriami.tytul, tbl_osoby.pesel, View_lista_osob_z_kategoriami.zawieszony, COALESCE (View_lista_osob_z_kategoriami.adr_kores, '') AS adr_koresp2, COALESCE (View_lista_osob_z_kategoriami.kod_poczt_kor, '') AS kod_poczt_kor2, COALESCE (View_lista_osob_z_kategoriami.miejscowosc_kor, '') AS miejscowosc_kor2, View_lista_osob_z_kategoriami.adr_kores, View_lista_osob_z_kategoriami.kod_poczt_kor, View_lista_osob_z_kategoriami.miejscowosc_kor FROM View_lista_osob_z_kategoriami LEFT OUTER JOIN tbl_osoby ON View_lista_osob_z_kategoriami.ident = tbl_osoby.ident where View_lista_osob_z_kategoriami.id_specjalizacji=" + DropDownList1.SelectedValue.ToString().Trim() + "  ORDER BY View_lista_osob_z_kategoriami.nazwisko";
                }
                catch
                { }
            }
            else
            {
                SqlDataSource2.SelectCommand = "SELECT DISTINCT View_lista_osob_z_kategoriami.imie, View_lista_osob_z_kategoriami.nazwisko, View_lista_osob_z_kategoriami.ulica, View_lista_osob_z_kategoriami.kod_poczt, View_lista_osob_z_kategoriami.miejscowosc, View_lista_osob_z_kategoriami.data_poczatkowa, View_lista_osob_z_kategoriami.data_koncowa, View_lista_osob_z_kategoriami.ident, View_lista_osob_z_kategoriami.tytul, tbl_osoby.pesel, View_lista_osob_z_kategoriami.zawieszony, COALESCE (View_lista_osob_z_kategoriami.adr_kores, '') AS adr_koresp2, COALESCE (View_lista_osob_z_kategoriami.kod_poczt_kor, '') AS kod_poczt_kor2, COALESCE (View_lista_osob_z_kategoriami.miejscowosc_kor, '') AS miejscowosc_kor2, View_lista_osob_z_kategoriami.adr_kores, View_lista_osob_z_kategoriami.kod_poczt_kor, View_lista_osob_z_kategoriami.miejscowosc_kor FROM View_lista_osob_z_kategoriami LEFT OUTER JOIN tbl_osoby ON View_lista_osob_z_kategoriami.ident = tbl_osoby.ident  ORDER BY View_lista_osob_z_kategoriami.nazwisko";
                DropDownList1.Enabled = false;
                DropDownList1.SelectedIndex = -1;
            }
            try
            {
                GridView2.DataBind();
            }
            catch (Exception ex)
            {

            }

        } // end of ustaw_baze

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            ustaw_baze();

        }// end of DropDownList1_SelectedIndexChanged



        protected void GridView2_Sorted(object sender, EventArgs e)
        {
            ustaw_baze();

        }


        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                SqlDataSource s = (SqlDataSource)e.Row.FindControl("Inner_table");
                try
                {
                    int i = e.Row.RowIndex;
                    s.SelectParameters[0].DefaultValue = GridView2.DataKeys[i].Value.ToString().Trim();

                }
                catch
                { }

            }
        }// end of GridView2_RowDataBound

        protected void GridView2_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                GridView HeaderGrid = (GridView)sender;
                GridViewRow HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                HeaderGridRow.Font.Size = 10;
                HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                HeaderGridRow.VerticalAlign = VerticalAlign.Top;
                HeaderGridRow.BorderWidth = 1;
                //#4B6C9E
                Color colorx = System.Drawing.ColorTranslator.FromHtml("#4B6C9E");
                HeaderGrid.BackColor = colorx;
                //'HeaderGrid.ForeColor = System.Drawing.Color.White;
                HeaderGridRow.Width = 1050;
                TableCell HeaderCell = new TableCell();

                HeaderCell = new TableCell();
                HeaderCell.Text = "";
                HeaderGridRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);


                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "";

                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);


                HeaderCell = new TableCell();
                HeaderCell.Text = "zameldowania";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.HorizontalAlign = System.Web.UI.WebControls.HorizontalAlign.Center;
                HeaderCell.ForeColor = Color.White;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "korespondencyjny";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.ForeColor = Color.White;
                HeaderCell.HorizontalAlign = System.Web.UI.WebControls.HorizontalAlign.Center;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);



                HeaderCell = new TableCell();
                HeaderCell.Text = "";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "od";
                HeaderCell.ForeColor = Color.White;
                HeaderCell.ColumnSpan = 1;
                HeaderCell.HorizontalAlign = System.Web.UI.WebControls.HorizontalAlign.Center;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);

                HeaderCell = new TableCell();
                HeaderCell.Text = "do";
                HeaderCell.ForeColor = Color.White;
                HeaderCell.ColumnSpan = 1;
                HeaderCell.HorizontalAlign = System.Web.UI.WebControls.HorizontalAlign.Center;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);


                HeaderCell = new TableCell();
                HeaderCell.Text = "";
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow);

                // next row




                GridViewRow HeaderGridRow2 = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                HeaderGridRow.Font.Size = 10;
                HeaderGridRow.HorizontalAlign = HorizontalAlign.Center;
                HeaderGridRow.VerticalAlign = VerticalAlign.Top;
                HeaderGridRow.BorderWidth = 0;

                HeaderCell = new TableCell();

                HeaderCell = new TableCell();
                HeaderCell.Text = "";
                HeaderGridRow2.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Tytuł";
                HeaderCell.ForeColor = Color.White;
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow2.Cells.Add(HeaderCell);


                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow2);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Imię";
                HeaderCell.ForeColor = Color.White;
                HeaderCell.ColumnSpan = 1;
                HeaderCell.HorizontalAlign = System.Web.UI.WebControls.HorizontalAlign.Center;
                HeaderGridRow2.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow2);

                HeaderCell = new TableCell();
                HeaderCell.HorizontalAlign = System.Web.UI.WebControls.HorizontalAlign.Center;
                HeaderCell.Text = "Nazwisko";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.ForeColor = Color.White;
                HeaderGridRow2.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow2);

                HeaderCell = new TableCell();
                //HeaderCell.BackColor = System.Drawing.Color.Red;
                HeaderCell.HorizontalAlign = System.Web.UI.WebControls.HorizontalAlign.Center;
                HeaderCell.Text = "Adres";
                HeaderCell.ForeColor = Color.White;
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow2.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow2);

                HeaderCell = new TableCell();
                //HeaderCell.BackColor = System.Drawing.Color.Red;
                HeaderCell.HorizontalAlign = System.Web.UI.WebControls.HorizontalAlign.Center;
                HeaderCell.Text = "Adres";
                HeaderCell.ColumnSpan = 1;
                HeaderCell.ForeColor = Color.White;
                HeaderGridRow2.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow2);

                HeaderCell = new TableCell();
                HeaderCell.Text = "";
                HeaderCell.HorizontalAlign = System.Web.UI.WebControls.HorizontalAlign.Center;
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow2.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow2);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Data powołania";
                HeaderCell.ForeColor = Color.White;
                HeaderCell.HorizontalAlign = System.Web.UI.WebControls.HorizontalAlign.Center;
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow2.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow2);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Specjalizacje";
                HeaderCell.ForeColor = Color.White;
                HeaderCell.HorizontalAlign = System.Web.UI.WebControls.HorizontalAlign.Center;
                HeaderCell.ColumnSpan = 1;
                HeaderGridRow2.Cells.Add(HeaderCell);
                GridView2.Controls[0].Controls.AddAt(0, HeaderGridRow2);
            }

        }//End of GridView2_RowCreated

        protected void GridView2_Sorted1(object sender, EventArgs e)
        {
            // sortowanie
            ustaw_baze();
        }

        protected void print_(object sender, EventArgs e)
        {
            Server.Transfer("druk1.aspx");
            // ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "print2", "JavaScript: window.print();", true);

        }

        private void InitializeWorkbook()
        {
            hssfworkbook = new HSSFWorkbook();

            SummaryInformation si = PropertySetFactory.CreateSummaryInformation();
            si.Subject = "";
            si.Title = "Lista Biegłych";
            hssfworkbook.SummaryInformation = si;
        }



        private MemoryStream WriteToStream()
        {
            //Write the stream data of workbook to the root directory
            MemoryStream file = new MemoryStream();

            hssfworkbook.Write(file);
            return file;
        }

        private void generate_my_data()
        {
            ISheet sheet0 = hssfworkbook.CreateSheet("Ruch spraw");


            DataView view = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);

            DataTable table = view.ToTable();




            IRow row0 = sheet0.CreateRow(0);
            table.TableName = "Załatwienia";
            table.Columns.Remove("ident");

            row0.CreateCell(0).SetCellValue("Tytuł");
            var crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 0, 0);
            sheet0.AddMergedRegion(crs);
            row0.CreateCell(1).SetCellValue("Nazwisko");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 1, 1);
            sheet0.AddMergedRegion(crs);

            row0.CreateCell(2).SetCellValue("Imię");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 2, 2);
            sheet0.AddMergedRegion(crs);

            row0.CreateCell(3).SetCellValue("Adres zameldowania");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 0, 3, 5);
            sheet0.AddMergedRegion(crs);

            row0.CreateCell(6).SetCellValue("Powołanie");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 0, 6, 7);
            sheet0.AddMergedRegion(crs);

            row0.CreateCell(8).SetCellValue("PESEL");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 1, 8, 8);
            sheet0.AddMergedRegion(crs);

            row0.CreateCell(9).SetCellValue("Adres korespondencyjny");
            crs = new NPOI.SS.Util.CellRangeAddress(0, 0, 9, 11);
            sheet0.AddMergedRegion(crs);

            row0 = sheet0.CreateRow(1);



            row0.CreateCell(3).SetCellValue("ulica");
            row0.CreateCell(4).SetCellValue("kod pocztowy");
            row0.CreateCell(5).SetCellValue("miejscowość");

            row0.CreateCell(6).SetCellValue("początek ");
            row0.CreateCell(7).SetCellValue("koniec");

            row0.CreateCell(9).SetCellValue("ulica");
            row0.CreateCell(10).SetCellValue("kod pocztowy");
            row0.CreateCell(11).SetCellValue("miejscowość");
            int rol = 2;
            foreach (DataRow rowik in table.Rows)
            {
                row0 = sheet0.CreateRow(rol);


                for (int i = 0; i < 9; i++)
                {

                    row0.CreateCell(0).SetCellValue(rowik[7].ToString().Trim());// tytul
                    row0.CreateCell(1).SetCellValue(rowik[1].ToString().Trim());// nazwisko
                    row0.CreateCell(2).SetCellValue(rowik[0].ToString().Trim());// nazwisko

                    row0.CreateCell(3).SetCellValue(rowik[2].ToString().Trim());
                    row0.CreateCell(4).SetCellValue(rowik[3].ToString().Trim());
                    row0.CreateCell(5).SetCellValue(rowik[4].ToString().Trim());
                    try
                    {
                        DateTime dat1 = DateTime.Parse(rowik[5].ToString().Trim());
                        row0.CreateCell(6).SetCellValue(dat1.ToShortDateString());
                        dat1 = DateTime.Parse(rowik[6].ToString().Trim());
                        row0.CreateCell(7).SetCellValue(dat1.ToShortDateString());
                    }
                    catch
                    {


                    }

                    row0.CreateCell(8).SetCellValue(rowik[10].ToString().Trim());

                    row0.CreateCell(9).SetCellValue(rowik[10].ToString().Trim());
                    row0.CreateCell(10).SetCellValue(rowik[11].ToString().Trim());
                    row0.CreateCell(11).SetCellValue(rowik[12].ToString().Trim());
                }
                rol++;

            }// end foreach



        }

        protected void makeExcell(object sender, EventArgs e)
        {
            string filename = "ListaBiegłych.xls";
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0}", filename));

            Response.Clear();

            InitializeWorkbook();
            generate_my_data();
            Response.BinaryWrite(WriteToStream().GetBuffer());

            Response.End();
        }


    }
}