<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VoterApproval.aspx.cs" Inherits="eVote.VoterApproval" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style1
    {
        height: 189px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
        <tr>
            <td colspan="3">
                Voter Requests</td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center">
                <asp:Label ID="Label1" runat="server" style="text-align: center"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="3" class="style1">
                <div align="center">
                    <br />
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" DataKeyNames="e_Email" 
                        DataSourceID="SqlDataSource1" 
                        onselectedindexchanged="GridView1_SelectedIndexChanged1">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="e_Email" HeaderText="Email" ReadOnly="True" 
                                SortExpression="e_Email" />
                            <asp:BoundField DataField="e_Name" HeaderText="Name" 
                                SortExpression="e_Name" />
                            <asp:BoundField DataField="e_FName" HeaderText="Fathers Name" 
                                SortExpression="e_FName" />
                            <asp:TemplateField HeaderText="Address" SortExpression="e_Address">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("e_Address") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("e_Address") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="e_Sex" HeaderText="Sex" SortExpression="e_Sex" />
                            <asp:BoundField DataField="e_DOB" HeaderText="DOB" SortExpression="e_DOB" />
                            <asp:TemplateField HeaderText="Photo" SortExpression="e_Photo">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("e_Photo") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Height="64px" 
                                        ImageUrl='<%# Bind("e_Photo") %>' Width="48px" 
                                        AlternateText="No Image Found" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT [e_Email], [e_Name], [e_FName], [e_Address], [e_Sex], [e_DOB], [e_Photo] FROM [tmpVoter]">
                    </asp:SqlDataSource>
                    <br />
                </div>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Selecting User"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" Enabled="False"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Create Voter" 
                    onclick="Button1_Click" />
            </td>
            <td>
                <asp:Button ID="Button2" runat="server" Text="Delete Request" 
                    onclick="Button2_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
