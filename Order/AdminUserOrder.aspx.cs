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
                        orderTable.InnerHtml = "<h4>Bạn chưa có bất kỳ đơn đặt hàng nào</h4>";
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
            string path = "";

            switch (coffee)
            {
                case "Classic Cappuccino":
                    path = "images/cappuccino/cappuccino.jpg";
                    break;
                case "Iced Cappuccino":
                    path = "images/cappuccino/iced cappuccino.jpg";
                    break;
                case "Classic Americano":
                    path = "images/americano/americano.jpg";
                    break;
                case "Classic Latte":
                    path = "images/latte/latte.jpg";
                    break;
                case "Vanilla Latte":
                    path = "images/latte/vanilla latte.jpg";
                    break;
                case "Caramel Latte":
                    path = "images/latte/caramel latte.jpg";
                    break;
                case "Mocha Latte":
                    path = "images/latte/mocha latte.jpg";
                    break;
            }

            return path;
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