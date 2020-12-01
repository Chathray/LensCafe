using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Order
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MemberEmail"] != null)
            {
                Response.Redirect("Logout.aspx");
            }
        }

        protected void submitLogin_Click(object sender, EventArgs e)
        {
            Encryption pwEncryption = new Encryption();

            if (reqLoginEmail.IsValid && reqLoginPassword.IsValid)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["userConn"].ToString());

                string userEmail = loginEmail.Text;
                string userPassword = loginPassword.Text;

                con.Open();
                string query = "select count(*) from Members where MemberEmail='" + userEmail + "'";

                SqlCommand cmd = new SqlCommand(query, con);
                int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                con.Close();

                if (temp == 1)
                {
                    con.Open();
                    string checkPasswordQuery = "select MemberPassword from Members where MemberEmail='" + userEmail + "'";
                    SqlCommand cmdPassword = new SqlCommand(checkPasswordQuery, con);
                    string dbPassword = cmdPassword.ExecuteScalar().ToString();

                    string MemberIdQuery = "select MemberId from Members where MemberEmail='" + userEmail + "'";
                    SqlCommand cmdMemberId = new SqlCommand(MemberIdQuery, con);
                    string dbMemberId = cmdMemberId.ExecuteScalar().ToString();

                    string MemberUsernameQuery = "select MemberUsername from Members where MemberEmail='" + userEmail + "'";
                    SqlCommand cmdMemberUsername = new SqlCommand(MemberUsernameQuery, con);
                    string dbMemberUsername = cmdMemberUsername.ExecuteScalar().ToString();

                    string roleQuery = "select MemberRole from Members where MemberEmail='" + userEmail + "'";
                    SqlCommand cmdRole = new SqlCommand(roleQuery, con);
                    string dbRole = cmdRole.ExecuteScalar().ToString();

                    if (userPassword != "")
                    {
                        if (dbPassword != "" && dbMemberId != "" && dbMemberUsername != "" && dbRole != "")
                        {
                            if (dbPassword == pwEncryption.Encrypt(userPassword))
                            {
                                Session["MemberEmail"] = userEmail;
                                Session["MemberId"] = dbMemberId.ToString();
                                Session["MemberUsername"] = dbMemberUsername;
                                Session["MemberRole"] = dbRole;
                                Response.Redirect("Home.aspx");
                            }
                            else
                            {
                                loginErrorMsg.Text = "Incorrect Password";
                            }
                        }
                        else
                        {
                            loginErrorMsg.Text = "Database error";
                        }
                    }
                }
                else
                {
                    loginErrorMsg.Text = "User does not exists.";
                }
            }
        }
    }
}