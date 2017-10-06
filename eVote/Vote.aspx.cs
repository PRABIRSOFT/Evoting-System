using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eVote
{
    public partial class Vote : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            System.Data.DataSet D1 = dbAccess.FetchData("select * from tVdate");
            Date d1 = new Date(D1.Tables[0].Rows[0]["s"].ToString());
            Date d2 = new Date(D1.Tables[0].Rows[0]["e"].ToString());
            if (Date.getDate(d1, d2) == false)
                Response.Redirect("AdminPanel.aspx");
            if (Session["ID"] != null)
            {
                System.Data.DataSet D = dbAccess.FetchData("select * from voter where e_ID like '" + Session["ID"] + "'");
                if (D.Tables[0].Rows[0]["e_Stat"].ToString() == "1")
                    Response.Redirect("AdminPanel.aspx");
                TextBox1.Text = D.Tables[0].Rows[0]["e_Name"].ToString();
            }
            else
            {
                Response.Redirect("Home.aspx");
            }
            Phase2.Visible = false;
            Phase3.Visible = false;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (RadioButton1.Checked == true)
            {
                System.Data.DataSet D = dbAccess.FetchData("select * from candidate");
                string s = D.Tables[0].Rows[GridView1.SelectedIndex]["c_Vote"].ToString();
                decimal v = Convert.ToDecimal(s);
                v = v + 1;
                dbAccess.SaveData("update Candidate set c_Vote = '" + v.ToString() + "' where c_ID like '" + D.Tables[0].Rows[GridView1.SelectedIndex]["c_ID"].ToString() + "'");
                dbAccess.SaveData("update Voter set e_Stat = '1' where e_ID like '" + Session["ID"] + "'");
                Phase3.Visible = true;
            }
            else
            {
                Label1.Text = "Confirm first";
            }            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            System.Data.DataSet D = dbAccess.FetchData("select * from voter where e_ID like '" + Session["ID"] + "'");
            if (eDOB.Text == D.Tables[0].Rows[0]["e_DOB"].ToString() && ePass.Text == D.Tables[0].Rows[0]["e_Pass"].ToString())
            {
                Phase1.Visible = false;
                Phase2.Visible = true;
                Button3.Visible = false;
            }
            else
            {
                Label1.Text = "Login Failed";
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            eDOB.Text = "";
            ePass.Text = "";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            System.Data.DataSet D = dbAccess.FetchData("select * from candidate");
            Label2.Text = "You are voting for " + D.Tables[0].Rows[GridView1.SelectedIndex]["c_Name"];
            Phase2.Visible = true;
            Button3.Visible = true;
            RadioButton1.Checked = false;            
        }
    }
}