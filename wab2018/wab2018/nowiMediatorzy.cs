using System;
using DevExpress.Web.Data;
using DevExpress.Web;
using System.Data;
using System.Collections;

namespace wab2018
{
    
    class nowiMediatorzy
    {
        public cm _cm = new cm();




        public bool controlCheckbox(string control,ASPxGridView grid)
        {
            ASPxPageControl pageControl = grid.FindEditFormTemplateControl("ASPxPageControl1") as ASPxPageControl;
            ASPxCheckBox txt = pageControl.FindControl(control) as ASPxCheckBox;

            return txt.Checked;
        }
        public string controlText(string control, ASPxGridView grid)
        {
            ASPxPageControl pageControl = grid.FindEditFormTemplateControl("ASPxPageControl1") as ASPxPageControl;
            ASPxTextBox txt = pageControl.FindControl(control) as ASPxTextBox;
            if (txt == null)
            {
                return "";
            }
            return txt.Text;
        }
        public string controlTextDate(string control, ASPxGridView grid)
        {
            ASPxPageControl pageControl = grid.FindEditFormTemplateControl("ASPxPageControl1") as ASPxPageControl;
            ASPxDateEdit txt = pageControl.FindControl(control) as ASPxDateEdit;
            if (txt == null)
            {
                return "";
            }
            return txt.Date.ToShortDateString();
        }
     

        public DateTime controlKoniecZawieszeniafromWUC( ASPxGridView grid)
        {
            ASPxPageControl pageControl = grid.FindEditFormTemplateControl("ASPxPageControl1") as ASPxPageControl;
            zawieszenia txt = pageControl.FindControl("zawieszenia1") as zawieszenia;
            return txt.koniec.Date;
        }
        
        public string controlTextMemo(string control, ASPxGridView grid)
        {
            ASPxPageControl pageControl = grid.FindEditFormTemplateControl("ASPxPageControl1") as ASPxPageControl;
            ASPxMemo txt = pageControl.FindControl(control) as ASPxMemo;
            if (txt == null)
            {
                return string.Empty ;
            }
            return txt.Text ;
        }

        public void usunTworzonaOsobe(int idOsoby)
        {
            DataTable parametry = _cm.makeParameterTable();
            parametry.Rows.Add("@idosoby", idOsoby);
            _cm.runQuerry("delete from tbl_osoby where ident=@idOsoby", parametry);
            _cm.runQuerry("delete from tbl_osoby where id_osoby=@idOsoby", parametry);
        }

        public void controlTextVisibility(string control, ASPxGridView grid,bool visible)
        {
            ASPxPageControl pageControl = grid.FindEditFormTemplateControl("ASPxPageControl1") as ASPxPageControl;
            ASPxTextBox txt = pageControl.FindControl(control) as ASPxTextBox;
            if (txt != null)
            {
                txt.Visible = visible;
            }
        }

    }
}
