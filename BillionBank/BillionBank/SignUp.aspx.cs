/*
=============================================================
Programmer: Zwelethu Jr. Nkosi
Description: This page is for signing up, new users to billionbank.
=============================================================
*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Data.SqlClient;
using BillionBank.BilliService;

namespace BillionBank
{

    //This class contains all of the sign up page's code
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
           
        }

        protected void btnNext_Click1(object sender, EventArgs e)
        {


            if (Page.IsValid)
            {
                string email = txtEmail.Text;
                string ID = txtID.Text;
                string name = txtName.Text;
                string preferedName = txtName.Text;
                string add1 = txtAddress1.Text;
                string add2 = txtAddress2.Text;
                string add3 = txtAddress3.Text;
                string number = txtNumber.Text;
                string psswd = txtPsswd.Text;
                string question = txtQuestion.Text;
                string answer = txtAnswer.Text;

                
                try
                {
                    string stringConn = "Data Source=NKOSIN419L;Initial Catalog=BilliBank;Integrated Security=True";
                    SqlConnection sqlConn = new SqlConnection(stringConn);

                    
                    string sqlCmd = $@"INSERT INTO users VALUES ('{email}', {ID}, '{name}', '{preferedName}', '{add1}', '{add2}', '{add3}', '{number}', '{psswd}', '{question}', '{answer}', GETDATE(), 1)";
                    string accCmd = $@"INSERT INTO accounts VALUES('{email}','Savings', 'Main Account', 100.00, GETDATE(), 0)";

                    SqlCommand command = new SqlCommand(sqlCmd, sqlConn);
                    sqlConn.Open();
                    command.ExecuteNonQuery();
                    sqlConn.Close();

                    SqlCommand accCreation = new SqlCommand(accCmd, sqlConn);
                    sqlConn.Open();
                    accCreation.ExecuteNonQuery();
                    sqlConn.Close();

                    Session["User"] = email;
                    Response.Redirect("Main.aspx");
                }
                catch (SqlException)
                {
                    errMsg.Text = "You already have an account";
                }
                
            }
            
        }

        protected void IDValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {

            if (String.IsNullOrEmpty(args.Value))
            {
                args.IsValid = false;
                txtQuestion.BorderWidth = 2;
                txtQuestion.BorderColor = System.Drawing.Color.DarkRed;
                QuestionValidator.ErrorMessage = "   *";


            }
            else
            {
                if (!(args.Value.Length == 13))
                {
                    args.IsValid = false;
                    IDValidator.ErrorMessage = "   Invalid ID Number";
                }
                else
                {
                    args.IsValid = true;
                    txtQuestion.BorderWidth = 0;
                }
                
            }
        }

        protected void NameValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (String.IsNullOrEmpty(args.Value))
            {
                args.IsValid = false;
                txtName.BorderWidth = 2;
                txtName.BorderColor = System.Drawing.Color.DarkRed;
                NameValidator.ErrorMessage = "   *";


            }
            else
            {
                if (args.Value.Any(char.IsDigit))
                {
                    args.IsValid = false;
                }
                else
                {
                    args.IsValid = true;
                    txtName.BorderWidth = 0;
                }
                
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

        protected void AddressValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (String.IsNullOrEmpty(args.Value))
            {
                args.IsValid = false;
                txtAddress1.BorderWidth = 2;
                txtAddress1.BorderColor = System.Drawing.Color.DarkRed;
                Address1Validator.ErrorMessage = "   *";


            }
            else
            {
                args.IsValid = true;
                txtAddress1.BorderWidth = 0;
            }
        }

        protected void CityValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (String.IsNullOrEmpty(args.Value))
            {
                args.IsValid = false;
                txtAddress3.BorderWidth = 2;
                txtAddress3.BorderColor = System.Drawing.Color.DarkRed;
                CityValidator.ErrorMessage = "   *";


            }
            else
            {
                args.IsValid = true;
                txtAddress3.BorderWidth = 0;
            }
        }

        protected void NumberValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {

            if (String.IsNullOrEmpty(args.Value))
            {
                args.IsValid = false;
                txtNumber.BorderWidth = 2;
                txtNumber.BorderColor = System.Drawing.Color.DarkRed;
                ContactNoValidator.ErrorMessage = "   *";


            }
            else
            {
                if(!(NameValidator.Text.Length == 10))
                {

                }
                args.IsValid = true;
                txtNumber.BorderWidth = 0;
            }
        }

        protected void PsswdValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (String.IsNullOrEmpty(args.Value))
            {
                args.IsValid = false;
                txtPsswd.BorderWidth = 2;
                txtPsswd.BorderColor = System.Drawing.Color.DarkRed;
                PsswdValidator.ErrorMessage = "   *";


            }
            else
            {
                args.IsValid = true;
                txtPsswd.BorderWidth = 0;
            }
        }

        protected void QuestionValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (String.IsNullOrEmpty(args.Value))
            {
                args.IsValid = false;
                txtQuestion.BorderWidth = 2;
                txtQuestion.BorderColor = System.Drawing.Color.DarkRed;
                QuestionValidator.ErrorMessage = "   *";


            }
            else
            {
                args.IsValid = true;
                txtQuestion.BorderWidth = 0;
            }
        }

        protected void AnswerValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (String.IsNullOrEmpty(args.Value))
            {
                args.IsValid = false;
                txtAnswer.BorderWidth = 2;
                txtAnswer.BorderColor = System.Drawing.Color.DarkRed;
                AnswerValidator.ErrorMessage = "   *";


            }
            else
            {
                args.IsValid = true;
                txtAnswer.BorderWidth = 0;
            }
        }
    }
}