﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="UserOrderRepeater.aspx.cs" Inherits="Order.UserOrderRepeater" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-bg-color-repeater">
        <h1 class="tm-handwriting-font SetToCenter">Đơn hàng của tôi</h1>
        <br>
        <div id="orderTable" runat="server" class="tm-menu-product-content">
            <!-- menu content -->
            <asp:Repeater ID="repeaterOrder" runat="server">
                <ItemTemplate>

                    <div class='tm-product-repeater'>
                        <asp:Image ID="coffeeImage" ImageUrl='<%# GetImage(Eval("Flavor").ToString()) %>' runat="server" CssClass="img-order" />
                        <div class='tm-product-text OrderRepeaterDetails'>
                            <asp:LinkButton ID="orderLinkButton" runat="server" CommandArgument='<%# Eval("OrderId").ToString() %>' OnClick="sendOrderID">
                                <h3 class="tm-product-title"><%# Eval("Flavor") %></h3>
                            </asp:LinkButton>
                            <p class='tm-product-description'>Mã đơn hàng: <%# Eval("OrderId") %></p>
                            <p class='tm-product-description'>Trạng thái: <%# Eval("Status") %></p>
                            <p class='tm-product-description'>Số lượng: <%# Eval("Quantity") %></p>
                            <p class='tm-product-description'>Lớp phủ: <%# Eval("Topping") %></p>
                            <p id="pAddOns" class='tm-product-description'>Bổ sung: <%# Eval("AddOns") %></p>
                        </div>
                        <div class='tm-product-price'>
                            <h4 class='tm-product-price-link tm-handwriting-font text-center'>$<%# Eval("TotalPrice") %></h4>
                        </div>
                    </div>

                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
