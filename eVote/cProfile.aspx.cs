using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eVote
{
    public partial class cProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] != null)
            {
                System.Data.DataSet D = dbAccess.FetchData("select e_Type from Voter where e_ID like '" + Session["ID"] + "'");
                System.Data.DataSet D2 = dbAccess.FetchData("select * from Candidate where c_EID like '" + Session["ID"] + "'");
                if (D.Tables[0].Rows[0][0].ToString().StartsWith("UC") == true)
                {
                    Button3.Visible = false;
                    eID.Text = D2.Tables[0].Rows[0]["c_ID"].ToString();
                    eID.Enabled = false;
                    eName.Text = D2.Tables[0].Rows[0]["c_Name"].ToString();
                    eName.Enabled = false;
                    eSex.Text = D2.Tables[0].Rows[0]["c_Sex"].ToString();
                    eSex.Enabled = false;
                    eFname.Text = D2.Tables[0].Rows[0]["c_FName"].ToString();
                    eFname.Enabled = false;
                    eAddress.Text = D2.Tables[0].Rows[0]["c_Address"].ToString();
                    eAddress.Enabled = false;
                    eDob.Text = D2.Tables[0].Rows[0]["c_DOB"].ToString();
                    eDob.Enabled = false;
                    Image1.ImageUrl = D2.Tables[0].Rows[0]["c_Photo"].ToString();
                    ePhoto.Enabled = false;
                    eDtl.Text = D2.Tables[0].Rows[0]["c_Dtl"].ToString();
                    eDtl.Enabled = false;
                    eParty.SelectedValue = D2.Tables[0].Rows[0]["c_Party"].ToString();
                    eParty.Enabled = false;
                    Button1.Visible = false;
                }
                else if (D.Tables[0].Rows[0][0].ToString().StartsWith("A") == true)
                {
                    Button1.Visible = false;
                    if (eID.Text == "")
                    {
                        Button1.Visible = false;                        
                    }
                    
                }
                else
                {
                    Response.Redirect("vProfile.aspx");
                }
            }
            else
                Response.Redirect("Home.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           try
           {
               dbAccess.SaveData("update Candidate set c_Name='" + eName.Text + "' where c_ID like '" + eID.Text + "'");
               dbAccess.SaveData("update Candidate set c_FName='" + eFname.Text + "' where c_ID like '" + eID.Text + "'");
               dbAccess.SaveData("update Candidate set c_Sex='" + eSex.Text + "' where c_ID like '" + eID.Text + "'");
               dbAccess.SaveData("update Candidate set c_DOB='" + eDob.Text + "' where c_ID like '" + eID.Text + "'");
               dbAccess.SaveData("update Candidate set c_Address='" + eAddress.Text + "' where c_ID like '" + eID.Text + "'");
               dbAccess.SaveData("update Candidate set c_Dtl='" + eDtl.Text + "' where c_ID like '" + eID.Text + "'");
               dbAccess.SaveData("update Candidate set c_Party='" + eParty.Text + "' where c_ID like '" + eID.Text + "'");
               System.Data.DataSet D = dbAccess.FetchData("select p_Logo from tParty where p_Name like '" + eParty.Text+"'");
               dbAccess.SaveData("update Candidate set c_PLogo='" + D.Tables[0].Rows[0][0].ToString() + "' where c_ID like '" + eID.Text + "'");
               if (ePhoto.PostedFile.FileName != "")
               {

                   System.Data.DataSet Ds = dbAccess.FetchData("select c_Photo from Candidate where c_ID like '" + eID.Text + "'");
                   ePhoto.SaveAs(Server.MapPath(Ds.Tables[0].Rows[0][0].ToString()));
                   Image1.ImageUrl = Ds.Tables[0].Rows[0][0].ToString();
               }
               Label1.Text = "Profile Updated";
           }       
           catch(Exception ex)
           {
                    Label1.Text = "System Fault" + ex.Message.ToString();
           }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                System.Data.DataSet D2 = dbAccess.FetchData("select * from Candidate where c_ID like '" + eID.Text + "'");
                eID.Text = D2.Tables[0].Rows[0]["c_ID"].ToString();
                eID.Enabled = false;
                eName.Text = D2.Tables[0].Rows[0]["c_Name"].ToString();
                eSex.Text = D2.Tables[0].Rows[0]["c_Sex"].ToString();
                eFname.Text = D2.Tables[0].Rows[0]["c_FName"].ToString();
                eAddress.Text = D2.Tables[0].Rows[0]["c_Address"].ToString();
                eDob.Text = D2.Tables[0].Rows[0]["c_DOB"].ToString();
                Image1.ImageUrl = D2.Tables[0].Rows[0]["c_Photo"].ToString();
                eDtl.Text = D2.Tables[0].Rows[0]["c_Dtl"].ToString();
                eParty.Text = D2.Tables[0].Rows[0]["c_Party"].ToString();
                Button1.Visible = true;
                Button3.Visible = false;
            }
            catch (Exception)
            {
                Label1.Text = "data mismatch";
                Button3.Visible = true;
            }
        }
    }
}