using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Order
{
    public partial class AdminUserEdit : Page
    {
        private static string connectionString = WebConfigurationManager.ConnectionStrings["userConn"].ConnectionString;
        SqlConnection con = new SqlConnection(connectionString);
        int id;
        string MemberAddress, MemberPhone, MemberEmail, MemberPassword, MemberRole, MemberUsername;
        Encryption en = new Encryption();

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
                    if (Session["MemberRole"].ToString() == "user")
                    {
                        Response.Redirect("Error404.aspx");
                    }
                    else
                    {
                        setIntoFill();
                    }
                }
            }
        }

        private void setIntoFill()
        {
            setMemberId();

            con.Open();
            string memberQuery = "select * from Members where MemberId=" + id;
            SqlCommand cmdMember = new SqlCommand(memberQuery, con);
            SqlDataReader reader = cmdMember.ExecuteReader();

            //get data
            while (reader.Read())
            {
                MemberAddress = reader["MemberAddress"].ToString();
                MemberPhone = reader["MemberPhone"].ToString();
                MemberEmail = reader["MemberEmail"].ToString();
                MemberPassword = en.Decrypt(reader["MemberPassword"].ToString());
                MemberRole = reader["MemberRole"].ToString();
                MemberUsername = reader["MemberUsername"].ToString();
            }
            con.Close();

            //set into fill
            lblMemberId.Text = id.ToString();
            txtboxUsername.Text = MemberUsername;
            txtboxEmail.Text = MemberEmail;
            txtboxPassword.Text = MemberPassword;
            txtboxAddress.Text = MemberAddress;
            txtboxPhone.Text = MemberPhone;

            ddlRole.Items.Add(new ListItem(MemberRole, MemberRole));
            ddlRole.Items.FindByText(MemberRole).Selected = true;
            switch (MemberRole)
            {
                case "user":
                    ddlRole.Items.Add(new ListItem("admin", "admin"));
                    break;
                case "admin":
                    ddlRole.Items.Add(new ListItem("user", "user"));
                    break;
            }
        }

        private void setMemberId()
        {
            string memberId = Global.MemberId;
            id = short.Parse(memberId);
        }

        protected void submitAdminUserEdit_Click(object sender, EventArgs e)
        {
            if (reqUsername.IsValid &&
                regExpUsername.IsValid &&
                reqEmail.IsValid &&
                reqPassword.IsValid &&
                regExpPassword.IsValid &&
                reqName.IsValid &&
                reqPhone.IsValid &&
                customEmail.IsValid &&
                customUsername.IsValid)
            {
                setMemberId();

                string editUsername = txtboxUsername.Text;
                string editEmail = txtboxEmail.Text;
                string editPassword = txtboxPassword.Text;
                string editRole = ddlRole.SelectedValue;
                string editName = txtboxAddress.Text;
                string editPhone = txtboxPhone.Text;

                string updateQuery = "UPDATE Members SET MemberUsername='" + editUsername + "', ";
                updateQuery += "MemberEmail='" + editEmail + "', ";
                updateQuery += "MemberPassword='" + en.Encrypt(editPassword) + "', ";
                updateQuery += "MemberRole='" + editRole + "', ";
                updateQuery += "MemberAddress=N'" + editName + "', ";
                updateQuery += "MemberPhone='" + editPhone + "' ";
                updateQuery += "WHERE MemberId=" + id;

                con.Open();
                SqlCommand cmdUpdate = new SqlCommand(updateQuery, con);

                int added = 0;
                try
                {
                    added = cmdUpdate.ExecuteNonQuery();

                    //check if record was successfully inserted
                    if (added > 0)
                    {
                        outputAdminMember.InnerHtml = "<label id='AdminMemberEditSuccess'>Member details has been updated.</label>";
                        outputAdminMember.InnerHtml += "<p><a href='AdminUserTable.aspx'>Back to Member List</a></p>";
                        outputAdminMember.InnerHtml += "<p><a href='Home.aspx'>Home</a></p>";
                    }
                    else
                    {
                        AdminMemberUpdateErrorMsg.Text = "Member update failed, please try again later.";
                    }
                }
                catch (Exception err)
                {
                    AdminMemberUpdateErrorMsg.Text = "Member Update Error <br /> " + err.Message;
                }
                finally
                {
                    con.Close();
                }
            }
        }

        protected void submitUserDelete_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminUserDelete.aspx");
        }

        protected void submitCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminUserTable.aspx");
        }

        protected void customUsername_ServerValidate(object source, ServerValidateEventArgs args)
        {
            setMemberId();

            con.Open();
            string checkUsernameExist = "select count(*) from Members where MemberUsername='" + txtboxUsername.Text.ToLower() + "'";
            SqlCommand cmdCheckUsername = new SqlCommand(checkUsernameExist, con);
            int usernameExist = Convert.ToInt32(cmdCheckUsername.ExecuteScalar().ToString());
            con.Close();

            if (usernameExist > 0)
            {
                con.Open();
                string usernameQuery = "select MemberUsername from Members where MemberId='" + id + "'";
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

        protected void customEmail_ServerValidate(object source, ServerValidateEventArgs args)
        {
            setMemberId();

            con.Open();
            string checkEmailExist = "select count(*) from Members where MemberEmail='" + txtboxEmail.Text.ToLower() + "'";
            SqlCommand cmdCheckEmail = new SqlCommand(checkEmailExist, con);
            int emailExist = Convert.ToInt32(cmdCheckEmail.ExecuteScalar().ToString());
            con.Close();

            if (emailExist > 0)
            {
                con.Open();
                string emailQuery = "select MemberEmail from Members where MemberId='" + id + "'";
                SqlCommand cmdEmail = new SqlCommand(emailQuery, con);
                string dbEmail = cmdEmail.ExecuteScalar().ToString();
                con.Close();

                if (txtboxEmail.Text.ToLower() == dbEmail)
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