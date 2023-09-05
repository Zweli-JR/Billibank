<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MoreDetails.aspx.cs" Inherits="BillionBank.MoreDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="MainStyl.css"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 175px;
        }
        .auto-style5 {
            width: 103px;
        }
        .auto-style6 {
            width: 85px;
        }
        .auto-style7 {
            text-align: right;
        }
        .auto-style9 {
            text-align: right;
            width: 87px;
            background-color:rgb(17, 53, 78)
        }
        .auto-style10 {
            width: 157px;
        }
        .auto-style11 {
            width: 207px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">
            
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Image ID="logo" runat="server" ImageUrl="~/logo.PNG" Width="225px"/>
                    </td>
                    <td class="auto-style6">
                        <asp:HyperLink ID="lnkHome" runat="server" CssClass="nav-links" NavigateUrl="~/Main.aspx">Home</asp:HyperLink>
                    </td>
                    <td class="auto-style10">
                        <asp:HyperLink ID="lnkAcc" runat="server" CssClass="nav-links" NavigateUrl="~/Accounts.aspx">My Accounts</asp:HyperLink>
                    </td>
                    <td class="auto-style5">
                        <asp:HyperLink ID="lnkTransfer" runat="server" CssClass="nav-links" NavigateUrl="~/Transfer.aspx">Transfer</asp:HyperLink>
                    </td>
                    <td class="auto-style11">
                        <asp:HyperLink ID="lnkTransfer0" runat="server" CssClass="nav-links" NavigateUrl="~/Pay.aspx">Pay</asp:HyperLink>
                    </td>
                    <td class="auto-style7">
                        <asp:HyperLink ID="HyperLink1" runat="server" CssClass="nav-links" NavigateUrl="~/Profile.aspx">Profile</asp:HyperLink>
                    </td>
                    <td class="auto-style9">
                        <asp:Button ID="btnLogout" runat="server" Text="Log Out" CssClass="btn-logout" OnClick="btnLogout_Click" />
                    </td>
                </tr>
            </table>
            
        </div>
        <br />
        <br />
        <br />
        <br />
        <div class="wrapper">
             <asp:Label ID="LblHeading" runat="server" CssClass="acc" Text="Heading" Font-Bold="True"></asp:Label>
                    <br />
                    <asp:Label ID="LblAccNo" runat="server" Text="accNo"></asp:Label>&nbsp;- <asp:Label ID="LblAccType" runat="server" Text="accType"></asp:Label>
                    <br />
                    <div class="bal">
                        <asp:Label ID="LblAvlBal" runat="server" Text="Available Balance:"></asp:Label>
                        <br />
                        <asp:Label ID="LblBal" runat="server" Text="balance" Font-Bold="False" Font-Size="Larger"></asp:Label>
                    </div>
                    <asp:Label ID="LblTransactions" runat="server" Text="Transactions" CssClass="trans" Font-Bold="True"></asp:Label>
                    <div class="acc-container">
                        <br />
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <div class="main-acc">
                                    <asp:Label ID="LblFrom" CssClass="balance" runat="server">R<%# DataBinder.Eval(Container.DataItem, "amt")  %> </asp:Label>
                                    <br />
                                    <asp:Label ID="LblTo" CssClass="balance" runat="server">From: <%# DataBinder.Eval(Container.DataItem, "sender")  %></asp:Label>
                                    <br />
                                    <asp:Label ID="LblAmt" CssClass="balance" runat="server">To: <%# DataBinder.Eval(Container.DataItem, "recepient")  %></asp:Label>
                                    <div align="center">
                                        <hr class="line" />
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:BilliBankConnString %>' SelectCommand="SELECT * FROM [transactions] WHERE (([recepient] = @recepient) OR ([sender] = @sender))">
                            <SelectParameters>
                                <asp:SessionParameter SessionField="accNumber" Name="recepient" Type="Int64"></asp:SessionParameter>
                                <asp:SessionParameter SessionField="accNumber" Name="sender" Type="Int64"></asp:SessionParameter>


                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <br />
                    <asp:Label ID="LblAccCreation0" runat="server" Text="This account was created on " ForeColor="#666666"></asp:Label>
                    <asp:Label ID="LblAccCreation" runat="server" Text="date" ForeColor="#666666"></asp:Label>
        </div>
    </form>
</body>
</html>
