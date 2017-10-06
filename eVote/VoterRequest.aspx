<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VoterRequest.aspx.cs" Inherits="eVote.Register" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<script language="javascript" type="text/javascript">
    function CallPrint() {
        window.open('printDoc.aspx', 'PrintDoc', 'letf=0,top=0,width=640,height=480');        
    }
</script>
<div id ="bill">
    <table style="width: 100%;">
    
                               
        <tr>
            <td>
                Elector&#39;s Name</td>
            <td>
                <asp:TextBox ID="eName" runat="server" placeholder="First Name Last Name"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="eName" ErrorMessage="Name cannot be empty"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Father&#39;s Name</td>
            <td>
                <asp:TextBox ID="eFname" runat="server" placeholder="First Name Last Name"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="eFname" ErrorMessage="Father's Name cannot be empty"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Sex</td>
            <td>
                <asp:DropDownList ID="eSex" runat="server">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                    <asp:ListItem>Others</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Date of Birth</td>
            <td>
                <asp:TextBox ID="eDOB" runat="server" placeholder="dd/mm/yyyy"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="eDOB" ErrorMessage="DOB cannot be empty"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="eDOB" ErrorMessage="Not valid date" 
                    ValidationExpression="(((0|1)[1-9]|2[1-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                Address</td>
            <td>
                <asp:TextBox ID="eAddress" runat="server" placeholder="Enter full address" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="eAddress" ErrorMessage="Address cannot be empty"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Elector&#39;s Photo</td>
            <td>
                <asp:FileUpload ID="ePhoto" runat="server" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="ePhoto" ErrorMessage="Photo cannot be empty"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Email ID</td>
            <td>
                <asp:TextBox ID="eEmail" runat="server" placeholder="Enter email"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="eEmail" ErrorMessage="Email cannot be empty"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="eEmail" ErrorMessage="Not valid email" 
                    ValidationExpression="^(?(&quot;&quot;)(&quot;&quot;.+?&quot;&quot;@)|(([0-9a-zA-Z]((\.(?!\.))|[-!#\$%&amp;'\*\+/=\?\^`\{\}\|~\w])*)(?&lt;=[0-9a-zA-Z])@))(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,6}))$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                Password</td>
            <td>
                <asp:TextBox ID="ePass" runat="server" placeholder="Minimum 6 Character" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="ePass" ErrorMessage="Password cannot be empty"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="ePass" ErrorMessage="Password too short" 
                    ValidationExpression="^[\s\S]{6,}$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                Retype Password</td>
            <td>
                <asp:TextBox ID="eRpass" runat="server" placeholder="Retype same password" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="eRpass" ErrorMessage="Retype password cannot be empty"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="ePass" ControlToValidate="eRpass" 
                    ErrorMessage="Retype password does not match"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="eReg" runat="server" Text="Register" onclick="eReg_Click" />
            </td>
            <td>
                <asp:Button ID="eReset" runat="server" Text="Reset" onclick="eReset_Click" 
                    CausesValidation="False" />
            </td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center">
                <asp:button id="BtnPrint" runat="server" text="Print" 
        onclientclick="javascript:CallPrint();" xmlns:asp="#unknown" 
        style="text-align: center" />&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <em>*Please submit the below documents as hardcopy for candidate confirmation</em></td>
        </tr>
        <tr>
            <td colspan="3">
                <div align="center">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="Doc" HeaderText="Documents" 
                                SortExpression="Doc" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT [Doc] FROM [vRule] WHERE ([Doc] IS NOT NULL)"></asp:SqlDataSource>
                    <br />
                </div>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center">
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>
    </table>

</div>
</asp:Content>
