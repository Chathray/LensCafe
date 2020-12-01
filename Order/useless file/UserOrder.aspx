<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="UserOrder.aspx.cs" Inherits="Order.UserOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="orderTable" runat="server" class="tm-menu-product-content col-lg-9 col-md-9"> <!-- menu content -->
        <asp:Repeater ID="repeaterOrder" runat="server">
            <ItemTemplate>

                <div class='tm-product'>
                    <asp:Image ID="imgCoffee"/>
                    <div class='tm-product-text'>
                        <asp:LinkButton ID='orderLinkButton' OnClick='sendOrderID' CommandArgument='' runat='server'>LinkButton</asp:LinkButton>
                        <h3 class='tm-product-title'><% #Eval("Flavor") %></h3>"
                        <p class='tm-product-description'>Order ID: <% #Eval("OrderId") %></p>
                        <p class='tm-product-description'>Quantity: <% #Eval("Quantity") %></p>
                        <p class='tm-product-description'>Toppings: <% #Eval("Topping") %></p>
                        <p id="pAddOns" class='tm-product-description'>Add Ons: </p>
                    </div>
                    <div class='tm-product-price'>
                        <a href = '#' class='tm-product-price-link tm-handwriting-font'>$</a>
                    </div>
                </div>

            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>