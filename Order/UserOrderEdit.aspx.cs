using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Order
{
    public partial class UserOrderEdit : System.Web.UI.Page
    {
        private static string connectionString = WebConfigurationManager.ConnectionStrings["userConn"].ConnectionString;
        string BrownSugar, WhiteSugar, Salt, Creamer, Stirrer, sTopping, sFlavor = "", status;

        int num, orderId, intQuantity;
        SqlConnection con = new SqlConnection(connectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["MemberEmail"] == null)
                {
                    Response.Redirect("Login.aspx");
                }

                setCoffee();
                orderId = num;

                if (Session["MemberRole"].ToString() == "admin")
                {
                    con.Open();
                    string checkStatus = "select Status, MemberId from Orders where OrderId='" + orderId + "'";
                    SqlCommand cmdStatus = new SqlCommand(checkStatus, con);
                    SqlDataReader rdr = cmdStatus.ExecuteReader();

                    string dbStatus = "", MemberId = "";

                    while (rdr.Read())
                    {
                        dbStatus = rdr["Status"].ToString();
                        MemberId = rdr["MemberId"].ToString();
                    }
                    con.Close();

                    con.Open();
                    string UserDetailsQuery = "select * from Members where MemberId=" + Convert.ToInt32(MemberId);
                    SqlCommand cmdUserDetails = new SqlCommand(UserDetailsQuery, con);
                    SqlDataReader rdrUser = cmdUserDetails.ExecuteReader();

                    string name = "", username = "", phone = "", email = "";

                    while (rdrUser.Read())
                    {
                        name = rdrUser["MemberName"].ToString();
                        username = rdrUser["MemberUsername"].ToString();
                        phone = rdrUser["MemberPhone"].ToString();
                        email = rdrUser["MemberEmail"].ToString();
                    }

                    con.Close();

                    statusDropDown.Items.Add(new ListItem(dbStatus, dbStatus));
                    statusDropDown.Items.FindByText(dbStatus).Selected = true;
                    switch (dbStatus)
                    {
                        case "Pending":
                            statusDropDown.Items.Add(new ListItem("Confirmed", "Confirmed"));
                            break;
                        case "Confirmed":
                            statusDropDown.Items.Add(new ListItem("Pending", "Pending"));
                            break;
                    }

                    lblUsername.Text += username;
                    lblEmail.Text += email;
                    lblName.Text += name;
                    lblPhone.Text += phone;
                    lblMemberId.Text += MemberId;

                    divAdminOutput.Visible = true;
                    submitDelete.Visible = true;
                    lblStatus.Visible = false;
                }

                con.Open();

                string orderIdQuery = "select * from Orders where OrderId='" + orderId + "'";
                SqlCommand cmdOrderId = new SqlCommand(orderIdQuery, con);

                SqlDataReader reader = cmdOrderId.ExecuteReader();

                //set into order form
                while (reader.Read())
                {
                    status = reader["Status"].ToString();
                    sFlavor = reader["Flavor"].ToString();

                    lblOrderId.Text += reader["OrderId"].ToString();
                    intQuantity = Convert.ToInt32(reader["Quantity"].ToString());

                    sTopping = reader["Topping"].ToString();
                    switch (sTopping)
                    {
                        case "Cinnamon":
                            topping.SelectedIndex = 0;
                            break;
                        case "Whipped Cream":
                            topping.SelectedIndex = 1;
                            break;
                        case "Nutmeg":
                            topping.SelectedIndex = 2;
                            break;
                        case "None":
                            topping.SelectedIndex = 3;
                            break;
                    }

                    BrownSugar = reader["BrownSugar"].ToString();
                    WhiteSugar = reader["WhiteSugar"].ToString();
                    Salt = reader["Salt"].ToString();
                    Creamer = reader["Creamer"].ToString();
                    Stirrer = reader["Stirrer"].ToString();
                }

                con.Close();

                //coffee types
                switch (sFlavor)
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

                lblStatus.Text += status;
                lblCoffeeType.Text += sFlavor;
                quantity.Text = intQuantity.ToString();

                string[] arrayAddOns = { BrownSugar, WhiteSugar, Salt, Creamer, Stirrer };
                for (int i = 0; i < arrayAddOns.Length; i++)
                {
                    if (arrayAddOns[i] == "1")
                    {
                        addOns.Items[i].Selected = true;
                    }
                }

                if (status == "Confirmed" && Session["MemberRole"].ToString() == "user")
                {
                    quantity.ReadOnly = true;
                    topping.Enabled = false;
                    addOns.Enabled = false;
                    submit.Enabled = false;
                    submit.Visible = false;
                    lblMsg.Text = "Your order cannot be edited as it has already been confirmed.";
                    lblMsg.Visible = true;
                }
            }
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            if (requiredQuantity.IsValid && rangeQuantity.IsValid && requiredTopping.IsValid)
            {
                setCoffee();
                orderId = num;

                con.Open();
                string flavorQuery = "select Flavor from Orders where OrderId='" + orderId + "'";
                SqlCommand cmdFlavor = new SqlCommand(flavorQuery, con);

                string editFlavor = cmdFlavor.ExecuteScalar().ToString();
                string editQuantity = quantity.Text != null ? quantity.Text : "";
                string editTopping = topping.SelectedItem != null ? topping.SelectedItem.Text : "";
                string editAddOns = "";
                int editBrownSugar = 0, editWhiteSugar = 0, editSalt = 0, editCreamer = 0, editStirrer = 0;

                con.Close();

                //loop for Add-Ons price and determine Add Ons selected or not
                int count = 0;
                double priceAddOns = 0.00;

                for (int i = 0; i < addOns.Items.Count; i++)
                {
                    if (addOns.Items[i].Selected)
                    {
                        priceAddOns += Convert.ToDouble(addOns.Items[i].Value);
                        count++;

                        switch (i)
                        {
                            case 0:
                                editBrownSugar = 1;
                                break;
                            case 1:
                                editWhiteSugar = 1;
                                break;
                            case 2:
                                editSalt = 1;
                                break;
                            case 3:
                                editCreamer = 1;
                                break;
                            case 4:
                                editStirrer = 1;
                                break;
                        }
                    }
                }

                //loop for adding coma in AddOns
                int index = 1;
                foreach (ListItem listDeco in addOns.Items)
                {
                    if (listDeco.Selected)
                    {
                        editAddOns += listDeco.Text;

                        if (index >= 1 && index != count)
                        {
                            editAddOns += ", ";
                        }

                        index++;
                    }
                }

                //calculate total price
                double priceCoffeeType = 0.00, priceTopping, priceQuantity, totalPrice;

                switch (editFlavor)
                {
                    case "Classic Americano":
                        priceCoffeeType = 5.00;
                        break;
                    case "Classic Cappuccino":
                        priceCoffeeType = 4.50;
                        break;
                    case "Iced Cappuccino":
                        priceCoffeeType = 4.90;
                        break;
                    case "Classic Latte":
                        priceCoffeeType = 4.20;
                        break;
                    case "Vanilla Latte":
                        priceCoffeeType = 4.30;
                        break;
                    case "Caramel Latte":
                        priceCoffeeType = 4.40;
                        break;
                    case "Mocha Latte":
                        priceCoffeeType = 4.80;
                        break;
                }

                priceTopping = editTopping != "" ? Convert.ToDouble(topping.SelectedValue) : 0.0;
                priceQuantity = editQuantity != "" ? Convert.ToDouble(editQuantity) : 0.0;

                //(flavor+topping+(decocations)) * quantity
                totalPrice = (priceCoffeeType + priceTopping + priceAddOns) * priceQuantity;

                Session["editFlavor"] = editFlavor;
                Session["editQuantity"] = editQuantity;
                Session["editTopping"] = editTopping;
                Session["editAddOns"] = editAddOns;
                Session["editBrownSugar"] = editBrownSugar;
                Session["editWhiteSugar"] = editWhiteSugar;
                Session["editSalt"] = editSalt;
                Session["editCreamer"] = editCreamer;
                Session["editStirrer"] = editStirrer;
                Session["editTotalPrice"] = totalPrice.ToString();

                if (Session["MemberRole"].ToString() == "admin")
                {
                    Session["editStatus"] = statusDropDown.SelectedValue.ToString();
                }

                Server.Transfer("UserOrderEditConfirm.aspx");
            }
        }

        protected void submitDelete_Click(object sender, EventArgs e)
        {
            string peertype = Request.QueryString["peertype"];

            Response.Redirect("OrderDeleteConfirm.aspx?peertype=" + peertype);
        }

        private void setCoffee()
        {
            string orderId = Global.OrderId;
            num = short.Parse(orderId);
        }
    }
}