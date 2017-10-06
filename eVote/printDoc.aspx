<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="printDoc.aspx.cs" Inherits="eVote.printDoc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>


<body>
    <script language="javascript" type="text/javascript">
        function CallPrint(strid) {
            var prtContent = document.getElementById(strid);
            var WinPrint = window.open('', 'popUpWindow', 'letf=0,top=0,width=1,height=1,toolbar=0,scrollbars=0,status=0');
            WinPrint.document.write(prtContent.innerHTML);
            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
            WinPrint.close();
            prtContent.innerHTML = strOldOne;
        }
</script>
    <form id="form1" runat="server" 
    style="width: auto; height: auto; top: auto; right: auto; bottom: auto; left: auto; clip: rect(auto, auto, auto, auto)">
    <div id ="bill">
    
        <asp:Panel ID="vPanel" runat="server">
        <table style="border: 1px solid #000000; width:100%;">
            <tr>
                <td colspan="4" style="border: 1px solid #000000">
                    <h1>
                        eVote</h1>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td style="text-align: left">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="4" style="border: 1px solid #000000; text-align: center;">
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="border: 1px solid #000000">
                    Name :<br /> <br />
                    <br />
                </td>
                <td style="border: 1px solid #000000">
                    <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True"></asp:TextBox>
                    <br />
                    <br />
                    <br />
                </td>
                <td style="border: 1px solid #000000">
                    Photo :<br />
                    <br />
                    <br />
                    <br />
                </td>
                <td style="border: 1px solid #000000;">
                    <asp:Image ID="Image1" runat="server" AlternateText="No Image" Height="64px" 
                        Width="48px" />
                </td>
            </tr>
            <tr>
                <td style="border: 1px solid #000000">
                    Fathers Name :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                <td style="border: 1px solid #000000">
                    <asp:TextBox ID="TextBox2" runat="server" ReadOnly="True"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td style="border: 1px solid #000000">
                    Email ID :</td>
                <td style="border: 1px solid #000000">
                    <asp:TextBox ID="TextBox5" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="border: 1px solid #000000">
                    Sex :</td>
                <td style="border: 1px solid #000000">
                    <asp:TextBox ID="TextBox3" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
                <td rowspan="2" style="border: 1px solid #000000">
                    Address:<br />
                    <br />
                    <br />
                </td>
                <td rowspan="2" style="border: 1px solid #000000">
                    <asp:TextBox ID="TextBox6" runat="server" ReadOnly="True" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="border: 1px solid #000000">
                    Date of Birth :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                <td style="border: 1px solid #000000">
                    <asp:TextBox ID="TextBox4" runat="server" ReadOnly="True"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
        </table>
        </asp:Panel>
    <asp:Panel ID="cPanel" runat="server">
    <table style="border: thin solid #000000; width:100%;">
        <tr>
            <td style="border: 1px solid #000000">
                Party&nbsp; Name :<br />
                <br />
            </td>
            <td style="border: 1px solid #000000">
                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                <br />
                <br />
            </td>
            <td style="border: 1px solid #000000">
                Party Logo :<br /> <br />
                <br />
            </td>
            <td style="border: 1px solid #000000">
                <asp:Image ID="Image2" runat="server" AlternateText="No Logo" Height="64px" 
                    Width="48px" />
            </td>
        </tr>
    </table>
    </asp:Panel>
    </div>
    <asp:Panel ID="pBtn" runat="server" style="text-align: center">
        <asp:button id="BtnPrint" runat="server" text="Print" 
        onclientclick="javascript:CallPrint('bill');" xmlns:asp="#unknown" 
        style="text-align: center" />
    </asp:Panel>
    
    </form>
</body>
</html>
