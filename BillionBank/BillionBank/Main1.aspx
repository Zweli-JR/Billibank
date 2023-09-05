<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main1.aspx.cs" Inherits="BillionBank.Main1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 175px;
        }
        .auto-style5 {
            width: 153px;
        }
        .auto-style6 {
            width: 121px;
        }
        .auto-style7 {
            text-align: right;
        }
        .auto-style8 {
            width: 180px;
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
                    <td class="auto-style8">
                        <asp:HyperLink ID="lnkAcc" runat="server" CssClass="nav-links" NavigateUrl="~/Accounts.aspx">My Accounts</asp:HyperLink>
                    </td>
                    <td class="auto-style5">
                        <asp:HyperLink ID="lnkTransfer" runat="server" CssClass="nav-links">Transfer</asp:HyperLink>
                    </td>
                    <td class="auto-style7">
                        <asp:Button ID="Button1" runat="server" Text="Log Out" CssClass="buttons" />
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
                <asp:Label ID="LblName" runat="server" Text="Label Name" CssClass="name"></asp:Label>
            </div>
            <br />
            <asp:Label ID="LblAccounts" runat="server" Text="Most Used Accounts" CssClass="heading" Font-Bold="True"></asp:Label>
            <div class="acc-container">  
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="accNo" OnRowCommand="GridView1_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="accName" HeaderText="accName" SortExpression="accName"></asp:BoundField>
                        <asp:BoundField DataField="accBalance" HeaderText="accBalance" SortExpression="accBalance"></asp:BoundField>
                        <asp:BoundField DataField="accType" HeaderText="accType" SortExpression="accType"></asp:BoundField>
                        <asp:BoundField DataField="accNo" HeaderText="accNo" ReadOnly="True" InsertVisible="False" SortExpression="accNo"></asp:BoundField>
                        <asp:ButtonField Text="View"></asp:ButtonField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:BilliBankConnectionString %>' DeleteCommand="DELETE FROM [accounts] WHERE [accNo] = @accNo" InsertCommand="INSERT INTO [accounts] ([accName], [accBalance], [accType]) VALUES (@accName, @accBalance, @accType)" SelectCommand="SELECT [accName], [accBalance], [accType], [accNo] FROM [accounts] WHERE ([accOwner] = @accOwner) ORDER BY [useCount] DESC, [accBalance]" UpdateCommand="UPDATE [accounts] SET [accName] = @accName, [accBalance] = @accBalance, [accType] = @accType WHERE [accNo] = @accNo">
                    <DeleteParameters>
                        <asp:Parameter Name="accNo" Type="Int64"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="accName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="accBalance" Type="Double"></asp:Parameter>
                        <asp:Parameter Name="accType" Type="String"></asp:Parameter>
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter SessionField="User" Name="accOwner" Type="String"></asp:SessionParameter>
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="accName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="accBalance" Type="Double"></asp:Parameter>
                        <asp:Parameter Name="accType" Type="String"></asp:Parameter>
                        <asp:Parameter Name="accNo" Type="Int64"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
    </form>
</body>
</html>
