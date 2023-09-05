<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="BillionBank.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="SignUpStyle.css"/>
    <title>Sign Up</title>
     <style type="text/css">
         .auto-style10 {
             width: 100%;
         }
         .auto-style11 {
             left: 48%;
             top: 50%;
             width: 499px;
         }
         .auto-style13 {
             text-align: left;
         }
         .auto-style14 {
             text-align: center;
             width: 243px;
         }
         .auto-style15 {
             width: 137px;
         }
         .auto-style16 {
             text-align: left;
             width: 243px;
         }
         .auto-style18 {
             width: 137px;
             height: 26px;
             text-align: right;
         }
         .auto-style19 {
             text-align: left;
             width: 243px;
             height: 26px;
         }
         .auto-style20 {
             text-align: left;
             height: 26px;
         }
         .auto-style23 {
             text-align: right;
             width: 137px;
         }
         </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="container" align="center" class="auto-style11">
            <asp:Image ID="Image1" runat="server" Height="32px" ImageUrl="logo.PNG" Width="110px" />
            <br />
            <br />
            <asp:Label ID="lblSignUp" runat="server" Font-Bold="False" Font-Names="Malgun Gothic" Font-Size="X-Large" Text="Sign Up"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblHaveAcc" runat="server" Font-Names="Malgun Gothic" Font-Size="Small" Text="Already have an account yet?"></asp:Label>
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx" CssClass="links">Login</asp:HyperLink>
            <br />
            <br />

            <table class="auto-style10">
                <tr>
                    <td class="auto-style18">
                        <asp:Label ID="lblName0" runat="server" Text="ID Number"></asp:Label>
                    </td>
                    <td class="auto-style19" id="txtID">
                        <asp:TextBox ID="txtID" runat="server" CssClass="txtboxes" TextMode="Number"></asp:TextBox>
                    </td>
                    <td class="auto-style20">
                        <asp:CustomValidator ID="IDValidator" runat="server" ControlToValidate="txtID" ErrorMessage="IDValidator" OnServerValidate="IDValidator_ServerValidate" ForeColor="#CC0000" ValidateEmptyText="True"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">
                        <asp:Label ID="lblName" runat="server" Text="Fullname"></asp:Label>
                    </td>
                    <td class="auto-style19">
                        <asp:TextBox ID="txtName" runat="server" CssClass="txtboxes"></asp:TextBox>
                    </td>
                    <td class="auto-style20">
                        <asp:CustomValidator ID="NameValidator" runat="server" ControlToValidate="txtName" ErrorMessage="NameValidator" OnServerValidate="NameValidator_ServerValidate" ForeColor="#CC0000" ValidateEmptyText="True"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style23">
                        <asp:Label ID="Label7" runat="server" Text="Email"></asp:Label>
                    </td>
                    <td class="auto-style16">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="txtboxes" TextMode="Email"></asp:TextBox>
                    </td>
                    <td class="auto-style13">
                        <asp:CustomValidator ID="EmailValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="EmailValidator" OnServerValidate="EmailValidator_ServerValidate" ForeColor="#CC0000" ValidateEmptyText="True"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style23">
                        <asp:Label ID="LblAddress1" runat="server" Text="Address Line 1"></asp:Label>
                    </td>
                    <td class="auto-style16">
                        <asp:TextBox ID="txtAddress1" runat="server" CssClass="txtboxes"></asp:TextBox>
                    </td>
                    <td class="auto-style13">
                        <asp:CustomValidator ID="Address1Validator" runat="server" ControlToValidate="txtAddress1" ErrorMessage="Add1Validator" OnServerValidate="AddressValidator_ServerValidate" ForeColor="#CC0000" ValidateEmptyText="True"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style23">
                        <asp:Label ID="LblAddress2" runat="server" Text="Address Line 2"></asp:Label>
                    </td>
                    <td class="auto-style16">
                        <asp:TextBox ID="txtAddress2" runat="server" CssClass="txtboxes"></asp:TextBox>
                    </td>
                    <td class="auto-style13">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style23">
                        <asp:Label ID="LblAddress3" runat="server" Text="City"></asp:Label>
                    </td>
                    <td class="auto-style16">
                        <asp:TextBox ID="txtAddress3" runat="server" CssClass="txtboxes"></asp:TextBox>
                    </td>
                    <td class="auto-style13">
                        <asp:CustomValidator ID="CityValidator" runat="server" ControlToValidate="txtAddress3" ErrorMessage="CityValidator" OnServerValidate="CityValidator_ServerValidate" ForeColor="#CC0000" ValidateEmptyText="True"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style23">
                        <asp:Label ID="LblNumber" runat="server" Text="Contact No."></asp:Label>
                    </td>
                    <td class="auto-style16">
                        <asp:TextBox ID="txtNumber" runat="server" CssClass="txtboxes" TextMode="Number"></asp:TextBox>
                    </td>
                    <td class="auto-style13">
                        <asp:CustomValidator ID="ContactNoValidator" runat="server" ControlToValidate="txtNumber" ErrorMessage="ContactNoValidator" OnServerValidate="NumberValidator_ServerValidate" ForeColor="#CC0000" ValidateEmptyText="True"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style23">
                        <asp:Label ID="Label4" runat="server" Text="Password"></asp:Label>
                    </td>
                    <td class="auto-style16">
                        <asp:TextBox ID="txtPsswd" runat="server" CssClass="txtboxes" TextMode="Password"></asp:TextBox>
                    </td>
                    <td class="auto-style13">
                        <asp:CustomValidator ID="PsswdValidator" runat="server" ControlToValidate="txtPsswd" ErrorMessage="PsswdValidator" OnServerValidate="PsswdValidator_ServerValidate" ForeColor="#CC0000" ValidateEmptyText="True"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style15">&nbsp;</td>
                    <td class="auto-style14">
                        <asp:Label ID="Label1" runat="server" Font-Size="Small" Text="Security Question (Incase you forget your password)"></asp:Label>
                    </td>
                    <td class="auto-style13">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style23">
                        <asp:Label ID="Label5" runat="server" Text="Question"></asp:Label>
                    </td>
                    <td class="auto-style16">
                        <asp:TextBox ID="txtQuestion" runat="server" CssClass="txtboxes"></asp:TextBox>
                    </td>
                    <td class="auto-style13">
                        <asp:CustomValidator ID="QuestionValidator" runat="server" ControlToValidate="txtQuestion" ErrorMessage="QuestionValidator" OnServerValidate="QuestionValidator_ServerValidate" ForeColor="#CC0000" ValidateEmptyText="True"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style23">
                        <asp:Label ID="Label6" runat="server" Text="Answer"></asp:Label>
                    </td>
                    <td class="auto-style16">
                        <asp:TextBox ID="txtAnswer" runat="server" CssClass="txtboxes"></asp:TextBox>
                    </td>
                    <td class="auto-style13">
                        <asp:CustomValidator ID="AnswerValidator" runat="server" ControlToValidate="txtAnswer" ErrorMessage="AnswerValidator" OnServerValidate="AnswerValidator_ServerValidate" ForeColor="#CC0000" ValidateEmptyText="True"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style15">&nbsp;</td>
                    <td class="auto-style16">
                        <asp:Label ID="errMsg" runat="server" Font-Size="Small" ForeColor="#CC0000" Text=" "></asp:Label>
                    </td>
                    <td class="auto-style13">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style15">&nbsp;</td>
                    <td class="auto-style16">
                        <asp:Button ID="btnSignUp" runat="server" CssClass="buttons" Text="Sign Up" OnClick="btnNext_Click1" />
                    </td>
                    <td class="auto-style13">&nbsp;</td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
