<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewAcc.aspx.cs" Inherits="BillionBank.NewAcc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="MainStyl.css"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">
            <table class="auto-style1" style="width:100%">
                <tr>
                    <td class="auto-style2">
                        <asp:Image ID="logo" runat="server" ImageUrl="~/logo.PNG" Width="225px"/>
                    </td>
                    <td class="auto-style3">
                        <asp:HyperLink ID="lkHome" runat="server" CssClass="nav-links">Home</asp:HyperLink>
                    </td>
                    <td class="auto-style4">
                        <asp:HyperLink ID="lkMyAcc" runat="server" CssClass="nav-links">My Accounts</asp:HyperLink>
                    </td>
                    <td class="auto-style6">
                        <asp:HyperLink ID="lnkHome" runat="server" CssClass="nav-links">Transfer</asp:HyperLink>
                    </td>
                    <td class="auto-style5">
                        <asp:Button ID="Button1" runat="server" Text="Log Out" CssClass="buttons" OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <br />
        <br />
        <br />
        
    </form>
</body>
</html>
