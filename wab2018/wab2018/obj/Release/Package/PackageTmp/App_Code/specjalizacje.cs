using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace wab2018.App_Code
{
    class specjalizacje
    {
      //  private Cm cm common = new cm();

        public string con_str = ConfigurationManager.ConnectionStrings["wap"].ConnectionString;

        public void dadajSpecjalizacjeosoby(string specjalizacja, string id)
        {
            var conn = new SqlConnection(con_str);
            SqlCommand sqlCmd;
            using (sqlCmd = new SqlCommand())
            {
                sqlCmd = new SqlCommand("INSERT     INTO  tbl_specjalizacje_osob (id_osoby, id_specjalizacji) VALUES (@id_osoby, @id_specjalizacji)", conn);
                try
                {
                    conn.Open();
                    sqlCmd.Parameters.AddWithValue("@id_osoby", id);
                    sqlCmd.Parameters.AddWithValue("@id_specjalizacji", specjalizacja);
                    sqlCmd.ExecuteScalar();
                    conn.Close();
                }
                catch (Exception ex)
                { }
            }
        }// end of dodaj_specjalizacje
    }
}
