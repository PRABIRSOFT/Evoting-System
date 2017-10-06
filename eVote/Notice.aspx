<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Notice.aspx.cs" Inherits="eVote.Notice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%;">
    <tr>
        <td>
            Notice No.</td>
        <td>
            <asp:TextBox ID="TextBox1" runat="server" placeholder="enter notice ID"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBox1" ErrorMessage="Notice No. cannot be empty"></asp:RequiredFieldValidator>
        </td>
        <td>
            <asp:DropDownList ID="DropDownList1" runat="server" 
                DataSourceID="SqlDataSource1" DataTextField="n_ID" DataValueField="n_ID">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [n_ID] FROM [tNotice]"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td>
            Contents</td>
        <td>
            <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" placeholder="enter notice body"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="TextBox2" ErrorMessage="Contents cannot be empty"></asp:RequiredFieldValidator>
        </td>
        <td>
            <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                Text="Delete Notice" CausesValidation="False" />
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td colspan="2">
            <asp:Button ID="Button1" runat="server" Text="Post" onclick="Button1_Click" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="4" style="text-align: center">
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <asp:Timer ID="Timer1" runat="server" Enabled="False" Interval="3000" 
                ontick="Timer1_Tick">
            </asp:Timer>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        </td>
    </tr>
</table>
</asp:Content>
