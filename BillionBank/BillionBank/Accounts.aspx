
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Accounts.aspx.cs" Inherits="BillionBank.Accounts" %>

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
         .auto-style3{
             text-align:right;
             width:50%;
         }
         .auto-style4{
             text-align:left;
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
        .auto-style8{
            background-color: dodgerblue;
            border: none;
            border-radius: 10px;
            color: white;
            margin-right: 15px;
            cursor: pointer;
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
                        <asp:HyperLink ID="lnkAcc" runat="server" CssClass="nav-links underlined" NavigateUrl="~/Accounts.aspx">My Accounts</asp:HyperLink>
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
            <div align="center">

                <asp:Table ID="Table2" runat="server" CssClass="auto-style1" Visible="False">
                    <asp:TableRow>
                        <asp:TableCell CssClass="auto-style3">
                            <asp:Label ID="Label4" runat="server" Text="Account Name:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell CssClass="auto-style4">
                            <asp:TextBox ID="TxtAccName" runat="server" CssClass="txtboxes"></asp:TextBox>
                            
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell CssClass="auto-style3">
                            <asp:Label ID="Label5" runat="server" Text="Account Type:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell CssClass="auto-style4">
                            <asp:DropDownList ID="DrpDwnAccName" runat="server" CssClass="txtboxes-main">
                                <asp:ListItem>Savings</asp:ListItem>
                                <asp:ListItem>Cheque</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>&nbsp;</asp:TableCell>
                        <asp:TableCell CssClass="auto-style4">
                            <asp:Label ID="errMsg" runat="server" Font-Size="Small" Text=" "></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>&nbsp;</asp:TableCell>
                        <asp:TableCell CssClass="auto-style4">
                            <asp:Button ID="BtnCreate" runat="server" CssClass="buttons" Text="Create" OnClick="BtnCreate_Click" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

            </div>
            <br />
            <table id="table1" class="auto-style1">
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" CssClass="heading" Font-Bold="True" Text="Active Accounts"></asp:Label>
                    </td>
                    <td class="auto-style7">
                        <asp:Button ID="BtnCreateAcc" runat="server" CssClass="auto-style8" Height="34px" Text="Create Account" Width="127px" OnClick="BtnCreateAcc_Click" />
                    </td>
                </tr>
            </table>
            <br />
        <div class="acc-container">
            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" DataSourceID="SqlDataSource1">
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
                                    <asp:Label ID="LblAccBalance" CssClass="balance" runat="server"><%# ((double)DataBinder.Eval(Container.DataItem, "accBalance")).ToString("C") %></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <div align="center">
                            <hr class="line" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:BilliBankConnString %>' SelectCommand="SELECT * FROM [accounts] WHERE ([accOwner] = @accOwner) ORDER BY [useCount] DESC, [accBalance] DESC">
                <SelectParameters>
                    <asp:SessionParameter SessionField="User" Name="accOwner" Type="String"></asp:SessionParameter>
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
            
        </div>
    </form>
</body>
</html>
