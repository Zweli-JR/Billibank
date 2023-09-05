/*
=============================================================
Programmer: Zwelethu Jr. Nkosi
Description: This page lets users transfer money to other billionbank users.
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

    //This class contains all of the pay page's code
    public partial class Pay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string email = Session["User"].ToString();
                string dropdwn = DrpDwnFrom.Text;
                string amt = TxtAmt.Text;
                string accNo = TxtAccNo.Text;
                string reff = TxtRef.Text;
                string repReff = TxtRepRef.Text;



                WebService1SoapClient ws = new WebService1SoapClient();
                string result = ws.Pay(email, dropdwn, amt, accNo, reff, repReff);



                if (result == "true")
                {
                    errMsg.ForeColor = System.Drawing.Color.Green;
                    errMsg.Text = "Transfer successful";
                    Repeater1.DataSourceID = "SqlDataSource1";
                }

                else if (result == "acc")
                {
                    errMsg.ForeColor = System.Drawing.Color.Red;
                    errMsg.Text = "That account doesn't exist";
                }

                else
                {
                    errMsg.ForeColor = System.Drawing.Color.Red;
                    errMsg.Text = "Insufficient funds";
                }
            }

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        protected void AmtValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (String.IsNullOrEmpty(args.Value))
            {
                args.IsValid = false;
                TxtAmt.BorderWidth = 2;
                TxtAmt.BorderColor = System.Drawing.Color.DarkRed;
                AmtValidator.ErrorMessage = "   *";


            }
            else
            {
                args.IsValid = true;
                TxtAmt.BorderWidth = 0;
            }
        }

        protected void RefValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (String.IsNullOrEmpty(args.Value))
            {
                args.IsValid = false;
                TxtRef.BorderWidth = 2;
                TxtRef.BorderColor = System.Drawing.Color.DarkRed;
                RefValidator.ErrorMessage = "   *";


            }
            else
            {
                args.IsValid = true;
                TxtRef.BorderWidth = 0;
            }
        }

        protected void RepRefValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (String.IsNullOrEmpty(args.Value))
            {
                args.IsValid = false;
                TxtRepRef.BorderWidth = 2;
                TxtRepRef.BorderColor = System.Drawing.Color.DarkRed;
                RepRefValidator.ErrorMessage = "   *";


            }
            else
            {
                args.IsValid = true;
                TxtRepRef.BorderWidth = 0;
            }
        }

        protected void ToValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (String.IsNullOrEmpty(args.Value))
            {
                args.IsValid = false;
                TxtAccNo.BorderWidth = 2;
                TxtAccNo.BorderColor = System.Drawing.Color.DarkRed;
                ToValidator.ErrorMessage = "   *";


            }
            else
            {
                args.IsValid = true;
                TxtAccNo.BorderWidth = 0;
            }
        }
    }
}