using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Order
{
    public partial class AdminOrderRepeater : System.Web.UI.Page
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

                    if (ds.Tables[0].Rows.Count == 0)
                    {

                    }
                    else
                    {
                        repeaterAdminOrder.DataSource = ds;
                        repeaterAdminOrder.DataBind();
                    }
                    coutable.InnerText = ds.Tables[0].Rows.Count.ToString();
                    colcount.InnerText = ds.Tables[0].Columns.Count.ToString();
                }
            }
        }

        private DataSet GetData()
        {
            SqlConnection con = new SqlConnection(Global.connectionString);
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

        protected void viewOrderID(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)(sender);
            string orderId = btn.CommandArgument;
            Global.OrderId = orderId;
            Response.Redirect("UserOrderEdit.aspx?peer=11");
        }

        protected void delOrderID(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)(sender);
            string orderId = btn.CommandArgument;
            Global.OrderId = orderId;
            Response.Redirect("OrderDeleteConfirm.aspx?peer=11");
        }
    }
}