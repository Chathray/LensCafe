using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace Order
{
    public partial class AdminUserTable : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
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
                    DataSet ds = GetData();

                    MemberTableRepeater.DataSource = ds;
                    MemberTableRepeater.DataBind();
                }
            }
        }

        private DataSet GetData()
        {
            SqlConnection con = new SqlConnection(Global.connectionString);
            string AllMemberQuery = "select * from Members";
            using (con)
            {
                SqlDataAdapter da = new SqlDataAdapter(AllMemberQuery, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds;
            }
        }

        protected void userEditLinkBtn_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)(sender);
            string memberId = btn.CommandArgument;
            Global.MemberId = memberId;
            Response.Redirect("AdminUserEdit.aspx");
        }

        protected void userDeleteLinkBtn_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)(sender);
            string memberId = btn.CommandArgument;
            Global.MemberId = memberId;
            Response.Redirect("AdminUserDelete.aspx");
        }
    }
}