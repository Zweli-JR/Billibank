<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="BillionBank.Profile" %>

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
            text-align: left;
        }
        .auto-style14 {
            text-align: right;
            width: 136px;
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
                        <asp:HyperLink ID="HyperLink1" runat="server" CssClass="nav-links underlined" NavigateUrl="~/Profile.aspx">Profile</asp:HyperLink>
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
             <table id="table2" class="auto-style1">
                 <tr>
                     <td>
             <asp:Label ID="LblHeading" runat="server" CssClass="acc" Text="Heading" Font-Bold="True"></asp:Label>
                         <br />
                    <asp:Label ID="LblID" runat="server" Text="ID"></asp:Label>
                         <br />
                    <asp:Label ID="LblEmail" runat="server" Text="email"></asp:Label>
                     </td>
                     <td class="auto-style7">
                         <asp:Button ID="BtnEdit" runat="server" CssClass="buttons" OnClick="BtnEdit_Click" Text="Edit" />
                     </td>
                 </tr>
             </table>
                    <br />
                    <div class="bal">
                        
                        <table id="table1" class="auto-style1">
                            <tr>
                                <td class="auto-style14">
                                    <asp:Label ID="FullName" runat="server" CssClass="bal" Font-Bold="True" Text="Fullname:"></asp:Label>
                                </td>
                                <td class="auto-style12">
                                    <asp:Label ID="lblFullname" runat="server" CssClass="balance" Text="fullname" Font-Bold="False"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style14">
                                    <asp:Label ID="PreferedName" runat="server" CssClass="bal" Font-Bold="True" Text="Prefered Name:"></asp:Label>
                                </td>
                                <td class="auto-style12">
                                    <asp:Label ID="LblPrefname" runat="server" CssClass="balance" Text="prefered name" Font-Bold="False"></asp:Label>
                                    <asp:TextBox ID="TxtName" runat="server" CssClass="txtboxes" Visible="False"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style14">
                                    <asp:Label ID="Add1" runat="server" CssClass="bal" Font-Bold="True" Text="Address  Line  1:"></asp:Label>
                                </td>
                                <td class="auto-style12">
                                    <asp:Label ID="LblAdd1" runat="server" CssClass="balance" Text="addLine1" Font-Bold="False"></asp:Label>
                                    <asp:TextBox ID="TxtAdd1" runat="server" CssClass="txtboxes" Visible="False"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style14">
                                    <asp:Label ID="Add2" runat="server" CssClass="bal" Font-Bold="True" Text="Address  Line  2:"></asp:Label>
                                </td>
                                <td class="auto-style12">
                                    <asp:Label ID="LblAdd2" runat="server" CssClass="balance" Text="addLine2" Font-Bold="False"></asp:Label>
                                    <asp:TextBox ID="TxtAdd2" runat="server" CssClass="txtboxes" Visible="False"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style14">
                                    <asp:Label ID="city" runat="server" CssClass="bal" Font-Bold="True" Text="City:"></asp:Label>
                                </td>
                                <td class="auto-style12">
                                    <asp:Label ID="LblCity" runat="server" CssClass="balance" Text="city" Font-Bold="False"></asp:Label>
                                    <asp:TextBox ID="TxtCity" runat="server" CssClass="txtboxes" Visible="False"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style14">
                                    <asp:Label ID="number" runat="server" CssClass="bal" Font-Bold="True" Text="Contact No."></asp:Label>
                                </td>
                                <td class="auto-style12">
                                    <asp:Label ID="LblNo" runat="server" CssClass="balance" Text="number" Font-Bold="False"></asp:Label>
                                    <asp:TextBox ID="TxtNo" runat="server" CssClass="txtboxes" Visible="False"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style14">
                                    &nbsp;</td>
                                <td class="auto-style12">
                                    <asp:Label ID="ErrorMsg" runat="server" Font-Size="Small" Text=" "></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style14">
                                    &nbsp;</td>
                                <td class="auto-style12">
                                    <asp:Button ID="BtnSave" runat="server" CssClass="buttons" OnClick="BtnSave_Click" Text="Save" Visible="False" />
                                </td>
                            </tr>
                        </table>
                        
                    </div>
                    <asp:Label ID="LblProfileCreation" runat="server" Text="This profile was created on " ForeColor="#666666"></asp:Label>
                    <asp:Label ID="LblDate" runat="server" Text="date" ForeColor="#666666"></asp:Label>
        </div>
    </form>
</body>
</html>
