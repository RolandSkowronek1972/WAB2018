using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.Entity;
using System.Web.UI.WebControls;

namespace wab2018
{
    public partial class wykazSkarg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            tbl_skargi _tbl_Skargi = new tbl_skargi();
            tbl_osoby _osoby = new tbl_osoby();
            /*
            skargiDbContext _skargiDbContext = new skargiDbContext();
            ASPxGridView1.DataSource = null;
            ASPxGridView1.DataSourceID = null;

            using (skargiDbContext db = new skargiDbContext())
            {
                var lista = (from stk in db.tbl_skargi join
                             p in db.tbl_osoby on  stk.idBieglego  equals  p.ident 
                             where p.ident != 0
                             select new
                             {
                                 Numer = stk.numer,
                                 Rok = stk.rok,
                                 Data_wpływu = stk.dataWplywu,
                                 Data_pisma = stk.dataPisma,
                                 sygnatura = stk.Sygnatura,
                                 biegly = p.imie + " " + p.nazwisko,
                                 wizytator = stk.wizytator,
                                 zakreslono = stk.zakreslono,
                                 uwagi = stk.uwagi
                             });

            }

          
            


            ASPxGridView1.DataSource = _skargiDbContext.tbl_skargi.ToList();
            ASPxGridView1.DataBind();*/
                }

        protected void Button1_Click(object sender, EventArgs e)
        {

         
        }
    }
}