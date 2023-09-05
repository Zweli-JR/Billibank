/*
=============================================================
Programmer: Zwelethu Jr. Nkosi
Description: This page displays the user's personal information.
=============================================================
*/

using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BillionBank.BilliService;

namespace BillionBank
{
    //This class contains all of the profile page's code
    public partial class Profile : System.Web.UI.Page
    {
        SqlConnection conn;
        string connString = "Data Source=NKOSIN419L;Initial Catalog=BilliBank;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Session["User"] == null))
            {
                string sql = $@"SELECT * FROM users WHERE userEmail = '{Session["User"]}'";
                conn = new SqlConnection(connString);
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    LblHeading.Text = reader["userPrefName"].ToString();
                    LblID.Text = reader["userID"].ToString();
                    LblEmail.Text = reader["userEmail"].ToString();
                    lblFullname.Text = reader["userName"].ToString();
                    LblPrefname.Text = reader["userPrefName"].ToString();
                    LblAdd1.Text = reader["addressLine1"].ToString();
                    LblAdd2.Text = reader["addressLine2"].ToString();
                    LblCity.Text = reader["city"].ToString();
                    LblNo.Text = reader["contactNo"].ToString();
                    LblDate.Text = reader["dateAdded"].ToString();

                    if (!Page.IsPostBack)
                    {
                        TxtName.Text = reader["userPrefName"].ToString();
                        TxtAdd1.Text = reader["addressLine1"].ToString();
                        TxtAdd2.Text = reader["addressLine2"].ToString();
                        TxtCity.Text = reader["city"].ToString();
                        TxtNo.Text = reader["contactNo"].ToString();
                    }
                    
                    
                }
                conn.Close();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        protected void BtnEdit_Click(object sender, EventArgs e)
        {
            LblPrefname.Visible = false;
            LblAdd1.Visible = false;
            LblAdd2.Visible = false;
            LblCity.Visible = false;
            LblNo.Visible = false;

            TxtName.Visible = true;
            TxtAdd1.Visible = true;
            TxtAdd2.Visible = true;
            TxtCity.Visible = true;
            TxtNo.Visible = true;
            BtnSave.Visible = true;
            BtnEdit.Visible = false;

            TxtName.Focus();
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            string name = TxtName.Text;
            string add1 = TxtAdd1.Text;
            string add2 = TxtAdd2.Text;
            string city = TxtCity.Text;
            string no = TxtNo.Text;
            string email = Session["User"].ToString();

            WebService1SoapClient ws = new WebService1SoapClient();
            bool result = ws.CustomerInfo(name, add1, add2, city, no, email);

            if (result == true)
            {
                LblPrefname.Visible = true;
                LblAdd1.Visible = true;
                LblAdd2.Visible = true;
                LblCity.Visible = true;
                LblNo.Visible = true;

                TxtName.Visible = false;
                TxtAdd1.Visible = false;
                TxtAdd2.Visible = false;
                TxtCity.Visible = false;
                TxtNo.Visible = false;
                BtnSave.Visible = false;
                BtnEdit.Visible = true;

                Response.Redirect("Profile.aspx");
            }
            else
            {
                ErrorMsg.ForeColor = System.Drawing.Color.Red;
                ErrorMsg.Text = "An error occured";
            }

            
        }
    }
}