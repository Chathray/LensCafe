using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Order
{
    public partial class OrderTest : Page
    {
        string sCoffeeType, sQuantity, sTopping, sAddOns;
        int count, index;
        double priceAddOns, priceCoffeeType, priceTopping, priceQuantity, totalPrice;

        protected void Page_Init(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["MemberEmail"] == null)
                {
                    Server.Transfer("Login.aspx");
                }

                coffeeType.DataTextField = topping.DataTextField = addOns.DataTextField = "Name";
                coffeeType.DataValueField = topping.DataValueField = addOns.DataValueField = "Prize";

                coffeeType.DataSource = GetCoffee();
                coffeeType.Items.Clear();
                coffeeType.DataBind();

                topping.DataSource = GetTopping();
                topping.DataBind();

                addOns.DataSource = GetAddOns();
                addOns.DataBind();

                _ = int.TryParse(Request.QueryString["cot"], out int si);
                coffeeType.SelectedIndex = si;

                topping.SelectedIndex = 4;
                addOns.SelectedIndex = 3;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        private DataSet GetTopping()
        {
            SqlConnection con = new SqlConnection(Global.connectionString);
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
            SqlConnection con = new SqlConnection(Global.connectionString);
            string q = "select * from Items where Type='AO'";
            using (con)
            {
                SqlDataAdapter da = new SqlDataAdapter(q, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds;
            }
        }

        private ICollection GetCoffee()
        {
            SqlConnection con = new SqlConnection(Global.connectionString);
            string q = "select Name,Prize from Items where Type='CF' ORDER BY Category";
            using (con)
            {
                SqlDataAdapter da = new SqlDataAdapter(q, con);
                DataSet ds = new DataSet();
                da.Fill(ds);

                var view = new DataView(ds.Tables[0]);

                return view;
            }
        }


        protected void submit_Click(object sender, EventArgs e)
        {
            if (requiredQuantity.IsValid && rangeQuantity.IsValid && requiredTopping.IsValid)
            {
                // Giải pháp tạm thời: sử dụng js để lưu giá trị index
                index = Convert.ToInt32(hf_ddl.Value);
                sCoffeeType = coffeeType.Items[index].Text;

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
                sAddOns = sAddOns != "" ? sAddOns.Remove(sAddOns.Length - 2) : "";

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
                Server.Transfer("OrderConfirm.aspx");
            }
        }
    }
}