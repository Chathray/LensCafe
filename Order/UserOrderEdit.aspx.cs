using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Order
{
    public partial class UserOrderEdit : Page
    {
        string sAddOns, sTopping, sFlavor = "", status, peertype;

        int num, orderId, intQuantity;
        SqlConnection con = new SqlConnection(Global.connectionString);

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
                        name = rdrUser["MemberAddress"].ToString();
                        username = rdrUser["MemberUsername"].ToString();
                        phone = rdrUser["MemberPhone"].ToString();
                        email = rdrUser["MemberEmail"].ToString();
                    }

                    con.Close();

                    statusDropDown.Items.Add(new ListItem(dbStatus, dbStatus));
                    statusDropDown.Items.FindByText(dbStatus).Selected = true;
                    switch (dbStatus)
                    {
                        case "Đang chờ":
                            statusDropDown.Items.Add(new ListItem("Đã thanh toán", "Đã thanh toán"));
                            statusDropDown.Items.Add(new ListItem("Đã hủy", "Đã hủy"));
                            break;
                        case "Đã thanh toán":
                            statusDropDown.Items.Add(new ListItem("Đang chờ", "Đang chờ"));
                            statusDropDown.Items.Add(new ListItem("Đã hủy", "Đã hủy"));
                            break;
                        case "Đã hủy":
                            statusDropDown.Items.Add(new ListItem("Đã thanh toán", "Đã thanh toán"));
                            statusDropDown.Items.Add(new ListItem("Đang chờ", "Đang chờ"));
                            break;
                    }

                    lblUsername.Text += username;
                    lblEmail.Text += email;
                    lblAddress.Text += name;
                    lblPhone.Text += phone;
                    lblMemberId.Text += MemberId;

                    divAdminOutput.Visible = true;
                    submitDelete.Visible = true;
                    lblStatus.Visible = false;
                }

                topping.DataTextField = addOns.DataTextField = "Name";
                topping.DataValueField = addOns.DataValueField = "Prize";
                topping.DataSource = GetTopping();
                addOns.DataSource = GetAddOns();
                topping.DataBind();
                addOns.DataBind();

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
                    topping.Items.FindByText(sTopping).Selected = true;

                    sAddOns = reader["AddOns"].ToString();
                    var reLst = sAddOns.Split(',');
                    foreach (ListItem listDeco in addOns.Items)
                    {
                        foreach (string s in reLst)
                        {
                            if (listDeco.Text == s.Trim())
                            {
                                listDeco.Selected = true;
                                break;
                            }
                        }
                    }
                }

                con.Close();

                //coffee types
                image.ImageUrl = "images/" + sFlavor + ".jpg";

                lblStatus.Text += status;
                lblCoffeeType.Text += sFlavor;
                quantity.Text = intQuantity.ToString();


                if (status == "Đã thanh toán" && Session["MemberRole"].ToString() == "user")
                {
                    quantity.ReadOnly = true;
                    topping.Enabled = false;
                    addOns.Enabled = false;
                    submit.Enabled = false;
                    submit.Visible = false;
                    lblMsg.Text = "Không thể chỉnh sửa đơn đặt hàng của bạn vì nó đã được xác nhận.";
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
                double priceCoffeeType, priceTopping, priceQuantity, totalPrice;
                priceCoffeeType = Convert.ToDouble(Session["priceCoffeeType"]);
                priceTopping = editTopping != "" ? Convert.ToDouble(topping.SelectedValue) : 0.0;
                priceQuantity = editQuantity != "" ? Convert.ToDouble(editQuantity) : 0.0;

                //(flavor+topping+(decocations)) * quantity
                totalPrice = (priceCoffeeType + priceTopping + priceAddOns) * priceQuantity;

                Session["editFlavor"] = editFlavor;
                Session["editQuantity"] = editQuantity;
                Session["editTopping"] = editTopping;
                Session["editAddOns"] = editAddOns;
                Session["editTotalPrice"] = totalPrice.ToString();
                
                if (Session["MemberRole"].ToString() == "admin")
                {
                    Session["editStatus"] = statusDropDown.SelectedValue.ToString();
                }
                peertype = Request.QueryString["peer"];
                Server.Transfer("UserOrderEditConfirm.aspx?peer=" + peertype);
            }
        }

        protected void submitDelete_Click(object sender, EventArgs e)
        {
            peertype = Request.QueryString["peer"];
            Response.Redirect("OrderDeleteConfirm.aspx?peer=" + peertype);
        }

        private void setCoffee()
        {
            string orderId = Global.OrderId;
            num = short.Parse(orderId);
        }

        private DataSet GetTopping()
        {
            SqlConnection con = new SqlConnection(Global.connectionString);
            string q = "select * from Optional where Type='TO'";
            using (con)
            {
                SqlDataAdapter da = new SqlDataAdapter(q, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds;
            }
        }

        private DataSet GetAddOns()
        {
            SqlConnection con = new SqlConnection(Global.connectionString);
            string q = "select * from Optional where Type='AO'";
            using (con)
            {
                SqlDataAdapter da = new SqlDataAdapter(q, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds;
            }
        }
    }
}