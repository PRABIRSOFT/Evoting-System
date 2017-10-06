using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eVote
{
    public partial class Profile : System.Web.UI.Page
    {
        private string Usr = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            System.Data.DataSet D = dbAccess.FetchData("select * from tVdate");
            System.Data.DataSet D1 = dbAccess.FetchData("select * from cForm");
            Date d1 = new Date(D.Tables[0].Rows[0]["s"].ToString());
            Date d2 = new Date(D.Tables[0].Rows[0]["e"].ToString());
            if (Date.getDate(d1, d2) == true)
               HyperLink2.Visible = true;
            else
                HyperLink2.Visible = false;
            d1 = new Date(D1.Tables[0].Rows[0]["s"].ToString());
            d2 = new Date(D1.Tables[0].Rows[0]["e"].ToString());
            if (Date.getDate(d1, d2) == true)
                HyperLink3.Visible = true;
            else
                HyperLink3.Visible = false;
            if (Session["ID"] != null)
            {
                System.Data.DataSet D2 = dbAccess.FetchData("select * from Voter where e_ID like '" + Session["ID"] + "'");
                if (D2.Tables[0].Rows[0]["e_Type"].ToString().StartsWith("D") == true)
                {
                    Session["ID"] = null;
                    Response.Redirect("Home.aspx");
                }
                else if (D2.Tables[0].Rows[0]["e_Type"].ToString().StartsWith("U") == true)
                {
                    Button3.Visible = false;
                    eID.Text = D2.Tables[0].Rows[0]["e_ID"].ToString();
                    eID.Enabled = false;
                    eName.Text = D2.Tables[0].Rows[0]["e_Name"].ToString();
                    eName.Enabled = false;
                    eSex.Text = D2.Tables[0].Rows[0]["e_Sex"].ToString();
                    eSex.Enabled = false;
                    eFname.Text = D2.Tables[0].Rows[0]["e_FName"].ToString();
                    eFname.Enabled = false;
                    eAddress.Text = D2.Tables[0].Rows[0]["e_Address"].ToString();
                    eAddress.Enabled = false;
                    eDob.Text = D2.Tables[0].Rows[0]["e_DOB"].ToString();
                    eDob.Enabled = false;
                    Image1.ImageUrl = D2.Tables[0].Rows[0]["e_Photo"].ToString();                 
                    ePhoto.Enabled = false;
                    //eEmail.Text = D2.Tables[0].Rows[0]["e_Email"].ToString();                    
                    DropDownList1.Enabled = false;
                    Button2.Visible = false;
                    Usr = "Voter";
                    if (D2.Tables[0].Rows[0]["e_Type"].ToString().StartsWith("UC") == true)
                    {
                        HyperLink4.Visible = true;
                        HyperLink3.Visible = false;
                    }
                    else
                    {
                        HyperLink4.Visible = false;
                        HyperLink3.Visible = true;
                    }
                }
                else if(D2.Tables[0].Rows[0]["e_Type"].ToString().StartsWith("A") == true)
                {
                    Button4.Visible = false;
                    if (eID.Text == "")
                    {
                        Button1.Visible = false;
                        Button2.Visible = false;
                    }
                    HyperLink3.Visible = false;
                    Usr = "Admin";
                }
                if (D2.Tables[0].Rows[0]["e_Stat"].ToString() == "1")
                    HyperLink2.Visible = false;                   
            }
            else
                Response.Redirect("Home.aspx");

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Usr == "Voter")
            {
                if (eEmail.Text != "" && ePass.Text != "")
                {
                    dbAccess.SaveData("update Voter set e_Email='" + eEmail.Text + "' where e_ID like '" + eID.Text + "'");
                    dbAccess.SaveData("update Voter set e_Pass='" + ePass.Text + "' where e_ID like '" + eID.Text + "'");
                    Label1.Text = "Profile Updated";
                }
                else
                {
                    Label1.Text = "any field can not be empty";
                }
            }
            else if (Usr == "Admin")
            {
                dbAccess.SaveData("update Voter set e_Name='" + eName.Text + "' where e_ID like '" + eID.Text + "'");
                dbAccess.SaveData("update Voter set e_FName='" + eFname.Text + "' where e_ID like '" + eID.Text + "'");
                dbAccess.SaveData("update Voter set e_Sex='" + eSex.Text + "' where e_ID like '" + eID.Text + "'");
                dbAccess.SaveData("update Voter set e_DOB='" + eDob.Text + "' where e_ID like '" + eID.Text + "'");
                dbAccess.SaveData("update Voter set e_Address='" + eAddress.Text + "' where e_ID like '" + eID.Text + "'");
                if (ePhoto.PostedFile.FileName != "")
                {
                    System.Data.DataSet Ds = dbAccess.FetchData("select e_Photo from Voter where e_ID like '" + eID.Text + "'");
                    
                    ePhoto.SaveAs(Server.MapPath(Ds.Tables[0].Rows[0][0].ToString()));
                    Image1.ImageUrl = Ds.Tables[0].Rows[0][0].ToString();
                }
                if (eID.Text.ToString() == Session["ID"].ToString())
                {
                    if (eEmail.Text != "" && ePass.Text != "")
                    {
                        dbAccess.SaveData("update Voter set e_Email='" + eEmail.Text + "' where e_ID like '" + eID.Text + "'");
                        dbAccess.SaveData("update Voter set e_Pass='" + ePass.Text + "' where e_ID like '" + eID.Text + "'");
                        Label1.Text = "Profile Updated";                        
                    }
                    else
                    {
                        Label1.Text = "any field can not be empty";
                    }
                }

            }
            else
            {
                Label1.Text = "System Fault";
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Session["ID"] = null;
            Response.Redirect("Home.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            
            string s = null;
            if (eID.Text != "")
            {
                if (DropDownList1.Text == "Voter")
                    s = "U";
                else
                    s = "A";
                dbAccess.SaveData("update Voter set e_Type='" + s + "' where e_ID like '" +eID.Text+"'");
                Label1.Text = "Profile Updated";
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                System.Data.DataSet D = dbAccess.FetchData("select * from Voter where e_ID like '" + eID.Text + "'");
                Button3.Visible = false;
                eID.Text = D.Tables[0].Rows[0]["e_ID"].ToString();
                eID.Enabled = false;
                eName.Text = D.Tables[0].Rows[0]["e_Name"].ToString();
                eSex.Text = D.Tables[0].Rows[0]["e_Sex"].ToString();
                eFname.Text = D.Tables[0].Rows[0]["e_FName"].ToString();
                eAddress.Text = D.Tables[0].Rows[0]["e_Address"].ToString();
                eDob.Text = D.Tables[0].Rows[0]["e_DOB"].ToString();
                Image1.ImageUrl = D.Tables[0].Rows[0]["e_Photo"].ToString();
                //eEmail.Text = D.Tables[0].Rows[0]["e_Email"].ToString();
                if (eID.Text.ToString() != Session["ID"].ToString())
                {
                    ePass.Enabled = false;
                    eEmail.Enabled = false;
                }
                Button1.Visible = true;
                Button2.Visible = true;
                int i = 0;
                if (D.Tables[0].Rows[0]["e_Type"].ToString().StartsWith("A") == true)
                    i = 1;
                DropDownList1.SelectedIndex = i;
            }
            catch (Exception)
            {
                Label1.Text = "data mismatch";
                Button3.Visible = true;
            }
        }
    }
}