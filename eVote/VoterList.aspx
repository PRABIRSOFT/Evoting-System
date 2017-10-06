<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VoterList.aspx.cs" Inherits="eVote.VoterList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
        <tr>
            <td>
                Enter Name :
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" ontextchanged="TextBox1_TextChanged"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Search Name" 
                    onclick="Button1_Click" />
            </td>
            <td>
                Voter ID :
            </td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" Enabled="False"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="Button2" runat="server" Text="Delete" onclick="Button2_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="6" style="text-align: center"><div align="center">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="e_ID" 
                    DataSourceID="SqlDataSource1" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="e_ID" HeaderText="ID" ReadOnly="True" 
                            SortExpression="e_ID" />
                        <asp:BoundField DataField="e_Name" HeaderText="Name" 
                            SortExpression="e_Name" />
                        <asp:BoundField DataField="e_FName" HeaderText="Father's Name" 
                            SortExpression="e_FName" />
                        <asp:BoundField DataField="e_Sex" HeaderText="Sex" SortExpression="e_Sex" />
                        <asp:BoundField DataField="e_DOB" HeaderText="Date of Birth" 
                            SortExpression="e_DOB" />
                        <asp:BoundField DataField="e_Address" HeaderText="Address" 
                            SortExpression="e_Address" />
                        <asp:TemplateField HeaderText="Photo" SortExpression="e_Photo">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("e_Photo") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" AlternateText="No Photo" Height="64px" 
                                    ImageUrl='<%# Eval("e_Photo") %>' Width="48px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="e_Email" HeaderText="Email" 
                            SortExpression="e_Email" />
                        <asp:BoundField DataField="e_Type" HeaderText="Type" 
                            SortExpression="e_Type" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    
                    
                    SelectCommand="SELECT e_ID, e_Name, e_FName, e_Sex, e_DOB, e_Address, e_Photo, e_Email, e_Type FROM Voter WHERE (e_Type NOT LIKE '%' + @e_Type + '%') AND (e_Name LIKE '%' + @e_Name + '%') AND (e_Type NOT LIKE 'D')">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Admin" Name="e_Type" Type="String" />
                        <asp:ControlParameter ControlID="TextBox1" Name="e_Name" PropertyName="Text" 
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource></div>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td colspan="4">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
