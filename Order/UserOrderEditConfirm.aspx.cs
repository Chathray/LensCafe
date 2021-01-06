using System;
using System.Data.SqlClient;

namespace Order
{
    public partial class UserOrderEditConfirm : System.Web.UI.Page
    {
        string editFlavor, editTopping, editAddOns, editStatus;
        int num, orderId, editQuantity;
        double totalPrice = 0.0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MemberEmail"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (Session["MemberRole"].ToString() == "admin")
            {
                editStatus = Session["editStatus"].ToString();
            }

            editFlavor = Session["editFlavor"].ToString();
            editQuantity = Convert.ToInt32(Session["editQuantity"].ToString());
            editTopping = Session["editTopping"].ToString();
            editAddOns = Session["editAddOns"].ToString();
            if (editAddOns == "") editAddOns = "Không";
            totalPrice = Convert.ToDouble(Session["editTotalPrice"].ToString());

            //coffee types
            image.ImageUrl = "images/" + editFlavor + ".jpg";
            outputs();
        }

        protected void submitConfirm_Click(object sender, EventArgs e)
        {
            setCoffee();
            orderId = num;

            SqlConnection con = new SqlConnection(Global.connectionString);
            con.Open();

            string updateQuery = "UPDATE Orders SET Quantity=" + editQuantity + ", ";
            updateQuery += "Topping=N'" + editTopping + "', ";
            updateQuery += "AddOns=N'" + editAddOns + "', ";

            if (Session["MemberRole"].ToString() == "admin")
            {
                updateQuery += "Status=N'" + editStatus + "', ";
            }

            updateQuery += "TotalPrice=" + totalPrice + " ";
            updateQuery += "WHERE OrderId=" + orderId;

            SqlCommand cmdUpdate = new SqlCommand(updateQuery, con);
            try
            {
                int added = cmdUpdate.ExecuteNonQuery();

                //check if record was successfully inserted
                if (added > 0)
                {
                    string peertype = Request.QueryString["peer"];

                    output.InnerHtml = "<div class='SetToCenter'>";
                    output.InnerHtml += "<label id='orderEditSucess'>Đơn hàng đã được cập nhật.</label>";
                    output.InnerHtml += "<br />";
                    if (peertype == "00" || peertype == "10")
                        output.InnerHtml += "<a href='UserOrderRepeater.aspx'>Đi tới Đơn hàng của tôi</a>";
                    else if (peertype == "11")
                        output.InnerHtml += "<a href='AdminOrderRepeater.aspx'>Quay lại Đơn khách hàng</a>";

                    output.InnerHtml += "&nbsp;&nbsp;&nbsp;&nbsp;";
                    output.InnerHtml += "<a href='Home.aspx'>Trang chủ</a>";
                    output.InnerHtml += "</div>";
                }
                else
                {
                    orderUpdateErrorMsg.Text = "Cập nhật đơn hàng không thành công, vui lòng thử lại sau.";
                }
            }
            catch (Exception err)
            {
                orderUpdateErrorMsg.Text = "Lỗi cập nhật đơn hàng <br /> " + err.Message;
            }
            finally
            {
                con.Close();
            }
        }

        private void setCoffee()
        {
            string orderId = Global.OrderId;
            num = short.Parse(orderId);
        }

        private void outputs()
        {
            if (Session["MemberRole"].ToString() == "admin")
            {
                outputStatus.Text += editStatus != null ? editStatus : "";
                outputStatus.Visible = true;
            }
            outputCoffee.Text = editFlavor;
            outputQuantity.Text = editQuantity.ToString();
            outputTopping.Text = editTopping;
            outputAddOns.Text = editAddOns != "" ? editAddOns : "Không";
            outputTotal.Text = "RM " + string.Format("{0:0.00}", totalPrice);
        }
    }
}