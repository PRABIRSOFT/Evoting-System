<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Vote.aspx.cs" Inherits="eVote.Vote" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            height: 23px;
        }
        .style2
        {
            font-size: small;
        }
    </style>
</head>
<body style="background-image: url('fyd.jpg'); background-repeat: no-repeat; background-attachment: fixed; background-position: center center">
    <form id="fVote" runat="server">
    <div>
    
        <asp:Panel ID="Phase1" runat="server">
            <table style="width:100%;">
                <tr>
                    <td>
                        <h3>
                            <em>Welcome Voter</em></h3>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                    <td colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        Relogin</td>
                    <td class="style1">
                        &nbsp;</td>
                    <td class="style1">
                        &nbsp;</td>
                    <td class="style1">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        Password*</td>
                    <td>
                        <asp:TextBox ID="ePass" runat="server" placeholder="enter Password" 
                            TextMode="Password"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="ePass" ErrorMessage="can not be empty"></asp:RequiredFieldValidator>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        Date of Birth*</td>
                    <td>
                        <asp:TextBox ID="eDOB" runat="server" placeholder="dd/mm/yyyy"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="ePass" ErrorMessage="can not be empty"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="eDOB" ErrorMessage="not valid date" 
                            ValidationExpression="(((0|1)[1-9]|2[1-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style2" colspan="2">
                        <em>* fields are mandotory</em></td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Next" onclick="Button1_Click" />
                    </td>
                    <td>
                        <asp:Button ID="Button2" runat="server" Text="Reset" onclick="Button2_Click" 
                            CausesValidation="False" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center">
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>

    
        <asp:Panel ID="Phase2" runat="server">
            <table style="width:100%;">
                <tr>
                    <td>
                        <h3>
                            <em>Select The Candidate</em></h3>
                    </td>
                </tr>
                <tr>
                    <td>
                    <div align="center">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                            AutoGenerateColumns="False" DataKeyNames="c_ID" 
                            DataSourceID="SqlDataSource1" 
                            onselectedindexchanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="c_ID" HeaderText="Candidate ID" ReadOnly="True" 
                                    SortExpression="c_ID" />
                                <asp:BoundField DataField="c_Name" HeaderText="Name" SortExpression="c_Name" />
                                <asp:TemplateField HeaderText="Photo" SortExpression="c_Photo">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("c_Photo") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" AlternateText="No Image" Height="64px" 
                                            ImageUrl='<%# Bind("c_Photo") %>' Width="48px" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Logo" SortExpression="c_PLogo">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("c_PLogo") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Image ID="Image2" runat="server" AlternateText="No Logo" Height="64px" 
                                            ImageUrl='<%# Bind("c_Plogo") %>' Width="48px" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT [c_ID], [c_Name], [c_Photo], [c_PLogo] FROM [Candidate]">
                        </asp:SqlDataSource>
                        </div>
                    </td>
                </tr>
            </table>
            <table style="width:100%;">
                <tr>
                    <td colspan="2" style="text-align: center">
                        <asp:Label ID="Label2" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RadioButton ID="RadioButton1" runat="server" 
                             Text="Are You Sure" />
                    </td>
                    <td>
                        <asp:Button ID="Button3" runat="server" onclick="Button3_Click" 
                            style="width: 41px" Text="Vote" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
                
        <asp:Panel ID="Phase3" runat="server">
        <table style="width:100%;">
            <tr>
                <td>
                    []</td>
                <td>
                    &nbsp;</td>
                <td style="text-align: right">
                    []</td>
            </tr>
            <tr>
                <td>
                    #</td>
                <td style="text-align: center">
                    Thank You For Voting</td>
                <td style="text-align: right">
                    #</td>
            </tr>
            <tr>
                <td>
                    []</td>
                <td style="text-align: center">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AdminPanel.aspx">Click Here</asp:HyperLink>
                </td>
                <td style="text-align: right">
                    []</td>
            </tr>
        </table>
        </asp:Panel>

    
        

    
    </div>
    </form>
</body>
</html>
