using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Order
{
    public partial class UserOrderRepeater : Page
    {
        private static string connectionString = WebConfigurationManager.ConnectionStrings["userConn"].ConnectionString;
        SqlConnection con = new SqlConnection(Global.connectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MemberEmail"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!Page.IsPostBack)
            {
                ViewState["RefUrl"] = Request.UrlReferrer.ToString();
            }

            con.Open();
            string countOrdersQuery = "select count(*) from Orders where MemberId='" + Session["MemberId"].ToString() + "'";
            SqlCommand cmdCountOrders = new SqlCommand(countOrdersQuery, con);
            int countOrders = Convert.ToInt32(cmdCountOrders.ExecuteScalar().ToString());
            con.Close();

            if (countOrders < 1)
            {
                orderTable.Attributes["class"] = "SetToCenter";
                orderTable.InnerHtml = "<h4>Bạn chưa có bất kỳ đơn hàng nào</h4>";
                orderTable.InnerHtml += "<a href='OrderTest.aspx'>Bấm vào đây để đặt cà phê</a>";
            }
            else
            {
                DataSet ds = GetData();

                repeaterOrder.DataSource = ds;
                repeaterOrder.DataBind();
            }
        }

        private DataSet GetData()
        {
            string userOrderQuery = "select * from Orders where MemberId='" + Session["MemberId"].ToString() + "'";
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
            if (Session["MemberRole"].ToString() == "admin")
                Response.Redirect("UserOrderEdit.aspx?peer=10");
            else if (Session["MemberRole"].ToString() == "user")
                Response.Redirect("UserOrderEdit.aspx?peer=00");

        }
    }
}