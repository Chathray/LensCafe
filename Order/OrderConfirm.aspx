<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="OrderConfirm.aspx.cs" Inherits="Order.OrderConfirm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="output" runat="server" class="form-bg-color">
        <div class="SetToCenter">
            <h1 class="tm-handwriting-font SetToCenter">Tạo Đơn Hàng</h1>
            <br />
            <asp:Image ID="image" runat="server" CssClass="img-confirm" />
        </div>
        <br />
        <br />

        <asp:Label ID="lblCoffee" runat="server" Text="Loại Coffee:" CssClass="OrderLabels"></asp:Label>
        <asp:Label ID="outputCoffee" runat="server" CssClass="OrderDetails"></asp:Label>
        <br />
        <br />

        <asp:Label ID="lblQuantity" runat="server" Text="Số lượng:" CssClass="OrderLabels"></asp:Label>
        <asp:Label ID="outputQuantity" runat="server" CssClass="OrderDetails"></asp:Label>
        <br />
        <br />

        <asp:Label ID="lblTopping" runat="server" Text="Lớp phủ:" CssClass="OrderLabels"></asp:Label>
        <asp:Label ID="outputTopping" runat="server" CssClass="OrderDetails"></asp:Label>
        <br />
        <br />

        <asp:Label ID="lblAddOns" runat="server" Text="Bổ sung:" CssClass="OrderLabels"></asp:Label>
        <asp:Label ID="outputAddOns" runat="server" CssClass="OrderDetails"></asp:Label>
        <br />
        <br />

        <asp:Label ID="lblTotalPrice" runat="server" Text="Tổng cộng:" CssClass="OrderLabels"></asp:Label>
        <asp:Label ID="outputTotal" runat="server" CssClass="OrderDetails"></asp:Label>
        <br />
        <br />

        <asp:Button ID="submitConfirm" runat="server" Text="Xác nhận" OnClick="submitConfirm_Click" CssClass="submitDiscord fffxxx" />
        <input type="button" value="Trở về" onclick="history.go(-1);return false;" class="submitDiscord">

        <br>
        <br>

        <asp:Label ID="orderErrorMsg" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
