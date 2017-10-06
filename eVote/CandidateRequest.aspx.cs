using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eVote
{
    public partial class NewCandidate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            System.Data.DataSet D2 = dbAccess.FetchData("select * from cForm");
            Date d1 = new Date(D2.Tables[0].Rows[0]["s"].ToString());
            Date d2 = new Date(D2.Tables[0].Rows[0]["e"].ToString());
            if (Date.getDate(d1, d2) == false)
                Response.Redirect("AdminPanel.aspx");
            if (Session["ID"] != null)
            {
                System.Data.DataSet D = dbAccess.FetchData("select e_Type from voter where e_ID like '" + Session["ID"] + "'");
                if (D.Tables[0].Rows.Count > 0)
                {
                    if (D.Tables[0].Rows[0][0].ToString().StartsWith("U") != true)
                        Response.Redirect("AdminPanel.aspx");
                    if (D.Tables[0].Rows[0][0].ToString().StartsWith("UC") == true)
                        Response.Redirect("AdminPanel.aspx");
                }
                TextBox1.Text = Session["ID"].ToString();
                TextBox1.Enabled = false;
            }
            else
            {
                Response.Redirect("Home.aspx");
            }
            BtnPrint.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            dbAccess.SaveData("insert into tmpCandidate(e_ID,c_Party) values('"+TextBox1.Text+"','"+DropDownList1.Text+"')");
            Label1.Text = "Candidate registration is on process";
            BtnPrint.Visible = true;
        }
    }
}