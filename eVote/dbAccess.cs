using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace eVote
{
    public class dbAccess
    {
        public static void SaveData(string querry)
        {

            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings[1].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(querry, con);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public static DataSet FetchData(string query)
        {
            SqlConnection Con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings[1].ToString());
            Con.Open();
            SqlDataAdapter Da = new SqlDataAdapter(query, Con);
            DataSet Ds = new DataSet();
            Da.Fill(Ds);
            Con.Close();
            return Ds;
        }
    }
}