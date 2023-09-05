<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BillionBank.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="LoginStyle.css"/>
    <title>Login</title>
    <style type="text/css">

        .auto-style9 {
            width: 380px;
            left: 50%;
            top: 50%;
        }

        .auto-style10 {
            width: 100%;
        }
        .auto-style11 {
            text-align: right;
            width: 75px;
        }
        .auto-style12 {
            text-align: left;
        }
        .auto-style13 {
            text-align: left;
            width: 198px;
        }
        .auto-style15 {
            text-align: left;
            width: 1px;
        }
        .auto-style16 {
            text-align: right;
            width: 135px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="wrapper" align="center">
            <div id="cont" runat="server" class="auto-style9">

                <asp:Image ID="Image1" runat="server" Height="32px" ImageUrl="logo.PNG" Width="110px" />
                <br />

                <asp:Label ID="lblSignIn" runat="server" Font-Bold="False" Font-Names="Malgun Gothic" Font-Size="X-Large" Text="Login"></asp:Label>
                <br />
                <br />
                <asp:Label ID="lblNoAcc" runat="server" Font-Names="Malgun Gothic" Font-Size="Small" Text="Don't have an account yet?"></asp:Label>
                <br />
                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="links" NavigateUrl="~/SignUp.aspx" Font-Size="Small">Sign Up</asp:HyperLink>
                <br />
                <br />

                <table class="auto-style10">
                    <tr>
                        <td class="auto-style11">
                            <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                        </td>
                        <td class="auto-style13" colspan="2">
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="txtboxes" TextMode="Email"></asp:TextBox>
                        </td>
                        <td class="auto-style12">
                        <asp:CustomValidator ID="EmailValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="EmailValidator" OnServerValidate="EmailValidator_ServerValidate" ForeColor="#CC0000" ValidateEmptyText="True"></asp:CustomValidator>
                        </td>
                    </tr
                    <tr>
                        <td class="auto-style11">
                            <asp:Label ID="lblPsswd" runat="server" Text="Password"></asp:Label>
                        </td>
                        <td class="auto-style13" colspan="2">
                            <asp:TextBox ID="txtPsswd" runat="server" CssClass="txtboxes" TextMode="Password"></asp:TextBox>
                        </td>
                        <td class="auto-style12">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style11">&nbsp;</td>
                        <td class="auto-style13" colspan="2">
                            <asp:Label ID="errorMsg" runat="server" Text=" " Font-Size="Small" ForeColor="#CC0000"></asp:Label>
                        </td>
                        <td class="auto-style12">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style11">&nbsp;</td>
                        <td class="auto-style15">
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Login" Width="65px" CssClass="buttons" />
                        </td>
                        <td class="auto-style16">
                <asp:HyperLink ID="ForgotPswd" runat="server" CssClass="links" NavigateUrl="~/ForgotPassword.aspx" Font-Size="Small">Forgot password?</asp:HyperLink>
                        </td>
                        <td class="auto-style12">&nbsp;</td>
                    </tr>
                </table>

                <br />

            </div>
        </div>
    </form>
</body>
</html>
