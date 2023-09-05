/*
=============================================================
Programmer: Zwelethu Jr. Nkosi
Description: page that lists all accounts the user has.
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
using BillionBank.BilliService;

namespace BillionBank
{

    //This class contains all of the accounts page's code
    public partial class Accounts : System.Web.UI.Page
    {
        SqlConnection conn;
        DataTable dt;
        string stringConn = "Data Source=NKOSIN419L;Initial Catalog=BilliBank;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Binder();
                
            }
        }

        protected void ConnectDB()
        {
            conn = new SqlConnection(stringConn);
            conn.Open();
        }

        protected void Binder()
        {
            conn = new SqlConnection(stringConn);
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

        protected void BtnCreateAcc_Click(object sender, EventArgs e)
        {
            Table2.Visible = true;
            BtnCreateAcc.Visible = false;
        }

        protected void BtnCreate_Click(object sender, EventArgs e)
        {

            if (String.IsNullOrEmpty(TxtAccName.Text))
            {
                errMsg.Text = "Account needs a name";
            }
            else
            {
                string email = Session["User"].ToString();
                string accName = TxtAccName.Text;
                string dropdwn = DrpDwnAccName.Text;

                WebService1SoapClient ws = new WebService1SoapClient();
                bool result = ws.AccInfo(email, accName, dropdwn);

                if (result == true)
                {
                    Table2.Visible = false;
                    BtnCreateAcc.Visible = true;
                    Response.Redirect("Accounts.aspx");
                }
                else
                {
                    errMsg.ForeColor = System.Drawing.Color.Red;
                    errMsg.Text = "You already have an account with that name";
                }
            }

        }
    }
}