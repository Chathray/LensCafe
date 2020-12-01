using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Order
{
    public partial class OrderTest : System.Web.UI.Page
    {
        string sCoffeeType, sQuantity, sTopping, sAddOns;
        int count, index, BrownSugar = 0, WhiteSugar = 0, Salt = 0, Creamer = 0, Stirrer = 0;
        double priceAddOns, priceCoffeeType, priceTopping, priceQuantity, totalPrice;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MemberEmail"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            Page.MaintainScrollPositionOnPostBack = true;
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            if (requiredQuantity.IsValid && rangeQuantity.IsValid && requiredTopping.IsValid)
            {
                sCoffeeType = coffeeType.SelectedItem.Text;
                sQuantity = quantity.Text != null ? quantity.Text : "";
                sTopping = topping.SelectedItem != null ? topping.SelectedItem.Text : "";
                sAddOns = "";

                //loop for Add-Ons price
                count = 0;
                priceAddOns = 0.00;
                for (int i = 0; i < addOns.Items.Count; i++)
                {
                    if (addOns.Items[i].Selected)
                    {
                        priceAddOns += Convert.ToDouble(addOns.Items[i].Value);
                        count++;

                        switch (i)
                        {
                            case 0:
                                BrownSugar = 1;
                                break;
                            case 1:
                                WhiteSugar = 1;
                                break;
                            case 2:
                                Salt = 1;
                                break;
                            case 3:
                                Creamer = 1;
                                break;
                            case 4:
                                Stirrer = 1;
                                break;
                        }
                    }
                }

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

                //calculate total price
                priceCoffeeType = Convert.ToDouble(coffeeType.SelectedValue);
                priceTopping = sTopping != "" ? Convert.ToDouble(topping.SelectedValue) : 0.0;
                priceQuantity = sQuantity != "" ? Convert.ToDouble(sQuantity) : 0.0;

                //(flavor+topping+(decocations)) * quantity
                totalPrice = (priceCoffeeType + priceTopping + priceAddOns) * priceQuantity;

                Session["CoffeeType"] = sCoffeeType;
                Session["Quantity"] = sQuantity;
                Session["Topping"] = sTopping;
                Session["AddOns"] = sAddOns;
                Session["BrownSugar"] = BrownSugar;
                Session["WhiteSugar"] = WhiteSugar;
                Session["Salt"] = Salt;
                Session["Creamer"] = Creamer;
                Session["Stirrer"] = Stirrer;
                Session["TotalPrice"] = totalPrice.ToString();
                Server.Transfer("OrderConfirm.aspx");
            }
        }
    }
}