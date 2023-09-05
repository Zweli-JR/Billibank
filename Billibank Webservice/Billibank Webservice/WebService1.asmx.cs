using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using System.Globalization;

namespace Billibank_Webservice
{
    /// <summary>
    /// Summary description for WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {

        string stringConn = "Data Source=NKOSIN419L;Initial Catalog=BilliBank;Integrated Security=True";

        
        [WebMethod]
        public bool AccInfo(string email, string accName, string dropdwn)
        {
            bool result;

            string sqlCheck = $@"SELECT * FROM accounts WHERE accOwner = '{email}' AND accName = '{accName}'";
            string sql = $@"INSERT INTO accounts VALUES('{email}', '{dropdwn}', '{accName}', 0, GETDATE(), 0)";
            SqlConnection conn = new SqlConnection(stringConn);
            conn.Open();
            SqlCommand command = new SqlCommand(sqlCheck, conn);
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                conn.Close();
                result = false;
            }
            else
            {
                conn.Close();
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
                conn.Close();
                result = true;
            }

            return result;
        }

        [WebMethod]
        public bool CustomerInfo(string name, string add1, string add2, string city, string no, string email)
        {
            bool result;
            try
            {
                string sql = $@"UPDATE users SET userPrefName = '{name}' WHERE userEmail = '{email}'";
                string sql1 = $@" UPDATE users SET addressLine1 = '{add1}' WHERE userEmail = '{email}'";
                string sql2 = $@" UPDATE users SET addressLine2 = '{add2}' WHERE userEmail = '{email}'";
                string sql3 = $@" UPDATE users SET city = '{city}' WHERE userEmail = '{email}'";
                string sql4 = $@" UPDATE users SET contactNo = '{no}' WHERE userEmail = '{email}'";

                string completedSql = sql + sql1 + sql2 + sql3 + sql4;

                SqlConnection conn = new SqlConnection(stringConn);
                conn.Open();
                SqlCommand cmd = new SqlCommand(completedSql, conn);
                cmd.ExecuteNonQuery();
                conn.Close();
                result = true;
            }
            catch (SqlException)
            {
                result = false;
            }

            return result;
        }

        [WebMethod]
        public bool Transactions(string amount, string reff, string repRef, string dropdownFrom, string dropdownTo, string email)
        {
            bool result;

            int source = 0;
            int recepient = 0;
            int insufficient = 0;


            string sqlRead = $@"SELECT * FROM accounts WHERE accName = '{dropdownFrom}' AND accOwner = '{email}'";
            string sqlRead1 = $@"SELECT * FROM accounts WHERE accName = '{dropdownTo}' AND accOwner = '{email}'";

            SqlConnection connection = new SqlConnection(stringConn);
            connection.Open();
            SqlCommand cmd = new SqlCommand(sqlRead, connection);
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                source = Convert.ToInt32(reader["accNo"]);

                CultureInfo culture = CultureInfo.CreateSpecificCulture("en-US");
                float accBalance = Convert.ToSingle(reader["accBalance"], culture);
                float enteredAmount = Convert.ToSingle(amount, culture);

                if (accBalance < enteredAmount)
                {
                    insufficient = 1;
                }

            }
            connection.Close();
            connection.Open();
            SqlCommand cmad = new SqlCommand(sqlRead1, connection);
            SqlDataReader reader1 = cmad.ExecuteReader();
            while (reader1.Read())
            {
                recepient = Convert.ToInt32(reader1["accNo"]);
            }
            connection.Close();
            if (insufficient == 0)
            {
                connection.Open();

                string sql = $@"INSERT INTO transactions VALUES('{email}', {source}, {recepient}, '{reff}', '{repRef}', {amount}, 1, GETDATE())";
                string update = $@" UPDATE accounts SET accBalance = accBalance - {amount} WHERE accNo = '{source}'";
                string update1 = $@" UPDATE accounts SET accBalance = accBalance + {amount} WHERE accNo = '{recepient}'";
                string completeQuery = sql + update + update1;

                SqlCommand command = new SqlCommand(completeQuery, connection);
                command.ExecuteNonQuery();
                connection.Close();
                result = true;
            }
            else
            {
                result = false;
            }

            return result;
        }

        [WebMethod]
        public string Pay(string email, string dropdwn, string amt, string accNo, string reff, string repRef)
        {
            string result;

            int source = 0;
            string recepient = "";
            int insufficient = 0;

            string sqlRead = $@"SELECT * FROM accounts WHERE accName = '{dropdwn}' AND accOwner = '{email}'";

            SqlConnection connection = new SqlConnection(stringConn);
            connection.Open();
            SqlCommand cmd = new SqlCommand(sqlRead, connection);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                source = Convert.ToInt32(reader["accNo"]);
                CultureInfo culture = CultureInfo.CreateSpecificCulture("en-US");
                float accBalance = Convert.ToSingle(reader["accBalance"], culture);
                float enteredAmount = Convert.ToSingle(amt, culture);

                if (accBalance < enteredAmount)
                {
                    insufficient = 1;
                }
            }
            connection.Close();
            connection.Open();

            string recepientSql = $@"SELECT * FROM accounts WHERE accNo = {accNo}";
            SqlCommand sqlCommand = new SqlCommand(recepientSql, connection);
            SqlDataReader dataReader = sqlCommand.ExecuteReader();
            while (dataReader.Read())
            {
                recepient = dataReader["accOwner"].ToString();
            }
            connection.Close();



            if (insufficient == 0)
            {
                try
                {
                    connection.Open();

                    string sql = $@"INSERT INTO transactions VALUES('{email}', {source}, {accNo}, '{reff}', '{repRef}', {amt}, 0, GETDATE())";
                    string sql1 = $@" INSERT INTO transactions VALUES('{recepient}', {source}, {accNo}, '{reff}', '{repRef}', {amt}, 0, GETDATE())";
                    string update = $@" UPDATE accounts SET accBalance = accBalance - {amt} WHERE accNo = '{source}'";
                    string update1 = $@" UPDATE accounts SET accBalance = accBalance + {amt} WHERE accNo = '{accNo}'";
                    string update2 = $@" UPDATE accounts SET useCount = useCount + 1 WHERE accNo = '{source}'";
                    string completeQuery = sql + sql1 + update + update1 + update2;

                    SqlCommand command = new SqlCommand(completeQuery, connection);
                    command.ExecuteNonQuery();
                    connection.Close();

                    result = "true";
                }
                catch (SqlException)
                {
                    result = "acc";
                }
            }
            else
            {
                result = "funds";
            }

            return result;
        }

    }
}
