<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pay.aspx.cs" Inherits="BillionBank.Pay" %>

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
        .auto-style13 {
            width: 83px;
        }
        .auto-style14 {
            width: 161px;
            height: 67px;
        }
        .auto-style15 {
            width: 83px;
            height: 67px;
        }
        .auto-style16 {
            width: 85px;
            height: 67px;
        }
        .auto-style17 {
            width: 161px;
            height: 62px;
        }
        .auto-style18 {
            width: 83px;
            height: 62px;
        }
        .auto-style19 {
            width: 85px;
            height: 62px;
            text-align: left;
        }
        .auto-style20 {
            width: 161px;
        }
        .auto-style21 {
            width: 85px;
            text-align: left;
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
                        <asp:HyperLink ID="lnkTransfer0" runat="server" CssClass="nav-links underlined" NavigateUrl="~/Pay.aspx">Pay</asp:HyperLink>
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
                <asp:Label ID="Lbltop" runat="server" CssClass="heading" Text="Pay other Billion Bank users"></asp:Label>
                <br />
                <br />
                <table id="table1" class="auto-style7">
                    <tr>
                        <td class="auto-style14">
                            <asp:Label ID="LblFrom" runat="server" Text="From"></asp:Label>
                        </td>
                        <td class="auto-style15">
                            <asp:DropDownList ID="DrpDwnFrom" runat="server" CssClass="txtboxes-main" DataSourceID="SqlDataSource2" DataTextField="accName" DataValueField="accName">
                            </asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:BilliBankConnString %>' SelectCommand="SELECT [accName], [accBalance], [useCount] FROM [accounts] WHERE ([accOwner] = @accOwner) ORDER BY [useCount] DESC, [accBalance] DESC">
                                <SelectParameters>
                                    <asp:SessionParameter SessionField="User" Name="accOwner" Type="String"></asp:SessionParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td class="auto-style16"></td>
                    </tr>
                    <tr>
                        <td class="auto-style17">
                            <asp:Label ID="LblTo" runat="server" Text="To"></asp:Label>
                        </td>
                        <td class="auto-style18">
                            <asp:TextBox ID="TxtAccNo" runat="server" CssClass="txtboxes"></asp:TextBox>
                        </td>
                        <td class="auto-style19">
                        <asp:CustomValidator ID="ToValidator" runat="server" ControlToValidate="TxtAccNo" OnServerValidate="ToValidator_ServerValidate" ForeColor="#CC0000" ValidateEmptyText="True"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style20">
                            <asp:Label ID="LblAmt" runat="server" Text="Amount"></asp:Label>
                        </td>
                        <td class="auto-style13">
                            <asp:TextBox ID="TxtAmt" runat="server" CssClass="txtboxes" TextMode="Number" Step="any"></asp:TextBox>
                        </td>
                        <td class="auto-style21">
                        <asp:CustomValidator ID="AmtValidator" runat="server" ControlToValidate="TxtAmt" OnServerValidate="AmtValidator_ServerValidate" ForeColor="#CC0000" ValidateEmptyText="True"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style20">
                            <asp:Label ID="LblRef" runat="server" Text="Your Reference"></asp:Label>
                        </td>
                        <td class="auto-style13">
                            <asp:TextBox ID="TxtRef" runat="server" CssClass="txtboxes"></asp:TextBox>
                        </td>
                        <td class="auto-style21">
                        <asp:CustomValidator ID="RefValidator" runat="server" ControlToValidate="TxtRef" OnServerValidate="RefValidator_ServerValidate" ForeColor="#CC0000" ValidateEmptyText="True"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style20">
                            <asp:Label ID="LblRecepRef" runat="server" Text="Recepient Reference"></asp:Label>
                        </td>
                        <td class="auto-style13">
                            <asp:TextBox ID="TxtRepRef" runat="server" CssClass="txtboxes"></asp:TextBox>
                        </td>
                        <td class="auto-style21">
                        <asp:CustomValidator ID="RepRefValidator" runat="server" ControlToValidate="TxtRepRef" OnServerValidate="RepRefValidator_ServerValidate" ForeColor="#CC0000" ValidateEmptyText="True"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style20">&nbsp;</td>
                        <td class="auto-style13">
                            <asp:Label ID="errMsg" runat="server" Font-Size="Small" ForeColor="#CC0000" Text=" "></asp:Label>
                        </td>
                        <td class="auto-style6">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style20">&nbsp;</td>
                        <td class="auto-style13">
                            <asp:Button ID="BtnPay" runat="server" CssClass="buttons" OnClick="Button2_Click" Text="Pay" />
                        </td>
                        <td class="auto-style6">&nbsp;</td>
                    </tr>
                </table>
            </div>
            <br />
            <br />
            <asp:Label ID="LblRecnts" runat="server" CssClass="heading" Font-Bold="True" Text="Recent Payments"></asp:Label>
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
                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:BilliBankConnString %>' SelectCommand="SELECT * FROM [transactions] WHERE (([transactionOwner] = @transactionOwner) AND ([transfers] = @transfers)) ORDER BY [transactionTime] DESC">
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
