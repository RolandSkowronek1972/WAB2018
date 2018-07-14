using System;

namespace wab2018.userControls
{
    public partial class zawieszenia : System.Web.UI.UserControl
    {


       

        public  DateTime poczatekZawieszenia
        {
            get
            {
                return txPoczatek.Date;
            }
        }
        public  DateTime koniecZawieszenia
        {
            get
            {
                return txKoniec.Date;
            }
        }
        public bool zaw
        {
            get
            {
                return ASPxCheckBox1.Checked;

            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string txt = (string)Session["id_osoby"];
            string zawieszenie= (string)Session["czy_zaw"];
            DateTime poczatek = (DateTime)Session["poczatekZawieszenia"];
            DateTime koniec = (DateTime)Session["koniecZawieszenia"];
            bool edycja = false;
            try
            {
                edycja = (bool)Session["edycjaSkargi"];
            }
            catch (Exception)
            {}

            if (!edycja)
            {
                if (zawieszenie == "1")
                {
                    ASPxCheckBox1.Checked = true;
                    Panel1.Visible = true;
                    txPoczatek.Date = (poczatek);
                    txKoniec.Date = (koniec);

                }
                else
                {
                    Panel1.Visible = false;
                    ASPxCheckBox1.Checked = false;

                }
            }
            
            Session["edycjaSkargi"] = true;
            Session["czy_zaw"] = "0";
        }

        protected void zmieńStanZawieszenia(object sender, EventArgs e)
        {
          //  Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "AlertMsg", "<script language='javascript'>alert('The Web Policy need to be accepted to submit the new assessor information.');</script>");
            if (ASPxCheckBox1.Checked)
            {
                Panel1.Visible = true;
                txPoczatek.Date = DateTime.Now.Date;
                txKoniec.Date = DateTime.Now.Date;
            }
            else
            {
                Panel1.Visible = false;
                Session["czy_zaw"] = "0";
            }
        }
    }
}