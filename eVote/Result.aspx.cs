using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eVote
{
    public partial class Result : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            System.Data.DataSet d = dbAccess.FetchData("select Event from tVdate");
            if (d.Tables[0].Rows[0][0].ToString() == "0")
            {
                if (Session["ID"] != null)
                {
                    System.Data.DataSet D = dbAccess.FetchData("select e_Type from Voter where e_ID like '" + Session["ID"] + "'");
                    if (D.Tables[0].Rows[0][0].ToString().StartsWith("Ad") == false)
                        Button1.Visible = false;
                }
                else
                {
                    Button1.Visible = false;
                }
                GridView1.Visible = false;
            }
            else
            {
                Button1.Visible = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            dbAccess.SaveData("update tVdate set Event = '1'");
            GridView1.Visible = true;
            Button1.Visible = false;
        }
    }
}