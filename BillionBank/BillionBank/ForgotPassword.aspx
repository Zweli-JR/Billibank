<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="RecipeRate_project3_.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="LoginStyle.css"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: right;
            width: 109px;
        }
        .auto-style3 {
            text-align: right;
            height: 23px;
            width: 109px;
        }
        .auto-style5 {
            text-align: left;
            width: 60px;
        }
        .auto-style6 {
            height: 23px;
            text-align: left;
            width: 60px;
        }
        .auto-style7 {
            text-align: center;
        }
        .auto-style8 {
            text-align: right;
            height: 26px;
            width: 109px;
        }
        .auto-style9 {
            text-align: left;
            height: 26px;
            width: 60px;
        }
        .auto-style11 {
            height: 23px;
            text-align: left;
            width: 359px;
        }
        .auto-style12 {
            text-align: left;
            width: 359px;
        }
        .auto-style13 {
            text-align: left;
            height: 26px;
            width: 359px;
        }
        .auto-style14 {
            background: rgb(35,47,57);
            color: #fff;
            font-family: 'Malgun Gothic';
            padding: 30px 15px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            border-radius: 29px;
            width: 544px;
        }
        .auto-style15 {
            text-align: center;
            width: 60px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style14" align="center">
            <br />
            <asp:Image ID="Image1" runat="server" Height="32px" ImageUrl="logo.PNG" Width="110px" />
                <br />

                <asp:Label ID="lblReset" runat="server" Font-Bold="False" Font-Names="Malgun Gothic" Font-Size="X-Large" Text="Reset Your Password"></asp:Label>
                <br />
                <br />
            <table id="table1" class="auto-style1">
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                    </td>
                    <td class="auto-style11">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="txtboxes" TextMode="Email"></asp:TextBox>
                    </td>
                    <td class="auto-style6"></td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style12">
                        <asp:Label ID="errMsg" runat="server" Font-Size="Small" ForeColor="#CC0000" Text=" "></asp:Label>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style12">
                        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Next" CssClass="buttons" />
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style12">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblSecQ" runat="server" Text="Security Question" Visible="False"></asp:Label>
                    </td>
                    <td class="auto-style12">
                        &nbsp;
                        <asp:Label ID="lblQustion" runat="server" Text="question" Visible="False"></asp:Label>
                    </td>
                    <td class="auto-style15">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8">
                        <asp:Label ID="lblAnswer" runat="server" Text="Answer" Visible="False"></asp:Label>
                    </td>
                    <td class="auto-style13">
                        <asp:TextBox ID="txtAnswer" runat="server" Visible="False" CssClass="txtboxes"></asp:TextBox>
                    </td>
                    <td class="auto-style9"></td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style12">
                        <asp:Label ID="errMsg0" runat="server" Font-Size="Small" ForeColor="#CC0000" Text=" "></asp:Label>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style12">
                        <asp:Button ID="btnSubmit2" runat="server" OnClick="btnSubmit2_Click" Text="Next" Visible="False" CssClass="buttons" />
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style12">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7" colspan="3">
                        <asp:Label ID="lblRemember" runat="server" Text="make it something you'll remeber this time?" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="lblNewPsswd" runat="server" Text="New Password" Visible="False"></asp:Label>
                    </td>
                    <td class="auto-style11">
                        <asp:TextBox ID="txtPsswd" runat="server" Visible="False" CssClass="txtboxes" TextMode="Password"></asp:TextBox>
                    </td>
                    <td class="auto-style6"></td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style12">
                        <asp:Label ID="errMsg1" runat="server" Font-Size="Small" ForeColor="#CC0000" Text=" "></asp:Label>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style12">
                        <asp:Button ID="btnReset" runat="server" OnClick="btnReset_Click" Text="Reset" Visible="False" CssClass="buttons" />
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                </tr>
            </table>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx" CssClass="links" Visible="False">Login?</asp:HyperLink>
                <br />
        </div>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
