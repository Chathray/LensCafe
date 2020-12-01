using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

namespace Order
{
    public partial class UserPasswordEdit : System.Web.UI.Page
    {
        private static string connectionString = WebConfigurationManager.ConnectionStrings["userConn"].ConnectionString;
        SqlConnection con = new SqlConnection(connectionString);
        Encryption en = new Encryption();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["MemberEmail"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void submitChangePW_Click(object sender, EventArgs e)
        {
            if (reqCurrentPassword.IsValid &&
                regExpCurrentPassword.IsValid &&
                reqNewPassword.IsValid &&
                regExpNewPassword.IsValid &&
                reqConfirmPassword.IsValid &&
                compareConfirmPassword.IsValid)
            {
                string currentPW = txtboxCurrentPassword.Text;
                string newPW = txtboxNewPassword.Text;

                con.Open();
                string passwordQuery = "select MemberPassword from Members where MemberId='" + Session["MemberId"].ToString() + "'";
                SqlCommand cmdPassword = new SqlCommand(passwordQuery, con);
                string dbPassword = cmdPassword.ExecuteScalar().ToString();
                con.Close();

                if (en.Decrypt(dbPassword) == currentPW)
                {
                    string updatePWQuery = "UPDATE Members SET MemberPassword='" + en.Encrypt(newPW) + "' where MemberId='" + Session["MemberId"].ToString() + "'";
                    con.Open();
                    SqlCommand cmdUpdatePW = new SqlCommand(updatePWQuery, con);

                    int added = 0;
                    try
                    {
                        added = cmdUpdatePW.ExecuteNonQuery();

                        //check if record was successfully inserted
                        if (added > 0)
                        {
                            lblMsg.Text = "Your password has been changed.";
                        }
                        else
                        {
                            lblMsg.Text = "Password change failed, please try again later.";
                        }
                    }
                    catch (Exception err)
                    {
                        lblMsg.Text = "Password Update Error <br /> " + err.Message;
                    }
                    finally
                    {
                        con.Close();
                    }
                }
                else
                {
                    lblMsg.Text = "Your current password is incorrect";
                }
            }
        }
    }
}