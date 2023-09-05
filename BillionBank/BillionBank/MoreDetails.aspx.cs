/*
=============================================================
Programmer: Zwelethu Jr. Nkosi
Description: This page displays more details about a selected account.
=============================================================
*/

using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BillionBank
{

    //When an account is viewed more details about the acc are displayed, that's what this class ensures
    public partial class MoreDetails : System.Web.UI.Page
    {
        SqlConnection conn;
        string connString = "Data Source=NKOSIN419L;Initial Catalog=BilliBank;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Session["User"] == null))
            {
                string sql = $@"SELECT * FROM accounts WHERE accNo = '{Session["accNumber"]}' ";
                conn = new SqlConnection(connString);
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    LblHeading.Text = reader["accName"].ToString();
                    LblAccNo.Text = reader["accNo"].ToString();
                    LblAccType.Text = reader["accType"].ToString();
                    LblBal.Text = ((double)reader["accBalance"]).ToString("C");
                    LblAccCreation.Text = reader["dateAdded"].ToString();
                }
                conn.Close();
                conn.Open();
                string sql1 = $@"SELECT * FROM transactions WHERE transactionOwner = '{Session["accNumber"]}'";
                SqlCommand command = new SqlCommand(sql1, conn);
                SqlDataReader result = command.ExecuteReader();
                while (result.Read())
                {
                    if (result["sender"] == Session["accNumber"])
                    {
                        foreach (RepeaterItem item in Repeater1.Items)
                        {
                            Label LblFrom = (Label)item.FindControl("LblFrom");
                            LblFrom.Text = "-";
                        }
                    }
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
        }
    }
}