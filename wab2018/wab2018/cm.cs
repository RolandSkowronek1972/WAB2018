using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace wab2018
{
    class cm
    {

        private static readonly log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        public string con_str = ConfigurationManager.ConnectionStrings["wap"].ConnectionString;



        public DataTable makeParameterTable()
        {
            DataTable parameters = new DataTable();
            parameters.Columns.Add("name", typeof(String));
            parameters.Columns.Add("value", typeof(String));
            return parameters;

        }
        public void runQuerry(string kwerenda, string connStr, DataTable parameters)
        {
            log.Debug("start runQuerry");
            var conn = new SqlConnection(connStr);
            using (SqlCommand sqlCmd = new SqlCommand(kwerenda, conn))
            {
                try
                {
                    log.Debug("try to open DB connection");
                    conn.Open();
                    if (parameters != null)
                    {
                        foreach (DataRow row in parameters.Rows)
                        {
                            sqlCmd.Parameters.AddWithValue(row[0].ToString().Trim(), row[1].ToString().Trim());
                            log.Debug("add parameter -0 name: " + row[0].ToString().Trim() + " value: " + row[1].ToString().Trim());
                        }
                    }
                    log.Debug("executing querry");
                    sqlCmd.ExecuteScalar();
                    log.Debug("querry executed");
                    conn.Close();

                }
                catch (Exception ex)
                {
                    log.Error("runQuerry Error: " + ex.Message);
                    conn.Close();
                }
            } // end of using


        }


        public string runQuerryWithResult(string kwerenda, string connStr, DataTable parameters)
        {
            log.Debug("start runQuerryWithResult");
            string result = string.Empty;
            var conn = new SqlConnection(connStr);
            using (SqlCommand sqlCmd = new SqlCommand(kwerenda, conn))
            {
                try
                {
                    log.Debug("try to open DB connection");
                    conn.Open();
                    if (parameters != null)
                    {
                        foreach (DataRow row in parameters.Rows)
                        {
                            sqlCmd.Parameters.AddWithValue(row[0].ToString().Trim(), row[1].ToString().Trim());
                            log.Debug("add parameter -0 name: " + row[0].ToString().Trim() + " value: " + row[1].ToString().Trim());
                        }
                    }
                    log.Debug("executing querry");
                    result = sqlCmd.ExecuteScalar().ToString().Trim();
                    log.Debug("querry executed with result");
                    conn.Close();

                }
                catch (Exception ex)
                {
                    log.Error("runQuerry Error: " + ex.Message);
                    conn.Close();
                }
                return result;
            } // end of using


        }

        public string runQuerryWithResult(string kwerenda, string connStr)
        {
            log.Debug("start runQuerryWithResult");
            string result = string.Empty;
            var conn = new SqlConnection(connStr);
            using (SqlCommand sqlCmd = new SqlCommand(kwerenda, conn))
            {
                try
                {
                    log.Debug("try to open DB connection");
                    conn.Open();
                    log.Debug("DB connection opened");
                    log.Debug("executing querry");
                    result = sqlCmd.ExecuteScalar().ToString().Trim();
                    log.Debug("querry executed with result");
                    conn.Close();
                }
                catch (Exception ex)
                {
                    log.Error("runQuerry Error: " + ex.Message);
                    conn.Close();
                }

                //    string.IsNullOrEmpty(result)  ? (log.Debug("return null value") ):  ( log.Debug("return value")); 


                return result;
            } // end of using


        }

        public DataTable getDataTable( string Kwerenda)
        {

            SqlConnection conn = new SqlConnection(con_str);
            DataSet lista = new DataSet();
            DataTable returntable = new DataTable();
            try
            {
                conn.Open();
                SqlDataAdapter daMenu = new SqlDataAdapter();
                daMenu.SelectCommand = new SqlCommand(Kwerenda, conn);
                daMenu.Fill(lista);
                conn.Close();
                returntable = lista.Tables[0];

            }
            catch (Exception ec)
            {
                conn.Close();
            }
            return returntable;

        }

        public DataTable getDataTable(string connectionString, string Kwerenda)
        {

            SqlConnection conn = new SqlConnection(connectionString);
            DataSet lista = new DataSet();
            DataTable returntable = new DataTable();
            try
            {
                conn.Open();
                SqlDataAdapter daMenu = new SqlDataAdapter();
                daMenu.SelectCommand = new SqlCommand(Kwerenda, conn);
                daMenu.Fill(lista);
                conn.Close();
                returntable = lista.Tables[0];

            }
            catch (Exception ec)
            {
                conn.Close();
            }
            return returntable;

        }
        //==========================================================================================================================================
        //==========================================================================================================================================
        //==========================================================================================================================================


    }
}
