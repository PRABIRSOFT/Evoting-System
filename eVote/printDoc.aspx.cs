using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eVote
{
    public partial class printDoc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] != null || Session["DOC"] != null)
            {
                System.Data.DataSet D;
                if (Session["DOC"] == null)
                {
                    D = dbAccess.FetchData("select * from Voter where e_ID like '" + Session["ID"] + "'");
                    System.Data.DataSet D1 = dbAccess.FetchData("select c_Party from tmpCandidate where e_ID like '" + Session["ID"] + "'");
                    System.Data.DataSet D2 = dbAccess.FetchData("select p_Logo from tParty where p_Name like '" + D1.Tables[0].Rows[0][0].ToString() + "'");
                    Label1.Text = "Candidate Application";
                    TextBox7.Text = D1.Tables[0].Rows[0][0].ToString();
                    Image2.ImageUrl = D2.Tables[0].Rows[0][0].ToString();
                }
                else
                {
                    D = dbAccess.FetchData("select * from tmpVoter where e_Email like '" + Session["DOC"] + "'");
                    Label1.Text = "Voter Application";
                    cPanel.Visible = false;
                }
                TextBox1.Text = D.Tables[0].Rows[0]["e_Name"].ToString();
                TextBox2.Text = D.Tables[0].Rows[0]["e_FName"].ToString();
                TextBox3.Text = D.Tables[0].Rows[0]["e_Sex"].ToString();
                TextBox4.Text = D.Tables[0].Rows[0]["e_DOB"].ToString();
                TextBox5.Text = D.Tables[0].Rows[0]["e_Email"].ToString();
                TextBox6.Text = D.Tables[0].Rows[0]["e_Address"].ToString();
                Image1.ImageUrl = D.Tables[0].Rows[0]["e_Photo"].ToString();
            }
            else
            {
                Response.Write("<script>javascript:window.close()</script>");
            }
        }
    }
}