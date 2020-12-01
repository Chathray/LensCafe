using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Order
{
    public partial class UserProfileEdit : System.Web.UI.Page
    {
        private static string connectionString = WebConfigurationManager.ConnectionStrings["userConn"].ConnectionString;
        SqlConnection con = new SqlConnection(connectionString);
        string dbName, dbPhone, dbEmail, dbUsername;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["MemberEmail"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    setIntoFill();
                }
            }
        }

        private void setIntoFill()
        {
            con.Open();
            string memberQuery = "select * from Members where MemberId='" + Session["MemberId"].ToString() + "'";
            SqlCommand cmdMember = new SqlCommand(memberQuery, con);
            SqlDataReader reader = cmdMember.ExecuteReader();

            //get data
            while (reader.Read())
            {
                dbName = reader["MemberName"].ToString();
                dbPhone = reader["MemberPhone"].ToString();
                dbEmail = reader["MemberEmail"].ToString();
                dbUsername = reader["MemberUsername"].ToString();
            }
            con.Close();

            //set into fill
            lblEmail.Text = dbEmail;
            txtboxUsername.Text = dbUsername;
            txtboxName.Text = dbName;
            txtboxPhone.Text = dbPhone;
        }

        protected void submitSave_Click(object sender, EventArgs e)
        {
            if (reqUsername.IsValid &&
                regExpUsername.IsValid &&
                reqName.IsValid &&
                reqPhone.IsValid &&
                customUsername.IsValid)
            {
                string editUsername = txtboxUsername.Text;
                string editName = txtboxName.Text;
                string editPhone = txtboxPhone.Text;

                string updateQuery = "UPDATE Members SET MemberUsername='" + editUsername + "', ";
                updateQuery += "MemberName=N'" + editName + "', ";
                updateQuery += "MemberPhone='" + editPhone + "' ";
                updateQuery += "WHERE MemberId='" + Session["MemberId"].ToString() + "'";

                con.Open();
                SqlCommand cmdUpdate = new SqlCommand(updateQuery, con);

                int added = 0;
                try
                {
                    added = cmdUpdate.ExecuteNonQuery();

                    //check if record was successfully inserted
                    if (added > 0)
                    {
                        lblMsg.Text = "Your profile has been updated.";
                    }
                    else
                    {
                        lblMsg.Text = "Member update failed, please try again later.";
                    }
                }
                catch (Exception err)
                {
                    lblMsg.Text = "Member Update Error <br /> " + err.Message;
                }
                finally
                {
                    con.Close();
                }
            }
            else
            {
                lblMsg.Text = "";
            }
        }

        protected void customUsername_ServerValidate(object source, ServerValidateEventArgs args)
        {
            con.Open();
            string checkUsernameExist = "select count(*) from Members where MemberUsername='" + txtboxUsername.Text.ToLower() + "'";
            SqlCommand cmdCheckUsername = new SqlCommand(checkUsernameExist, con);
            int usernameExist = Convert.ToInt32(cmdCheckUsername.ExecuteScalar().ToString());
            con.Close();

            if (usernameExist > 0)
            {
                con.Open();
                string usernameQuery = "select MemberUsername from Members where MemberId='" + Session["MemberId"].ToString() + "'";
                SqlCommand cmdUsername = new SqlCommand(usernameQuery, con);
                string dbUsername = cmdUsername.ExecuteScalar().ToString();
                con.Close();

                if (txtboxUsername.Text.ToLower() == dbUsername)
                {
                    args.IsValid = true;
                }
                else
                {
                    args.IsValid = false;
                }
            }
            else
            {
                args.IsValid = true;
            }
        }
    }
}