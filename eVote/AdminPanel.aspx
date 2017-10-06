<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="eVote.AdminPanel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
        <tr>
            <td>
                <asp:HyperLink ID="HyperLink2" runat="server" 
                    NavigateUrl="~/VoterApproval.aspx">Register New Voter</asp:HyperLink>
            </td>
            <td>
                <asp:HyperLink ID="HyperLink3" runat="server" 
                    NavigateUrl="~/CandidateApproval.aspx">Register New Candidate</asp:HyperLink>
            </td>
            <td>
                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/VotingRules.aspx">Set Voting Rules</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/vProfile.aspx">Edit Voters</asp:HyperLink>
            </td>
            <td>
                <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/cProfile.aspx">Edit Candidates</asp:HyperLink>
            </td>
            <td>
                <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/Result.aspx">Publish Result</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="~/VoterList.aspx">Edit Voter List</asp:HyperLink>
            </td>
            <td>
                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Notice.aspx">Create Notice</asp:HyperLink>
            </td>
            <td>
                <asp:Button ID="Button6" runat="server" Text="Logout" onclick="Button6_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
