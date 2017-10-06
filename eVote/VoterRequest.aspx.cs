using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eVote
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            System.Data.DataSet D2 = dbAccess.FetchData("select * from vForm");
            Date d1 = new Date(D2.Tables[0].Rows[0]["s"].ToString());
            Date d2 = new Date(D2.Tables[0].Rows[0]["e"].ToString());
           if (Date.getDate(d1, d2) == false)
               Response.Redirect("AdminPanel.aspx");
           BtnPrint.Visible = false;
        }

        protected void eReg_Click(object sender, EventArgs e)
        {
            //string FileName = System.IO.Path.GetExtension(ePhoto.PostedFile.FileName);
            if (ePhoto.PostedFile.FileName != "")
            {
                string f = eEmail.Text.Replace('@', 'a');
                f = f.Replace('.', '1');
                ePhoto.SaveAs(Server.MapPath("Pics/" + f + ".jpg"));
                dbAccess.SaveData("insert into tmpVoter(e_Email,e_Name,e_FName,e_Address,e_Sex,e_DOB,e_Photo,e_Pass) values('" + eEmail.Text + "','" + eName.Text + "','" + eFname.Text + "','" + eAddress.Text + "','" + eSex.Text + "','" + eDOB.Text + "','" + "Pics/" + f + ".jpg" + "','" + ePass.Text + "')");
                Label1.Text = "Your request has been accepted";                
                Session["DOC"] = eEmail.Text;
                BtnPrint.Visible = true;
            }            
            
        }

        protected void eReset_Click(object sender, EventArgs e)
        {
            eName.Text = null;
            eFname.Text = null;
            eAddress.Text = null;
            eDOB.Text = null;
            eEmail.Text = null;
            ePass.Text = null;
            eRpass.Text = null;            
        }                 
    }
}