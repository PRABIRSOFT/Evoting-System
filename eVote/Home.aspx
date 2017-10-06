<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="eVote.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <table style="width:100%;">
        <tr>
            <td rowspan="4" style="text-align: center">
                <asp:Image ID="Image1" runat="server" 
                    AlternateText="Admin's Photo Not Available" Height="128px" Width="96px" />
            </td>
            <td>
                Elector&#39;s ID</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" placeholder="enter your elector's ID"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox1" ErrorMessage="No EPIC ID"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Password</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" placeholder="enter your password" 
                    TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox2" ErrorMessage="No Password"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/VoterRequest.aspx">New Voter Register Here</asp:HyperLink>
            </td>
            <td colspan="2">
                <asp:Button ID="Button1" runat="server" Text="Login" onclick="Button1_Click" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td colspan="2">
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Notice Board
            </td>
            <td>
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
            <div align="center">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="n_ID" DataSourceID="SqlDataSource1" 
                    style="text-align: center">
                    <Columns>
                        <asp:BoundField DataField="n_ID" HeaderText="Notice Number" ReadOnly="True" 
                            SortExpression="n_ID" />
                        <asp:BoundField DataField="n_Date" HeaderText="Date" SortExpression="n_Date" />
                        <asp:TemplateField HeaderText="Content" SortExpression="n_Content">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("n_Content") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("n_Content") %>' 
                                    TextMode="MultiLine" ReadOnly="True"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT * FROM [tNotice]"></asp:SqlDataSource></div>
            </td>
        </tr>
    </table>
    
</asp:Content>
