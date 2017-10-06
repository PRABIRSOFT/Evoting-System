using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eVote
{
    public partial class Notice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] != null)
            {
                System.Data.DataSet D = dbAccess.FetchData("select e_Type from voter where e_ID like '" + Session["ID"] + "'");
                if (D.Tables[0].Rows.Count > 0)
                {
                    if (D.Tables[0].Rows[0][0].ToString().StartsWith("Ad") != true)
                        Response.Redirect("AdminPanel.aspx");
                }
            }
            else
            {
                Response.Redirect("Home.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            dbAccess.SaveData("insert into tNotice(n_ID,n_Date,n_Content) values('" + TextBox1.Text + "','" + DateTime.Today.ToShortDateString() + "','" + TextBox2.Text + "')");
            Label1.Text = "Notice Posted";
            TextBox1.Text = "";
            TextBox2.Text = "";
            Timer1.Enabled = true;
            DropDownList1.DataBind();

        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Label1.Text = "";
            Timer1.Enabled = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                dbAccess.SaveData("delete from tNotice where n_ID='" + DropDownList1.Text + "'");
                Label1.Text = "Notice Deleted";
                TextBox1.Text = "";
                TextBox2.Text = "";
                Timer1.Enabled = true;
                DropDownList1.DataBind();
            }
            catch (Exception ex)
            {
                
            }
        }
    }
}
