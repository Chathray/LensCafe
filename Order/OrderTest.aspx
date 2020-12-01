<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="OrderTest.aspx.cs" Inherits="Order.OrderTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-bg-color">
        <h1 class="tm-handwriting-font SetToCenter">Tạo Đơn Hàng</h1>
        <br>
        <asp:Label ID="lblCoffee" runat="server" Text="Coffee:" CssClass="OrderLabels"></asp:Label>
        <asp:DropDownList ID="coffeeType" runat="server" CssClass="inputs">
            <asp:ListItem Value="5.00" Text="Classic Americano">Classic Americano</asp:ListItem>
            <asp:ListItem Value="4.50" Text="Classic Cappuccino">Classic Cappuccino</asp:ListItem>
            <asp:ListItem Value="4.90" Text="Iced Cappuccino">Iced Cappuccino</asp:ListItem>
            <asp:ListItem Value="4.20" Text="Classic Latte">Classic Latte</asp:ListItem>
            <asp:ListItem Value="4.30" Text="Vanilla Latte">Vanilla Latte</asp:ListItem>
            <asp:ListItem Value="4.40" Text="Caramel Latte">Caramel Latte</asp:ListItem>
            <asp:ListItem Value="4.80" Text="Mocha Latte">Mocha Latte</asp:ListItem>
        </asp:DropDownList>
        <br>
        <br>
        <asp:Label ID="lblQuantity" runat="server" Text="Quantity:" CssClass="OrderLabels"></asp:Label>
        <asp:TextBox ID="quantity" runat="server" TextMode="Number" CssClass="inputs"></asp:TextBox>
        <asp:RequiredFieldValidator ID="requiredQuantity" runat="server" ControlToValidate="quantity" EnableClientScript="False" ErrorMessage="Quantity is required!" ForeColor="Coral"></asp:RequiredFieldValidator>
        <br>
        <asp:RangeValidator ID="rangeQuantity" runat="server" ErrorMessage="Number must be 1 to 12" EnableClientScript="False" ControlToValidate="quantity" MaximumValue="12" MinimumValue="1" Type="Integer" ForeColor="Coral"></asp:RangeValidator>
        <br>
        <asp:Label ID="lblTopping" runat="server" Text="Topping:" CssClass="OrderLabels"></asp:Label>
        <asp:RadioButtonList ID="topping" runat="server" CssClass="inputs rblListitems">
            <asp:ListItem Value="2.50" Text="Cinnamon"></asp:ListItem>
            <asp:ListItem Value="3.50" Text="Whipped Cream"></asp:ListItem>
            <asp:ListItem Value="2.00" Text="Nutmeg"></asp:ListItem>
            <asp:ListItem Value="0.00" Text="None"></asp:ListItem>
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator ID="requiredTopping" runat="server" ControlToValidate="topping" EnableClientScript="False" ErrorMessage="Topping is required!" ForeColor="Coral"></asp:RequiredFieldValidator>
        <br>
        <asp:Label ID="lblAddOns" runat="server" Text="Add-Ons:" CssClass="OrderLabels"></asp:Label>
        <asp:CheckBoxList ID="addOns" runat="server" CssClass="inputs rblListitems">
            <asp:ListItem Value="0.50" Text="Brown Sugar"></asp:ListItem>
            <asp:ListItem Value="0.50" Text="White Sugar"></asp:ListItem>
            <asp:ListItem Value="0.50" Text="Salt"></asp:ListItem>
            <asp:ListItem Value="0.50" Text="Creamer"></asp:ListItem>
            <asp:ListItem Value="0.50" Text="Stirrer"></asp:ListItem>
        </asp:CheckBoxList>
        <br>
        <asp:Button ID="submit" runat="server" Text="Next" OnClick="submit_Click" CssClass="submitDiscord" />
        <br>
        <br>
    </div>
</asp:Content>
