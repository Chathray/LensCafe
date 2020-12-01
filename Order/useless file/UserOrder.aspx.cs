using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace Order
{
    public partial class UserOrder : System.Web.UI.Page
    {
        private string connectionString = WebConfigurationManager.ConnectionStrings["userConn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MemberEmail"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            //command
            string userOrderQuery = "select * from Orders where MemberId='" + Session["MemberId"].ToString() + "'";
            SqlCommand cmdUserOrder = new SqlCommand(userOrderQuery, con);

            string img = "";

            //read from DB
            SqlDataReader reader = cmdUserOrder.ExecuteReader();
            while (reader.Read())
            {
                switch (reader["Flavor"].ToString())
                {
                    case "Classic Cappuccino":
                        img = "images/cappuccino/cappuccino.jpg";
                        break;
                    case "Iced Cappuccino":
                        img = "images/cappuccino/iced cappuccino.jpg";
                        break;
                    case "Classic Americano":
                        img = "images/americano/americano.jpg";
                        break;
                    case "Classic Latte":
                        img = "images/latte/latte.jpg";
                        break;
                    case "Vanilla Latte":
                        img = "images/latte/vanilla latte.jpg";
                        break;
                    case "Caramel Latte":
                        img = "images/latte/caramel latte.jpg";
                        break;
                    case "Mocha Latte":
                        img = "images/latte/mocha latte.jpg";
                        break;
                }

                string[] addOnsArray = { reader["BrownSugar"].ToString(), reader["WhiteSugar"].ToString(), reader["Salt"].ToString(), reader["Creamer"].ToString(), reader["Stirrer"].ToString() };
                string addOns = "";

                //loop for Add-Ons
                int index = 1;
                int count = 0;

                for (int i = 0; i < addOnsArray.Length; i++)
                {
                    if (addOnsArray[i] == "1")
                    {
                        count++;
                    }
                }

                for (int i = 0; i < addOnsArray.Length; i++)
                {
                    if (addOnsArray[i] == "1")
                    {
                        switch (i)
                        {
                            case 0:
                                addOns += "Brown Sugar";
                                break;
                            case 1:
                                addOns += "White Sugar";
                                break;
                            case 2:
                                addOns += "Salt";
                                break;
                            case 3:
                                addOns += "Creamer";
                                break;
                            case 4:
                                addOns += "Stirrer";
                                break;
                        }

                        if (index >= 1 && index != count)
                        {
                            addOns += ", ";
                        }

                        index++;
                    }
                }

                orderTable.InnerHtml += "<div class='tm-product'>" +
                                            "<img src='" + img + "' alt='Product' width='136' height='136'>" +
                                            "<div class='tm-product-text'>" +
                                                "<asp:LinkButton ID='orderLinkButton' OnClick='sendOrderID' CommandArgument='" + reader["OrderId"] + "' runat='server'>LinkButton</asp:LinkButton>" +
                                                "<h3 class='tm-product-title'>" + reader["Flavor"].ToString() + "</h3>" +
                                                "<p class='tm-product-description'>Order ID: " + reader["OrderId"].ToString() + "</p>" +
                                                "<p class='tm-product-description'>Quantity: " + reader["Quantity"].ToString() + "</p>" +
                                                "<p class='tm-product-description'>Toppings: " + reader["Topping"].ToString() + "</p>" +
                                                "<p class='tm-product-description'>Add Ons: " + addOns + "</p>" +
                                            "</div>" +
                                            "<div class='tm-product-price'>" +
                                                "<a href = '#' class='tm-product-price-link tm-handwriting-font'>$" + reader["TotalPrice"].ToString() + "</a>" +
                                            "</div>" +
                                        "</div>";
            }

            con.Close();
        }

        protected void sendOrderID(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)(sender);
            string orderId = btn.CommandArgument;
            Global.OrderId = orderId;
            Response.Redirect("UserOrderEdit.aspx");
        }
    }
}