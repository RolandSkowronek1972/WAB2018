using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace wab2018.userControls
{
    public partial class zawieszki : System.Web.UI.UserControl
    {
        public DateTime poczatek
        {
            get
            {
                return ASPxDateEdit1.Date;

            }

        }

        public DateTime koniec
        {
            get
            {
                return ASPxDateEdit2.Date;

            }

        }


        protected void Page_Load(object sender, EventArgs e)
        {
            string biegly = (string)Session["idMediatora"];
            string zawiesznie = (string)Session["czy_zaw"];
            if ((string.IsNullOrEmpty( zawiesznie)==true)|| (zawiesznie=="False"))
            {
                zawiesznie = "0";
            }
            if (zawiesznie == "0")
            {
                ASPxDateEdit1.Date = DateTime.Now;
                ASPxDateEdit1.Text = ASPxDateEdit1.Date.ToShortDateString();
                ASPxDateEdit2.Date = DateTime.Now;
                ASPxDateEdit2.Text = ASPxDateEdit2.Date.ToShortDateString();
                Session["czy_zaw"] = "5";
                Session["czy_zawN"] = "0";
                ASPxDateEdit1.Visible = false;
                ASPxDateEdit2.Visible = false;
                ASPxLabel1.Visible = false;
                ASPxLabel2.Visible = false;
            }
            if (zawiesznie == "1")
            {
                ASPxCheckBox1.Checked = true;
                try
                {
                    
                    ASPxDateEdit1.Date = (DateTime)Session["poczatekZawieszenia"];
                    ASPxDateEdit1.Text = ASPxDateEdit1.Date.ToShortDateString();
                }
                catch (Exception)
                {}
                try
                {
                    ASPxDateEdit2.Date = (DateTime)Session["koniecZawieszenia"];
                    ASPxDateEdit2.Text = ASPxDateEdit2.Date.ToShortDateString();
                }
                catch (Exception)
                {

                  
                }
             
                
                Session["czy_zaw"] = "5";
                Session["czy_zawN"] = "0";
            }

        }

        protected void ASPxCheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (ASPxCheckBox1.Checked)
            {
                Session["czy_zawN"] = "1";
                ASPxDateEdit1.Visible = true;
                ASPxDateEdit2.Visible = true;
                ASPxLabel1.Visible = true;
                ASPxLabel2.Visible = true;
            }
            else
            {
                Session["czy_zawN"] = "0";
                ASPxDateEdit1.Date = DateTime.Now;
                ASPxDateEdit1.Text = ASPxDateEdit1.Date.ToShortDateString();
                ASPxDateEdit2.Date = DateTime.Now;
                ASPxDateEdit2.Text = ASPxDateEdit1.Date.ToShortDateString();
                ASPxDateEdit1.Visible = false;
                ASPxDateEdit2.Visible = false;
                ASPxLabel1.Visible = false;
                ASPxLabel2.Visible = false;
                Session["poczatekZawieszeniaN"] = ASPxDateEdit1.Date;
                Session["koniecZawieszeniaN"] = ASPxDateEdit2.Date;
            }
        }

        protected void ASPxDateEdit1_DateChanged(object sender, EventArgs e)
        {
            Session["poczatekZawieszeniaN"] = ASPxDateEdit1.Date;
        }

        protected void ASPxDateEdit2_DateChanged(object sender, EventArgs e)
        {
            Session["koniecZawieszeniaN"] = ASPxDateEdit2.Date;
        }
    }
}