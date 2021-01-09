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

                    tdoanhthu.InnerText = "$" + Scalar("SELECT SUM (TotalPrice) FROM Orders WHERE NOT Status=N'Đã hủy'");
                    cdoanhthu.InnerText = ds.Tables[0].Rows.Count + " đơn hàng";

                    tdancho.InnerText = "$" + Scalar("SELECT SUM (TotalPrice) FROM Orders WHERE Status=N'Đang chờ'");
                    cdancho.InnerText = Scalar("SELECT COUNT (TotalPrice) FROM Orders WHERE Status=N'Đang chờ'") + " đơn hàng";

                    tdathanhtoan.InnerText = "$" + Scalar("SELECT SUM (TotalPrice) FROM Orders WHERE Status=N'Đã thanh toán'");
                    cdathanhtoan.InnerText = Scalar("SELECT COUNT (TotalPrice) FROM Orders WHERE Status=N'Đã thanh toán'") + " đơn hàng";

                    DateTime myDateTime = DateTime.Now;
                    string timeAt = myDateTime.ToString("M/d/y");

                    thomnay.InnerText = "$" + Scalar("SELECT SUM (TotalPrice) FROM Orders WHERE Date='" + timeAt + "'");
                    chomnay.InnerText = Scalar("SELECT COUNT (TotalPrice) FROM Orders WHERE Date='" + timeAt + "'") + " đơn hàng";

                    colcount.InnerText = ds.Tables[0].Columns.Count.ToString();
                }
            }
        }


        private object Scalar(string query)
        {
            SqlConnection con = new SqlConnection(Global.connectionString);
            using (con)
            {
                con.Open();
                var command = new SqlCommand(query, con);
                return command.ExecuteScalar();
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

        private static void SetID(object sender)
        {
            LinkButton btn = (LinkButton)(sender);
            string orderId = btn.CommandArgument;
            Global.OrderId = orderId;
        }

        protected void ViewOrder(object sender, EventArgs e)
        {
            SetID(sender);
            Response.Redirect("UserOrderEdit.aspx?peer=11");
        }

        protected void DelOrder(object sender, EventArgs e)
        {
            SetID(sender);
            Response.Redirect("OrderDeleteConfirm.aspx?peer=11");
        }

        private void UpdateStatusMethod(string q, string oid)
        {
            SqlConnection con = new SqlConnection(Global.connectionString);
            con.Open();

            SqlCommand cmdUpdate = new SqlCommand(q, con);

            try
            {
                int added = cmdUpdate.ExecuteNonQuery();

                //check if record was successfully inserted
                if (added > 0) Response.Redirect("AdminOrderRepeater.aspx");
                else
                    Response.Write("<script language=javascript>alert('Lỗi cập nhật đơn hàng.')</script>");
            }
            catch (Exception)
            {
                Response.Write("<script language=javascript>alert('Lỗi cập nhật đơn hàng.')</script>");
            }
            finally
            {
                con.Close();
            }
        }

        protected void DoneOrder(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)(sender);
            string oid = btn.CommandArgument;

            string q = "UPDATE Orders SET Status=N'Đã thanh toán' WHERE OrderId=" + oid;
            UpdateStatusMethod(q, oid);
        }

        protected void CancelOrder(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)(sender);
            string oid = btn.CommandArgument;

            string q = "UPDATE Orders SET Status=N'Đã hủy' WHERE OrderId=" + oid;
            UpdateStatusMethod(q, oid);
        }

        protected string GetCheckMark(string txt)
        {
            switch (txt)
            {
                case "Đã thanh toán":
                    return "bg-success";
                case "Đã hủy":
                    return "bg-danger";
                default:
                    return "bg-warning";
            }
        }
    }
}