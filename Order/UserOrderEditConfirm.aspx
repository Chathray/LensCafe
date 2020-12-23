<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="UserOrderEditConfirm.aspx.cs" Inherits="Order.UserOrderEditConfirm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="output" runat="server" class="form-bg-color">
        <h1 class="tm-handwriting-font SetToCenter">Cập nhật đơn hàng</h1>

        <br />

        <div class="SetToCenter">
            <asp:Label ID="lblMsg" runat="server" Text="Vui lòng kiểm tra kỹ trước khi cập nhật đơn đặt hàng của bạn." CssClass="OrderLabels"></asp:Label>

            <br />
            <br />
            <br />

            <asp:Image ID="image" runat="server" CssClass="img-confirm" />
        </div>



        <asp:Label ID="outputStatus" runat="server" Text="Trạng thái: " Visible="false" CssClass="OrderLabels"></asp:Label>

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

        <asp:Label ID="lblTotal" Text="Tổng cộng:" runat="server" CssClass="OrderLabels"></asp:Label>
        <asp:Label ID="outputTotal" runat="server" CssClass="OrderDetails"></asp:Label>

        <br />
        <br>

        <asp:Button ID="submitEditConfirm" runat="server" Text="Xác nhận" OnClick="submitConfirm_Click" CssClass="submitDiscord" />
       <br>
        <br>
        <input type="button" value="Trở về" onclick="history.go(-1);return false;" class="submitDiscord">

        <br />

        <asp:Label ID="orderUpdateErrorMsg" runat="server" Text=""></asp:Label>
        <br>
        <br>
    </div>
</asp:Content>
