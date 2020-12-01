using System;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Order
{
    public partial class UserOrderEditConfirm : System.Web.UI.Page
    {
        private string connectionString = WebConfigurationManager.ConnectionStrings["userConn"].ConnectionString;

        string editFlavor, editTopping, editAddOns, editStatus;
        int num, orderId, editBrownSugar, editWhiteSugar, editSalt, editCreamer, editStirrer, editQuantity;
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
            editBrownSugar = Convert.ToInt32(Session["editBrownSugar"].ToString());
            editWhiteSugar = Convert.ToInt32(Session["editWhiteSugar"].ToString());
            editSalt = Convert.ToInt32(Session["editSalt"].ToString());
            editCreamer = Convert.ToInt32(Session["editCreamer"].ToString());
            editStirrer = Convert.ToInt32(Session["editStirrer"].ToString());
            totalPrice = Convert.ToDouble(Session["editTotalPrice"].ToString());

            //coffee types
            switch (editFlavor)
            {
                case "Classic Cappuccino":
                    image.ImageUrl = "images/cappuccino/cappuccino.jpg";
                    break;
                case "Iced Cappuccino":
                    image.ImageUrl = "images/cappuccino/iced cappuccino.jpg";
                    break;
                case "Classic Americano":
                    image.ImageUrl = "images/americano/americano.jpg";
                    break;
                case "Classic Latte":
                    image.ImageUrl = "images/latte/latte.jpg";
                    break;
                case "Vanilla Latte":
                    image.ImageUrl = "images/latte/vanilla latte.jpg";
                    break;
                case "Caramel Latte":
                    image.ImageUrl = "images/latte/caramel latte.jpg";
                    break;
                case "Mocha Latte":
                    image.ImageUrl = "images/latte/mocha latte.jpg";
                    break;
            }

            outputs();
        }

        protected void submitConfirm_Click(object sender, EventArgs e)
        {
            setCoffee();
            orderId = num;

            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            string updateQuery = "UPDATE Orders SET Quantity=" + editQuantity + ", ";
            updateQuery += "Topping='" + editTopping + "', ";
            updateQuery += "BrownSugar=" + editBrownSugar + ", ";
            updateQuery += "WhiteSugar=" + editWhiteSugar + ", ";
            updateQuery += "Salt=" + editSalt + ", ";
            updateQuery += "Creamer=" + editCreamer + ", ";
            updateQuery += "Stirrer=" + editStirrer + ", ";

            if (Session["MemberRole"].ToString() == "admin")
            {
                updateQuery += "Status='" + editStatus + "', ";
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
                    output.InnerHtml = "<div class='SetToCenter'>";
                    output.InnerHtml += "<label id='orderEditSucess'>Order has been updated.</label>";
                    output.InnerHtml += "<br />";
                    output.InnerHtml += "<a href='UserOrderRepeater.aspx'>Go to My Orders</a>";
                    output.InnerHtml += "&nbsp;&nbsp;&nbsp;&nbsp;";
                    output.InnerHtml += "<a href='Home.aspx'>Back to Home</a>";
                    output.InnerHtml += "</div>";
                }
                else
                {
                    orderUpdateErrorMsg.Text = "Order update failed, please try again later.";
                }
            }
            catch (Exception err)
            {
                orderUpdateErrorMsg.Text = "Order Update Error <br /> " + err.Message;
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
            outputAddOns.Text = editAddOns != "" ? editAddOns : "None";
            outputTotal.Text = "RM " + string.Format("{0:0.00}", totalPrice);
        }
    }
}