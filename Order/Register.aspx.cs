using System;
using System.Data.SqlClient;

namespace Order
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MemberEmail"] != null)
            {
                Response.Redirect("Logout.aspx");
            }
        }

        protected void submitReg_Click(object sender, EventArgs e)
        {
            Encryption pwEncryption = new Encryption();

            string username = regUsername.Text;
            string email = regEmail.Text;
            string password = regPassword.Text;
            string name = regName.Text;
            string phone = regPhone.Text;

            //validation passed
            if (reqRegUsername.IsValid &&
                regRegUsername.IsValid &&
                reqRegEmail.IsValid &&
                reqRegPassword.IsValid &&
                regRegPassword.IsValid &&
                reqRegConfirmPassword.IsValid &&
                compareRegConfirmPassword.IsValid &&
                reqRegName.IsValid &&
                reqRegPhone.IsValid)
            {
                SqlConnection con = new SqlConnection(Global.connectionString);
                con.Open();

                string checkEmailExist = "select count(*) from Members where MemberEmail='" + email + "'";
                SqlCommand cmdCheckEmail = new SqlCommand(checkEmailExist, con);
                int emailExist = Convert.ToInt32(cmdCheckEmail.ExecuteScalar().ToString());

                string checkUsernameExist = "select count(*) from Members where MemberUsername='" + username + "'";
                SqlCommand cmdCheckUsername = new SqlCommand(checkUsernameExist, con);
                int usernameExist = Convert.ToInt32(cmdCheckUsername.ExecuteScalar().ToString());

                //if username and email doesn't exist
                if (emailExist != 1 && usernameExist != 1)
                {
                    string role = "user";

                    //insert query
                    string insertSQL;
                    insertSQL = "INSERT INTO Members (MemberAddress, MemberPhone, MemberEmail, MemberPassword, MemberRole, MemberUsername)";
                    insertSQL += "VALUES (N'";
                    insertSQL += name + "', '";
                    insertSQL += phone + "', '";
                    insertSQL += email.ToLower() + "', '";
                    insertSQL += pwEncryption.Encrypt(password) + "', '";
                    insertSQL += role + "', '";
                    insertSQL += username.ToLower() + "')";

                    SqlCommand cmdInsertSQL = new SqlCommand(insertSQL, con);
                    try
                    {
                        int added = cmdInsertSQL.ExecuteNonQuery();

                        //check if record was successfully inserted
                        if (added > 0)
                        {
                            string MemberIdQuery = "select MemberId from Members where MemberUsername='" + username + "'";
                            SqlCommand cmdMemberId = new SqlCommand(MemberIdQuery, con);
                            string MemberId = cmdMemberId.ExecuteScalar().ToString();

                            Session["MemberEmail"] = email;
                            Session["MemberId"] = MemberId.ToString();
                            Session["MemberUsername"] = username;
                            Session["MemberRole"] = role;
                            Response.Redirect("Home.aspx");
                        }
                        else
                        {
                            regErrorMsg.Text = "Đăng ký không thành công, vui lòng thử lại sau.";
                        }
                    }
                    catch (Exception err)
                    {
                        regErrorMsg.Text = "Lỗi đăng ký <br /> " + err.Message;
                    }
                    finally
                    {
                        con.Close();
                    }
                }
                else
                {
                    switch (emailExist)
                    {
                        case 1:
                            {
                                regErrorEmail.Text = "Email này đã được người khác sử dụng.";
                                break;
                            }
                        default:
                            {
                                regErrorEmail.Text = "";
                                break;
                            }
                    }
                    switch (usernameExist)
                    {
                        case 1:
                            {
                                regErrorUsername.Text = "Tên người dùng này đã được người khác sử dụng.";
                                break;
                            }
                        default:
                            {
                                regErrorUsername.Text = "";
                                break;
                            }
                    }
                }
            }
            else
            {
                clearErrorMsg();
            }
        }

        private void clearErrorMsg()
        {
            regErrorUsername.Text = "";
            regErrorEmail.Text = "";
            regErrorMsg.Text = "";
        }
    }
}