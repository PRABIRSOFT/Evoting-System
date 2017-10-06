using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eVote
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["ID"] != null)
            {             
               Response.Redirect("AdminPanel.aspx");
            }            
            System.Data.DataSet Ds = dbAccess.FetchData("select e_Photo from Voter where e_Type like 'Admin'");
            try
            {
                Image1.ImageUrl = Ds.Tables[0].Rows[0][0].ToString();
                
            }
            catch (Exception)
            {
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                System.Data.DataSet Ds = dbAccess.FetchData("select * from Voter where e_ID like '" + TextBox1.Text + "'");
                if (Ds.Tables[0].Rows.Count > 0)
                {
                    if (Ds.Tables[0].Rows[0]["e_Pass"].ToString() == TextBox2.Text)
                    {
                        Session["ID"] = TextBox1.Text;
                        Response.Redirect("AdminPanel.aspx");
                        
                    }
                    else
                    {
                        Label1.Text = "E ID/Password Mismatch";
                    }
                        
                }
            }
            catch (Exception ex)
            {
                Label1.Text = ex.Message.ToString();
            }
        }

    }
}