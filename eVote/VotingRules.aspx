<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VotingRules.aspx.cs" Inherits="eVote.NewParty" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            height: 30px;
        }
        .style2
        {
            height: 27px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style1">
                Documents Require For Candidates</td>
            <td class="style1" colspan="2">
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="Doc" DataValueField="Doc">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [Doc] FROM [cRule] WHERE ([Doc] IS NOT NULL)">
                </asp:SqlDataSource>
                <asp:Button ID="Button3" runat="server" Text="Remove" onclick="Button3_Click" />
            </td>
            <td class="style1" colspan="2">
                <asp:TextBox ID="TextBox1" runat="server" placeholder="enter new document"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Add Rule" 
                    onclick="Button1_Click" />
            </td>
        </tr>
        <tr>
            <td class="style1">
                Documents Require For Voters</td>
            <td class="style1" colspan="2">
                <asp:DropDownList ID="DropDownList3" runat="server" 
                    DataSourceID="SqlDataSource2" DataTextField="Doc" DataValueField="Doc">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [Doc] FROM [vRule]"></asp:SqlDataSource>
                <asp:Button ID="Button7" runat="server" Text="Remove" onclick="Button7_Click" />
            </td>
            <td class="style1" colspan="2">
                <asp:TextBox ID="TextBox4" runat="server" placeholder="enter new document"></asp:TextBox>
                <asp:Button ID="Button8" runat="server" Text="Add Rule" 
                    onclick="Button8_Click" />
            </td>
        </tr>
        <tr>
            <td class="style2">
&nbsp;Party Names</td>
            <td class="style2" colspan="2">
                <asp:DropDownList ID="DropDownList2" runat="server" 
                    DataSourceID="SqlDataSource3" DataTextField="p_Name" DataValueField="p_Name">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [p_Name] FROM [tParty]"></asp:SqlDataSource>
                <asp:Button ID="Button4" runat="server" Text="Remove" onclick="Button4_Click" />
                <br />
                <br />
                <br />
            </td>
            <td class="style2">
                Name:
                <br />
                Logo:<br />
                <br />
            </td>
            <td class="style2">
                <asp:TextBox ID="TextBox2" runat="server" placeholder="enter party name"></asp:TextBox>
                <br />
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <br />
                <asp:Button ID="Button5" runat="server" Text="Add Party" 
                    onclick="Button5_Click" />
            </td>
        </tr>
        <tr>
            <td class="style1" rowspan="2" style="border: 1px solid #000000">
                Set Voting Date<asp:Label ID="Label2" runat="server"></asp:Label>
            </td>
            <td class="style1" style="border: 1px solid #000000">
                Start</td>
            <td class="style1" style="border: 1px solid #000000">
                <asp:TextBox ID="TextBox3" runat="server" placeholder="voting date(dd/mm/yyyy)" 
                    ></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="TextBox3" ErrorMessage="Not valid date" 
                    
                    ValidationExpression="(((0|1)[1-9]|2[1-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$" 
                    ValidationGroup="1"></asp:RegularExpressionValidator>
            </td>
            <td colspan="2" class="style1" rowspan="2" style="border: 1px solid #000000">
                <asp:Button ID="Button6" runat="server" Text="Set Voting Time" 
                    onclick="Button6_Click" Width="139px" ValidationGroup="1" />
            </td>
        </tr>
        <tr>
            <td class="style1" style="border: 1px solid #000000">
                End</td>
            <td class="style1" style="border: 1px solid #000000">
                <asp:TextBox ID="TextBox7" runat="server" placeholder="voting date(dd/mm/yyyy)"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                    ControlToValidate="TextBox7" ErrorMessage="Not valid date" 
                    
                    ValidationExpression="(((0|1)[1-9]|2[1-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$" 
                    ValidationGroup="1"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td rowspan="2" style="border: 1px solid #000000">
                Set Candidate Request Date<asp:Label ID="Label3" runat="server"></asp:Label>
            </td>
            <td style="border: 1px solid #000000">
                Start</td>
            <td style="border: 1px solid #000000">
                <asp:TextBox ID="TextBox5" runat="server" placeholder="proposal date(dd/mm/yyyy)"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="TextBox5" ErrorMessage="Not valid date" 
                    
                    ValidationExpression="(((0|1)[1-9]|2[1-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$"></asp:RegularExpressionValidator>
            </td>
            <td colspan="2" rowspan="2" style="border: 1px solid #000000">
                <asp:Button ID="Button9" runat="server" Text="Set Candidate Request Date" 
                    onclick="Button9_Click" />
            </td>
        </tr>
        <tr>
            <td style="border: 1px solid #000000">
                End</td>
            <td style="border: 1px solid #000000">
                <asp:TextBox ID="TextBox8" runat="server" placeholder="proposal date(dd/mm/yyyy)"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                    ControlToValidate="TextBox8" ErrorMessage="Not valid date" 
                    
                    ValidationExpression="(((0|1)[1-9]|2[1-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td rowspan="2" style="border: 1px solid #000000">
                Set Voter Form Request Date<asp:Label ID="Label4" runat="server"></asp:Label>
            </td>
            <td style="border: 1px solid #000000">
                Start</td>
            <td style="border: 1px solid #000000">
                <asp:TextBox ID="TextBox6" runat="server" placeholder="form request date(dd/mm/yyyy)"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="TextBox6" ErrorMessage="Not valid date" 
                    
                    ValidationExpression="(((0|1)[1-9]|2[1-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$"></asp:RegularExpressionValidator>
            </td>
            <td colspan="2" rowspan="2" style="border: 1px solid #000000">
                <asp:Button ID="Button10" runat="server" Text="Set Voter Request Date" 
                    onclick="Button10_Click" />
            </td>
        </tr>
        <tr>
            <td style="border: 1px solid #000000">
                End</td>
            <td style="border: 1px solid #000000">
                <asp:TextBox ID="TextBox9" runat="server" placeholder="form request date(dd/mm/yyyy)"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                    ControlToValidate="TextBox9" ErrorMessage="Not valid date" 
                    
                    ValidationExpression="(((0|1)[1-9]|2[1-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td colspan="5" style="border: 1px solid #000000; text-align: center">
                <asp:Button ID="Button11" runat="server" Text="Reset Vote Perimeters" 
                    onclick="Button11_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="5" style="text-align: center">
                <asp:Label ID="Label1" runat="server"></asp:Label>
                <asp:Timer ID="Timer1" runat="server" Enabled="False" Interval="3000" 
                    ontick="Timer1_Tick1">
                </asp:Timer>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
    </table>
</asp:Content>
