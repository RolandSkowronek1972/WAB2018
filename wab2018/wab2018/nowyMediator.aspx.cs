using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace wab2018
{
    public partial class nowyMediator : System.Web.UI.Page
    {
        public Class2 cl = new Class2();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user_id"] == null)
                {
                   // Server.Transfer("default.aspx");
                }
                try
                {
                    string sesja = (string)Session["sesja"];
                    if (sesja == null)
                    {
                        string dt = DateTime.Now.DayOfYear.ToString() + DateTime.Now.TimeOfDay.Ticks.ToString();
                        Session["sesja"] = dt;
                        if (string.IsNullOrEmpty(TextBox6.Text.Trim()))
                        {


                            TextBox6.Text = DateTime.Now.ToString("dd.MM.yyyy");
                            TextBox7.Text = "31.12." + DateTime.Now.AddYears(4).Year.ToString();
                        }
                        TextBox1.Focus();
                    }
                }
                catch
                {
                }



            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string imie = TextBox1.Text.Trim();
            string nazwisko = TextBox2.Text.Trim();
            string adres = TextBox3.Text.Trim();
            string kod_poczt = TextBox4.Text.Trim();
            string miejscowosc = TextBox5.Text.Trim();
            string data_1_t = string.Empty;
            string data_2_t = string.Empty;
            try
            {
                data_1_t = TextBox6.Text.Substring(6, 4) + "-" + TextBox6.Text.Substring(3, 2) + "-" + TextBox6.Text.Substring(0, 2);
            }
            catch (Exception)
            {
                data_1_t = TextBox6.Text;

            }
            try
            {
                data_2_t = TextBox7.Text.Substring(6, 4) + "-" + TextBox7.Text.Substring(3, 2) + "-" + TextBox7.Text.Substring(0, 2);

            }
            catch (Exception)
            {
                data_2_t = TextBox7.Text;


            }


            DateTime data_pocz = DateTime.Now;
            try
            {
                data_pocz = DateTime.Parse(data_1_t);
            }
            catch
            {
                data_pocz = DateTime.Parse(TextBox6.Text);
            }

            DateTime data_konc = DateTime.Now;
            try
            {
                data_konc = DateTime.Parse(data_2_t);
            }
            catch
            {
                data_konc = DateTime.Parse(TextBox7.Text);
            }

            string id_kreatora = (string)Session["user_id"];
            int err = 0;
            // sprawdzenie poprawnosci dat
            if (data_konc <= data_pocz)
            {
                err = 1;
            }
            // sprawdzenie ilosci specjalizacji
          
            switch (err)
            {
                case 0:
                    {
                        string id_osoby = cl.dodaj_osobe(imie, nazwisko, adres, kod_poczt, miejscowosc, data_pocz, data_konc, int.Parse(id_kreatora), TextBox8.Text.Trim(), TextBox9.Text.Trim(),2);
                        cl.modyfikuj_osobe(id_osoby, int.Parse(id_kreatora), imie, nazwisko, adres, kod_poczt, miejscowosc, data_pocz, data_konc, TextBox8.Text, TextBox9.Text, email.Text, "", 0, adrKor.Text, kodKor.Text, cityKor.Text, tel1.Text, tel2.Text, DateTime .Parse ("1900-01-01"),  DateTime.Parse("1900-01-01"), "",2);
                       
                        Server.Transfer("wykazMediatorow.aspx");
                    }
                    break;
                case 1:
                    {
                        //alert1.Visible = true;
                        //alert1.alert_txt("Data końca powołania jest mniejsza niż data początku okresu powołania!", 0);
                    }
                    break;
                case 2:
                    {
                        ///alert1.Visible = true;
                        ///alert1.alert_txt("Proszę wybrać co najmniej jedną specjalizację!", 0);
                    }
                    break;
                default:
                    break;
            }

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            cl.usun_specjalizacje_tymczasowe((string)Session["sesja"]);
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = DateTime.Now.Date.ToShortDateString();
            TextBox7.Text = DateTime.Now.AddYears(4).Date.ToShortDateString();

        }

        protected void TextBox6_TextChanged(object sender, EventArgs e)
        {
            try
            {
                int year = DateTime.Parse(TextBox6.Text).Year + 4;
                TextBox7.Text = "31-12-" + year.ToString();
            }
            catch
            {


            }
        }
    }
}