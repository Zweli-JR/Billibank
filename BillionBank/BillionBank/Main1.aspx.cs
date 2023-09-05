using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BillionBank
{
    public partial class Main1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Binder();
        }

        protected void Binder()
        {
            SqlConnection con =new SqlConnection("Data Source=DESKTOP-2R74SUD\\SQLEXPRESS;Initial Catalog=BilliBank;Integrated Security=True");
            SqlCommand cmd = new SqlCommand($@"SELECT * FROM accounts WHERE accOwner = '{Session["User"]}'",con);
            SqlDataAdapter adapter= new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            LblName.Text = GridView1.SelectedRow.ToString();
        }
    }
}