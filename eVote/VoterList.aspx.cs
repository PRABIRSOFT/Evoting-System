using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eVote
{
    public partial class VoterList : System.Web.UI.Page
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

        protected void Button1_Click(object sender, EventArgs e)
        {            
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            System.Data.DataSet Ds = dbAccess.FetchData("select * from Voter where([e_Name] LIKE '%'+ '"+TextBox1.Text+"'+'%')");
            TextBox2.Text = Ds.Tables[0].Rows[GridView1.SelectedIndex]["e_ID"].ToString();

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            TextBox2.Text = null;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if(TextBox2.Text != "")
            dbAccess.SaveData("update Voter set e_Type = 'D' where e_ID like '" + TextBox2.Text + "'");
        }      
         
    }
}