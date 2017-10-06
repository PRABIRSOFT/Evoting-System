using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eVote
{
    public partial class VoterApproval : System.Web.UI.Page
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

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {            
            System.Data.DataSet ds = dbAccess.FetchData("select * from tmpVoter");
            TextBox3.Text = ds.Tables[0].Rows[GridView1.SelectedIndex]["e_Email"].ToString();            
         }

        protected void Button1_Click(object sender, EventArgs e)        
        {
            if (TextBox3.Text != "")
            {
                System.Data.DataSet ds = dbAccess.FetchData("select * from tmpVoter where e_Email like '" + TextBox3.Text + "'");
                System.Data.DataSet ds2 = dbAccess.FetchData("select * from Voter");
                Decimal i = ds2.Tables[0].Rows.Count;
                string s = null;
                int j;
                for (j = 8; i.ToString().Length != j; j--)
                {
                    s = s + "0";
                }
                s = s + i.ToString();

                dbAccess.SaveData("insert into voter(e_ID,e_Name,e_FName,e_Sex,e_DOB,e_Address,e_Photo,e_Email,e_Pass,e_Type,e_Stat) values('" + s + "','" + ds.Tables[0].Rows[0]["e_Name"] + "','" + ds.Tables[0].Rows[0]["e_FName"] + "','" + ds.Tables[0].Rows[0]["e_Sex"] + "','" + ds.Tables[0].Rows[0]["e_DOB"] + "','" + ds.Tables[0].Rows[0]["e_Address"] + "','" + ds.Tables[0].Rows[0]["e_Photo"] + "','" + ds.Tables[0].Rows[0]["e_Email"] + "','" + ds.Tables[0].Rows[0]["e_Pass"] + "','" + "U" + "','" + "0')");
                dbAccess.SaveData("delete from tmpVoter where e_Email='" + TextBox3.Text + "'");
                GridView1.DataBind();
                Label1.Text = "Voter Added Voter ID is " + s;
                Response.Redirect("mailto:" + ds.Tables[0].Rows[0]["e_Email"].ToString() + "?subject=Registration%20Successfull &body=Your%20Voter%20ID%20is%20" + s, false);
                TextBox3.Text = "";
                GridView1.DataBind();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (TextBox3.Text != "")
            {
                System.Data.DataSet Ds = dbAccess.FetchData("select e_Photo from tmpVoter where e_Email like '" + TextBox3.Text + "'");
                dbAccess.SaveData("delete from tmpVoter where e_Email='" + TextBox3.Text + "'");
                System.IO.File.Delete(Server.MapPath(Ds.Tables[0].Rows[0][0].ToString()));
                TextBox3.Text = "";
                GridView1.DataBind();
                Label1.Text = "Request Deleted";
            }
        }

    }
}