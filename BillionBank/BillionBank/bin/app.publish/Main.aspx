<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="BillionBank.Main" %>

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
        .auto-style12 {
            width: 50%;
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
                        <asp:HyperLink ID="lnkHome" runat="server" CssClass="nav-links underlined" NavigateUrl="~/Main.aspx">Home</asp:HyperLink>
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
            <div align="center">
                <asp:Label ID="LblName" runat="server" Text="Label Name" CssClass="name"></asp:Label>
            </div>
        <br />
        <center>
            <div align="center" class="auto-style12">
                <asp:Label ID="lblNewbie" runat="server" Text="Welcome to BillionBank, as a welcome gift you have been credited with R100!" CssClass="name" Font-Bold="True" Font-Size="Large" ForeColor="#33CC33" Visible="False"></asp:Label>
                <br />
                <asp:Button ID="BtnGotit" runat="server" CssClass="buttons" Text="Got it" OnClick="BtnGotit_Click" Visible="False" />
            </div>
        </center>
        <div class="wrapper">
            <br />
            <asp:Label ID="LblAccounts" runat="server" Text="Most Used Accounts" CssClass="heading" Font-Bold="True"></asp:Label>
            <div class="acc-container">  
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand">
                    <ItemTemplate>
                        <div class="main-acc">
                            <table id="table1" class="auto-style1">
                                <tr>
                                    <td>
                                        <asp:Label ID="LblAccName" CssClass="acc-name" runat="server"><%# DataBinder.Eval(Container.DataItem, "accName")  %></asp:Label><asp:Label ID="LblAccType" CssClass="acc-type" runat="server" Font-Size="Medium"> - <%# DataBinder.Eval(Container.DataItem, "accNo")  %></asp:Label>
                                    </td>
                                    <td class="auto-style7" rowspan="2">
                                        <asp:Button ID="Button2" runat="server" Text="View" CssClass="buttons" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="LblAccBalance" CssClass="balance" runat="server">R<%# DataBinder.Eval(Container.DataItem, "accBalance")  %></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <div align="center">
                                <hr class="line" />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>


                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:BilliBankConnString %>' SelectCommand="SELECT TOP 3 * FROM [accounts] WHERE ([accOwner] = @accOwner) ORDER BY [useCount] DESC, [accBalance] DESC">
                    <SelectParameters>
                        <asp:SessionParameter SessionField="User" Name="accOwner" Type="String"></asp:SessionParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
            <asp:Label ID="lblTransactions" runat="server" Text="Recent Payments" CssClass="heading" Font-Bold="True"></asp:Label>
            <div class="acc-container">
                <br />
                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
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
                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:BilliBankConnString %>' SelectCommand="SELECT * FROM [transactions] WHERE (([transactionOwner] = @transactionOwner) AND ([transfers] = @transfers)) ORDER BY [transactionTime] DESC">
                    <SelectParameters>
                        <asp:SessionParameter SessionField="User" Name="transactionOwner" Type="String"></asp:SessionParameter>
                        <asp:Parameter DefaultValue="0" Name="transfers" Type="Int32"></asp:Parameter>
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
            
        </div>
    </form>
</body>
</html>
