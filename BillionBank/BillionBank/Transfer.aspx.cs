/*
=============================================================
Programmer: Zwelethu Jr. Nkosi
Description: This page lets a user transfer money between their accounts.
=============================================================
*/

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BillionBank.BilliService;

namespace BillionBank
{

    //This class contains all of the transfer page's code
    public partial class Transfer : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                string amt = txtID.Text;
                string rep = TxtRef.Text;
                string repref = TxtRepRef.Text;
                string dropFrom = DrpDwnFrom.Text;
                string dropTo = DrpDwnTo.Text;
                string mail = Session["User"].ToString();

                if (DrpDwnFrom.Text == DrpDwnTo.Text)
                {
                    errMsg.ForeColor = System.Drawing.Color.Red;
                    errMsg.Text = "Cannot transfer from and to the same account";
                }
                else
                {
                    WebService1SoapClient ws = new WebService1SoapClient();
                    bool res = ws.Transactions(amt, rep, repref, dropFrom, dropTo, mail);
                    if (res == true)
                    {
                        errMsg.ForeColor = System.Drawing.Color.Green;
                        errMsg.Text = "Transaction Successful";
                        Repeater1.DataSourceID = "SqlDataSource2";
                    }
                    else
                    {
                        errMsg.ForeColor = System.Drawing.Color.Red;
                        errMsg.Text = "Insufficient Funds";
                    }

                }
            }

        }

        protected void AmtValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (String.IsNullOrEmpty(args.Value))
            {
                args.IsValid = false;
                txtID.BorderWidth = 2;
                txtID.BorderColor = System.Drawing.Color.DarkRed;
                AmtValidator.ErrorMessage = "   *";


            }
            else
            {
                args.IsValid = true;
                txtID.BorderWidth = 0;
                               
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
    }


}