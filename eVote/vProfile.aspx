<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="vProfile.aspx.cs" Inherits="eVote.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            height: 26px;
        }
        .style2
        {
            height: 40px;
        }
        .style3
        {
            height: 23px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style2">
                Elector&#39;s ID</td>
            <td class="style2">
                <asp:TextBox ID="eID" runat="server"></asp:TextBox>
            </td>
            <td class="style2">
                <asp:Button ID="Button3" runat="server" Text="Load" onclick="Button3_Click" />
            </td>
            <td class="style2">
                Photo</td>
            <td rowspan="2" style="text-align: center" colspan="2">
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
                Email ID</td>
            <td class="style1">
                <asp:TextBox ID="eEmail" runat="server" Height="22px" Width="128px" 
                    ></asp:TextBox>
            </td>
            <td class="style1">
                <asp:Button ID="Button4" runat="server" onclick="Button4_Click" Text="LogOut" />
            </td>
        </tr>
        <tr>
            <td>
                Sex</td>
            <td colspan="2">
                <asp:TextBox ID="eSex" runat="server"></asp:TextBox>
            </td>
            <td>
                Password</td>
            <td colspan="2">
                <asp:TextBox ID="ePass" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Date of birth</td>
            <td colspan="2">
                <asp:TextBox ID="eDob" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td colspan="2">
                <asp:Button ID="Button1" runat="server" Text="Edit Profile" 
                    onclick="Button1_Click" />
            </td>
        </tr>
        <tr>
            <td>
                Address<br />
            </td>
            <td colspan="2">
                <asp:TextBox ID="eAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td>
                Status<br />
                </td>
            <td colspan="2">
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>Voter</asp:ListItem>
                    <asp:ListItem>Admin</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="Button2" runat="server" Text="Set Permission" 
                    onclick="Button2_Click" />
                <br />
                </td>
        </tr>
        <tr>
            <td colspan="6" style="text-align: center">
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="6" style="text-align: center" class="style3">
                <asp:HyperLink ID="HyperLink3" runat="server" 
                    NavigateUrl="~/CandidateRequest.aspx">Register as a Candidate</asp:HyperLink>
                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/cProfile.aspx">Go to candidate page</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td colspan="6" style="text-align: center">
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Vote.aspx">Vote Now</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td colspan="6" style="text-align: left" align="center">
            <div align="center">
                Candidate Details<br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="c_ID" 
                    DataSourceID="SqlDataSource1" PageSize="1">
                    <Columns>
                        <asp:BoundField DataField="c_ID" HeaderText="ID" ReadOnly="True" 
                            SortExpression="c_ID" />
                        <asp:BoundField DataField="c_Name" HeaderText="Name" 
                            SortExpression="c_Name" />
                        <asp:BoundField DataField="c_FName" HeaderText="Father's Name" 
                            SortExpression="c_FName" />
                        <asp:BoundField DataField="c_Address" HeaderText="Address" 
                            SortExpression="c_Address" />
                        <asp:BoundField DataField="c_Sex" HeaderText="Sex" SortExpression="c_Sex" />
                        <asp:TemplateField HeaderText="Dtl" SortExpression="c_Dtl">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("c_Dtl") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" ReadOnly="True" 
                                    Text='<%# Bind("c_Dtl") %>' TextMode="MultiLine"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Photo" SortExpression="c_Photo">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("c_Photo") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image2" runat="server" AlternateText="No Image" Height="64px" 
                                    ImageUrl='<%# Bind("c_Photo") %>' Width="48px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="c_Party" HeaderText="Party" 
                            SortExpression="c_Party" />
                        <asp:TemplateField HeaderText="Logo" SortExpression="c_PLogo">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("c_PLogo") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image3" runat="server" AlternateText="No Logo" Height="64px" 
                                    ImageUrl='<%# Bind("c_PLogo") %>' Width="48px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    
                    SelectCommand="SELECT [c_ID], [c_Name], [c_FName], [c_Address], [c_Sex], [c_Dtl], [c_Photo], [c_Party], [c_PLogo] FROM [Candidate]">
                </asp:SqlDataSource>
                <br />
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
