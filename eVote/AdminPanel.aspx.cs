using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eVote
{
    public partial class AdminPanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] != null)
            {
                System.Data.DataSet D = dbAccess.FetchData("select e_Type from Voter where e_ID like '" + Session["ID"] + "'");
                if (D.Tables[0].Rows[0][0].ToString().StartsWith("A") == false)
                    Response.Redirect("vProfile.aspx");
            }
            else
                Response.Redirect("Home.aspx");             
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Session["ID"] = null;
            Response.Redirect("Home.aspx");
        }
    }
}