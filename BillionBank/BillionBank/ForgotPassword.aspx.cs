/*
=============================================================
Programmer: Zwelethu Jr. Nkosi
Description: This page helps a user change their password if they've forgotten it.
=============================================================
*/

using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecipeRate_project3_
{

    //This class contains all of the forgot password page's code
    public partial class ForgotPassword : System.Web.UI.Page
    {
        string email;
        SqlConnection dbConnection;
        string connectionString = "Data Source=NKOSIN419L;Initial Catalog=BilliBank;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            ConnectDatabase();
        }

        private void ConnectDatabase()
        {
            dbConnection = new SqlConnection(connectionString);
            dbConnection.Open();
        }


        private SqlDataReader ExecuteQuery(String query)
        {
            try
            {
                SqlCommand cmd = dbConnection.CreateCommand();
                cmd.CommandText = query;
                return
                  cmd.ExecuteReader();
            }
            catch (SqlException ex)
            {
                return null;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlDataReader result = ExecuteQuery($"SELECT * FROM users WHERE userEmail = '{txtEmail.Text}'");

            if (!String.IsNullOrEmpty(txtEmail.Text))
            {
                if (result.Read())
                {
                    email = txtEmail.Text;
                    lblQustion.Text = result["question"].ToString();
                    lblQustion.Visible = true;
                    lblAnswer.Visible = true;
                    txtAnswer.Visible = true;
                    btnSubmit2.Visible = true;
                }
                else
                {
                    errMsg.Text = "There is no account with that username";
                }
            }
            else
            {
                errMsg.Text = "Please enter an email address";
            }
        }

        protected void btnSubmit2_Click(object sender, EventArgs e)
        {
            SqlDataReader result = ExecuteQuery($"SELECT * FROM users WHERE userEmail = '{txtEmail.Text}'");

            if (!String.IsNullOrEmpty(txtAnswer.Text))
            {
                if (result.Read())
                {
                    lblQustion.Text = result["question"].ToString();
                    if (txtAnswer.Text == result["answer"].ToString())
                    {
                        lblRemember.Visible = true;
                        lblNewPsswd.Visible = true;
                        txtPsswd.Visible = true;
                        btnReset.Visible = true;

                    }
                    else
                    {
                        errMsg0.Text = "Incorrect Answer";
                    }
                }
            }
            else
            {
                errMsg0.Text = "Please enter your answer";
            }
            
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            
            SqlConnection sqlConn = new SqlConnection(connectionString);
            string sql = $"UPDATE users SET userPassword = '{txtPsswd.Text}' WHERE userEmail = '{txtEmail.Text}'";
            SqlCommand command = new SqlCommand(sql, sqlConn);
            sqlConn.Open();
            command.ExecuteNonQuery();
            sqlConn.Close();

            errMsg1.ForeColor = System.Drawing.Color.Green;
            errMsg1.Text = "success";
            HyperLink1.Visible = true;
            
        }
    }
}