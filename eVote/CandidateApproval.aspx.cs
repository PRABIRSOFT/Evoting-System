using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eVote
{
    public partial class CandidateApproval : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] != null)
            {
                System.Data.DataSet D = dbAccess.FetchData("select e_Type from voter where e_ID like '" + Session["ID"] + "'");
                if (D.Tables[0].Rows.Count > 0)
                {
                    if (D.Tables[0].Rows[0][0].ToString().StartsWith("A") != true)
                        Response.Redirect("AdminPanel.aspx");
                }
            }
            else
            {
                Response.Redirect("Home.aspx");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            System.Data.DataSet ds = dbAccess.FetchData("select * from tmpCandidate");
            TextBox1.Text = ds.Tables[0].Rows[GridView1.SelectedIndex]["e_ID"].ToString();            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != "")
            {
                System.Data.DataSet tC = dbAccess.FetchData("select * from tmpCandidate");
                System.Data.DataSet V = dbAccess.FetchData("select * from Voter where e_ID like '" + TextBox1.Text + "'");
                System.Data.DataSet p = dbAccess.FetchData("select * from tParty where p_Name like '" + tC.Tables[0].Rows[GridView1.SelectedIndex]["c_Party"] + "'");
                System.Data.DataSet C = dbAccess.FetchData("select * from Candidate");
                Decimal i = C.Tables[0].Rows.Count;
                string s = null;
                int j;
                for (j = 4; i.ToString().Length != j; j--)
                {
                    s = s + "0";
                }
                s = s + i.ToString();
                dbAccess.SaveData("insert into Candidate(c_ID,c_EID,c_Name,c_FName,c_Sex,c_DOB,c_Address,c_Photo,c_Dtl,c_Party,c_PLogo,c_Vote) values('" + s + "','" + V.Tables[0].Rows[0]["e_ID"] + "','" + V.Tables[0].Rows[0]["e_Name"] + "','" + V.Tables[0].Rows[0]["e_FName"] + "','" + V.Tables[0].Rows[0]["e_Sex"] + "','" + V.Tables[0].Rows[0]["e_DOB"] + "','" + V.Tables[0].Rows[0]["e_Address"] + "','" + V.Tables[0].Rows[0]["e_Photo"] + "','" + "no details" + "','" + p.Tables[0].Rows[0]["p_Name"] + "','" + p.Tables[0].Rows[0]["p_Logo"] + "','" + "0')");
                dbAccess.SaveData("delete from tmpCandidate where e_ID='" + TextBox1.Text + "'");
                dbAccess.SaveData("update Voter set e_Type = 'UC' where e_ID like '" + TextBox1.Text + "'");
                GridView1.DataBind();
                Label1.Text = "Candidate Added Candidate ID is " + s;
                Response.Redirect("mailto:" + V.Tables[0].Rows[0]["e_Email"].ToString() + "?subject=Registration%20Successfull &body=Your%20Candidate%20ID%20is%20" + s, false);
                GridView1.DataBind();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != "")
            {
                dbAccess.SaveData("delete from tmpCandidate where e_ID='" + TextBox1.Text + "'");
                GridView1.DataBind();
                Label1.Text = "Request Deleted";
            }
        }
    }
}