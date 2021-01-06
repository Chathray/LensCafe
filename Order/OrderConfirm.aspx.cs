using System;
using System.Data.SqlClient;

namespace Order
{
    public partial class OrderConfirm : System.Web.UI.Page
    {
        string sCoffeeType, sQuantity, sTopping, sAddOns, timeAt;
        double totalPrice;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MemberEmail"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            sCoffeeType = Session["CoffeeType"].ToString();
            sQuantity = Session["Quantity"].ToString();
            sTopping = Session["Topping"].ToString();
            sAddOns = Session["AddOns"].ToString();
            if (sAddOns == "") sAddOns = "Không";
            totalPrice = Convert.ToDouble(Session["TotalPrice"].ToString());

            DateTime myDateTime = DateTime.Now;
            timeAt = myDateTime.ToString("yyyy-MM-dd HH:mm:ss.fff");

            //coffee types
            image.ImageUrl = "images/" + sCoffeeType + ".jpg";
            outputs();
        }

        protected void submitConfirm_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(Global.connectionString);
            con.Open();

            string insertData = "INSERT INTO Orders (MemberId, Flavor, Quantity, Topping, AddOns, TotalPrice, Time, Status)";
            insertData += "VALUES ('";
            insertData += Session["MemberId"].ToString() + "', N'";
            insertData += sCoffeeType + "', '";
            insertData += Convert.ToInt32(sQuantity) + "', N'";
            insertData += sTopping + "', N'";
            insertData += sAddOns + "', '";
            insertData += totalPrice + "', '";
            insertData += timeAt + "', N'";
            insertData += "Đang xử lý')";

            SqlCommand cmdInsertData = new SqlCommand(insertData, con);
            int added = 0;

            try
            {
                added = cmdInsertData.ExecuteNonQuery();

                //check if record was successfully inserted
                if (added > 0)
                {
                    output.InnerHtml = "<div class='SetToCenter'>";
                    output.InnerHtml += "<label id='orderSucess'>Đơn hàng của bạn đã được đặt, cảm ơn bạn.</label>";
                    output.InnerHtml += "<br />";
                    output.InnerHtml += "<a href='Home.aspx'>Trang chủ</a>";
                    output.InnerHtml += "&nbsp;&nbsp;&nbsp;&nbsp;";
                    output.InnerHtml += "<a href='UserOrderRepeater.aspx'>Đi tới Đơn hàng của tôi</a>";
                    output.InnerHtml += "</div>";
                }
                else
                {
                    orderErrorMsg.Text = "Đặt hàng không thành công, vui lòng thử lại sau.";
                }
            }
            catch (Exception err)
            {
                orderErrorMsg.Text = "Lỗi đơn hàng <br /> " + err.Message;
            }
            finally
            {
                con.Close();
            }
        }

        private void outputs()
        {
            outputCoffee.Text = sCoffeeType;
            outputQuantity.Text = sQuantity;
            outputTopping.Text = sTopping;
            outputAddOns.Text = sAddOns != "" ? sAddOns : "Không";
            outputTotal.Text = "RM " + string.Format("{0:0.00}", totalPrice);
        }
    }
}