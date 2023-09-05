/*
=============================================================
Programmer: Zwelethu Jr. Nkosi
Description: This is the login page.
=============================================================
*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace BillionBank
{

    //This class contains all of the login page's code
    public partial class Login : System.Web.UI.Page
    {

        SqlConnection conn;
        string connString = "Data Source=NKOSIN419L;Initial Catalog=BilliBank;Integrated Security=True"; 

        protected void Page_Load(object sender, EventArgs e)
        {
            ConnectDB();
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void ConnectDB()
        {
            conn = new SqlConnection(connString);
            conn.Open();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SqlCommand command = new SqlCommand($@"SELECT * FROM users WHERE userEmail = '{txtEmail.Text}'", conn);
                SqlDataReader result = command.ExecuteReader();
                if (result.Read())
                {
                    if (txtPsswd.Text == (string)result["userPassword"])
                    {
                        Session["User"] = txtEmail.Text;

                        Response.Redirect("Main.aspx");
                    }
                    else
                    {
                        errorMsg.Text = "incorrect password";
                    }
                }
                else
                {
                    errorMsg.Text = "Email wasn't found";
                }
                conn.Close();

            }

        }

        protected void EmailValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (String.IsNullOrEmpty(args.Value))
            {
                args.IsValid = false;
                txtEmail.BorderWidth = 2;
                txtEmail.BorderColor = System.Drawing.Color.DarkRed;
                EmailValidator.ErrorMessage = "   *";


            }
            else
            {
                args.IsValid = true;
                txtEmail.BorderWidth = 0;
            }
        }
    }
}