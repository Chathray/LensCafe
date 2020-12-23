using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Order
{
    public partial class OrderTest : Page
    {
        private string connectionString = WebConfigurationManager.ConnectionStrings["userConn"].ConnectionString;

        string sCoffeeType, sQuantity, sTopping, sAddOns;
        int count, index;
        double priceAddOns, priceCoffeeType, priceTopping, priceQuantity, totalPrice;

        protected void Page_Init(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["MemberEmail"] == null)
                {
                    Response.Redirect("Login.aspx");
                }


                coffeeType.DataTextField = topping.DataTextField = addOns.DataTextField = "Name";
                coffeeType.DataValueField = topping.DataValueField = addOns.DataValueField = "Prize";

                coffeeType.DataSource = GetCoffee();
                coffeeType.DataBind();

                topping.DataSource = GetTopping();
                topping.DataBind();
                addOns.DataSource = GetAddOns();
                addOns.DataBind();

                coffeeType.SelectedIndex = 0;
                topping.SelectedIndex = 4;
                addOns.SelectedIndex = 3;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        private DataSet GetTopping()
        {
            SqlConnection con = new SqlConnection(connectionString);
            string q = "select * from Items where Type='TO'";
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
            SqlConnection con = new SqlConnection(connectionString);
            string q = "select * from Items where Type='AO'";
            using (con)
            {
                SqlDataAdapter da = new SqlDataAdapter(q, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds;
            }
        }

        private DataSet GetCoffee()
        {
            SqlConnection con = new SqlConnection(connectionString);
            string q = "select * from Items where Type='CF'";
            using (con)
            {
                SqlDataAdapter da = new SqlDataAdapter(q, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds;
            }
        }


        protected void submit_Click(object sender, EventArgs e)
        {
            if (requiredQuantity.IsValid && rangeQuantity.IsValid && requiredTopping.IsValid)
            {
                sCoffeeType = coffeeType.SelectedItem.Text;
                sQuantity = quantity.Text != null ? quantity.Text : "";
                sTopping = topping.SelectedItem != null ? topping.SelectedItem.Text : "";
                sAddOns = "";
                //loop for Add-Ons
                index = 1;
                foreach (ListItem listDeco in addOns.Items)
                {
                    if (listDeco.Selected)
                    {
                        sAddOns += listDeco.Text;

                        if (index >= 1 && index != count)
                        {
                            sAddOns += ", ";
                        }
                        index++;
                    }
                }
                sAddOns = sAddOns.Remove(sAddOns.Length - 2);

                //calculate total price
                priceCoffeeType = Convert.ToDouble(coffeeType.SelectedValue);
                priceTopping = sTopping != "" ? Convert.ToDouble(topping.SelectedValue) : 0.0;
                priceQuantity = sQuantity != "" ? Convert.ToDouble(sQuantity) : 0.0;
                //loop for Add-Ons price
                count = 0;
                priceAddOns = 0.00;
                for (int i = 0; i < addOns.Items.Count; i++)
                {
                    if (addOns.Items[i].Selected)
                    {
                        priceAddOns += Convert.ToDouble(addOns.Items[i].Value);
                        count++;
                    }
                }

                //(flavor+topping+(decocations)) * quantity
                totalPrice = (priceCoffeeType + priceTopping + priceAddOns) * priceQuantity;

                Session["CoffeeType"] = sCoffeeType;
                Session["priceCoffeeType"] = priceCoffeeType.ToString();
                Session["Quantity"] = sQuantity;
                Session["Topping"] = sTopping;
                Session["AddOns"] = sAddOns;
                Session["TotalPrice"] = totalPrice.ToString();
                Response.Redirect("OrderConfirm.aspx");
            }
        }
    }
}