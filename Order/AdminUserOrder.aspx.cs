using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace Order
{
    public partial class AdminUserOrder : System.Web.UI.Page
    {
        private string connectionString = WebConfigurationManager.ConnectionStrings["userConn"].ConnectionString;

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

                    if (ds.Tables[0].Rows.Count == 0)
                    {
                        orderTable.Attributes["class"] = "SetToCenter";
                        orderTable.InnerHtml = "<h4>Bạn chưa có bất kỳ đơn hàng nào</h4>";
                    }
                    else
                    {
                        repeaterAdminOrder.DataSource = ds;
                        repeaterAdminOrder.DataBind();
                    }
                }
            }
        }

        private DataSet GetData()
        {
            SqlConnection con = new SqlConnection(connectionString);
            string userOrderQuery = "select * from Orders";
            using (con)
            {
                SqlDataAdapter da = new SqlDataAdapter(userOrderQuery, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds;
            }
        }

        public string GetImage(string coffee)
        {
            return "images/" + coffee + ".jpg";
        }

        protected void sendOrderID(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)(sender);
            string orderId = btn.CommandArgument;
            Global.OrderId = orderId;
            Response.Redirect("UserOrderEdit.aspx?peertype=11");
        }
    }
}