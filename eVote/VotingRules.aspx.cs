using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eVote
{
    public partial class NewParty : System.Web.UI.Page
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
            System.Data.DataSet D2 = dbAccess.FetchData("select * from tVdate");
            System.Data.DataSet D3 = dbAccess.FetchData("select * from cForm");
            System.Data.DataSet D4 = dbAccess.FetchData("select * from vForm");

            Label2.Text = "( "+D2.Tables[0].Rows[0]["s"].ToString()+" ) -"+ " ( " + D2.Tables[0].Rows[0]["e"].ToString() + " )";
            Label3.Text = "( " + D3.Tables[0].Rows[0]["s"].ToString() + " ) -" + " ( " + D3.Tables[0].Rows[0]["e"].ToString() + " )";
            Label4.Text = "( " + D4.Tables[0].Rows[0]["s"].ToString() + " ) -" + " ( " + D4.Tables[0].Rows[0]["e"].ToString() + " )";          
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            dbAccess.SaveData("update tVdate set s='" + TextBox3.Text + "'");
            dbAccess.SaveData("update tVdate set e='" + TextBox7.Text + "'");
            Label1.Text = "Rules Updated";
            Timer1.Enabled = true;
        }

        protected void Timer1_Tick1(object sender, EventArgs e)
        {
            Label1.Text = "";
            Timer1.Enabled = false;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            dbAccess.SaveData("delete from cRule where Doc like '" + DropDownList1.Text + "'");
            DropDownList1.DataBind();
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            dbAccess.SaveData("delete from vRule where Doc like '" + DropDownList3.Text + "'");
            DropDownList3.DataBind();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            dbAccess.SaveData("delete from tParty where p_Name like '" + DropDownList2.Text + "'");
            DropDownList2.DataBind();
            System.IO.File.Delete(Server.MapPath("Logos/"+DropDownList3.Text+".jpg"));
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(TextBox1.Text != "")
                dbAccess.SaveData("insert into cRule(Doc) values('" + TextBox1.Text + "')");
            DropDownList1.DataBind();
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            if (TextBox4.Text != "")
                dbAccess.SaveData("insert into vRule(Doc) values('" + TextBox4.Text + "')");
            DropDownList3.DataBind();
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            if (TextBox2.Text != "" && FileUpload1.PostedFile.FileName != "")
            {
                //string FileName = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName);                
                FileUpload1.SaveAs(Server.MapPath("Logos/" + TextBox2.Text + ".jpg"));
                dbAccess.SaveData("insert into tParty(p_Name,p_Logo) values('" + TextBox2.Text + "','" + "Logos/" + TextBox2.Text + ".jpg" + "')");
                DropDownList2.DataBind();
            }
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            dbAccess.SaveData("update cForm set s='" + TextBox5.Text + "'");
            dbAccess.SaveData("update cForm set e='" + TextBox8.Text + "'");
            Label1.Text = "Rules Updated";
            Timer1.Enabled = true;
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            dbAccess.SaveData("update vForm set s='" + TextBox6.Text + "'");
            dbAccess.SaveData("update vForm set e='" + TextBox9.Text + "'");
            Label1.Text = "Rules Updated";
            Timer1.Enabled = true;
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            dbAccess.SaveData("update vForm set s='00/00/0000'");
            dbAccess.SaveData("update vForm set e='00/00/0000'");
            dbAccess.SaveData("update cForm set s='00/00/0000'");
            dbAccess.SaveData("update cForm set e='00/00/0000'");
            dbAccess.SaveData("update tVdate set s='00/00/0000'");
            dbAccess.SaveData("update tVdate set e='00/00/0000'");
            dbAccess.SaveData("update tVdate set Event='0'");
            dbAccess.SaveData("delete from Candidate");
            dbAccess.SaveData("update Voter set e_Stat='0'");
            Label1.Text = "New Vote Created";
            Timer1.Enabled = true;
        }
    }
}