/*
=============================================================
Programmer: Zwelethu Jr. Nkosi
Description: This is the home page, it displays a summary of transactions.
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
    //This class contains all of the main page's code

    public partial class Main : System.Web.UI.Page
    {
        DataTable dt;
        SqlConnection conn;
        string connString = "Data Source=NKOSIN419L;Initial Catalog=BilliBank;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                ConnectDB();
                string newString = $@"SELECT * FROM users WHERE userEmail = '{Session["User"]}'";
                SqlCommand cmd = new SqlCommand(newString, conn);
                SqlDataReader read = cmd.ExecuteReader();
                while (read.Read())
                {
                    if (read["newness"].ToString() == "1")
                    {
                        LblName.Visible= false;
                        lblNewbie.Visible= true;
                        BtnGotit.Visible= true;
                    }
                }
                conn.Close();

                ConnectDB();
                string sqlcmd = $@"SELECT * FROM users WHERE userEmail = '{Session["User"]}'";
                SqlCommand command = new SqlCommand(sqlcmd, conn);
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    LblName.Text = "Welcome " + reader["userPrefName"].ToString();
                }
                conn.Close();
                Binder();
            }
            
        }

        protected void ConnectDB()
        {
            conn = new SqlConnection(connString);
            conn.Open();
        }

        protected void Binder()
        {
            conn = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand($@"SELECT * FROM accounts WHERE accOwner = '{Session["User"]}' ORDER BY useCount DESC, accBalance DESC", conn);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            dt = new DataTable();
            adapter.Fill(dt);
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Session["accNumber"] = dt.Rows[e.Item.ItemIndex][0].ToString();
            Response.Redirect("MoreDetails.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        protected void BtnGotit_Click(object sender, EventArgs e)
        {
            BtnGotit.Visible = false;
            lblNewbie.Visible = false;
            LblName.Visible = true;

            ConnectDB();
            string sqlcmd = $@"UPDATE users SET newness = 0 WHERE userEmail = '{Session["User"]}' ";
            SqlCommand command = new SqlCommand(sqlcmd, conn);
            command.ExecuteNonQuery();
            conn.Close();

        }
    }
}