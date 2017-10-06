<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CandidateRequest.aspx.cs" Inherits="eVote.NewCandidate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script language="javascript" type="text/javascript">
    function CallPrint() {
        window.open('printDoc.aspx', 'PrintDoc', 'letf=0,top=0,width=640,height=480');
    }
</script>
    <table style="width:100%;">
        <tr>
            <td>
                Candidate&#39;s Ecectrol&#39;s ID</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" placeholder="enter Voter ID"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Select Party Name</td>
            <td class="style1">
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="p_Name" 
                    DataValueField="p_Name">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [p_Name] FROM [tParty]"></asp:SqlDataSource>
            </td>
            <td class="style1">
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Propose" 
                    onclick="Button1_Click" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center">
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center">
                <asp:button id="BtnPrint" runat="server" text="Print" 
        onclientclick="javascript:CallPrint();" xmlns:asp="#unknown" 
        style="text-align: center"/></td>
        </tr>
        <tr>
            <td colspan="3">
                <em>*Please submit the below documents as hardcopy for candidate confirmation</em></td>
        </tr>
        <tr>
            <td colspan="3" align="center" style="text-align: center">
            <div align="center">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource2">
                    <Columns>
                        <asp:BoundField DataField="Doc" HeaderText="Documents" 
                            SortExpression="Doc" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [Doc] FROM [cRule] WHERE ([Doc] IS NOT NULL)"></asp:SqlDataSource></div>
            </td>
        </tr>
    </table>
</asp:Content>
