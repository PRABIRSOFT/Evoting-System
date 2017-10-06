<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="cProfile.aspx.cs" Inherits="eVote.cProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<table style="width:100%;">
        <tr>
            <td>
                Candidate ID</td>
            <td>
                <asp:TextBox ID="eID" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="Button3" runat="server" Text="Load" onclick="Button3_Click" />
            </td>
            <td>
                Photo</td>
            <td rowspan="2" style="text-align: center">
                <asp:Image ID="Image1" runat="server" Height="48px" style="text-align: center" 
                    Width="64px" AlternateText="No Image" />
                <br />
                <asp:FileUpload ID="ePhoto" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                Name<br />
            </td>
            <td colspan="2">
                <asp:TextBox ID="eName" runat="server"></asp:TextBox>
                <br />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Father&#39;s Name</td>
            <td class="style1" colspan="2">
                <asp:TextBox ID="eFname" runat="server"></asp:TextBox>
            </td>
            <td class="style1">
                Date of birth</td>
            <td class="style1">
                <asp:TextBox ID="eDob" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Sex</td>
            <td colspan="2">
                <asp:TextBox ID="eSex" runat="server"></asp:TextBox>
            </td>
            <td>
                Candidate Details</td>
            <td>
                <asp:TextBox ID="eDtl" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Address</td>
            <td colspan="2">
                <asp:TextBox ID="eAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td>
                Party</td>
            <td>
                <asp:DropDownList ID="eParty" runat="server" DataSourceID="SqlDataSource2" 
                    DataTextField="p_Name" DataValueField="p_Name">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [p_Name] FROM [tParty]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Edit Profile" 
                    onclick="Button1_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="5" style="text-align: center">
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="5" style="text-align: left" align="center">
            <div align="center">
                Voter Details<br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="e_Name" HeaderText="Name" SortExpression="e_Name" />
                        <asp:BoundField DataField="e_FName" HeaderText="Father's Name" 
                            SortExpression="e_FName" />
                        <asp:BoundField DataField="e_Sex" HeaderText="Sex" SortExpression="e_Sex" />
                        <asp:BoundField DataField="e_Address" HeaderText="Address" 
                            SortExpression="e_Address" />
                        <asp:TemplateField HeaderText="Photo" SortExpression="e_Photo">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("e_Photo") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image2" runat="server" AlternateText="No Image" Height="64px" 
                                    ImageUrl='<%# Bind("e_Photo") %>' Width="48px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    
                    
                    SelectCommand="SELECT e_Name, e_FName, e_Sex, e_Address, e_Photo FROM Voter WHERE (e_Type NOT LIKE '%' + @e_Type + '%') AND (e_Type NOT LIKE 'D')">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="A" Name="e_Type" QueryStringField="A" 
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
