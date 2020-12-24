<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="OrderTest.aspx.cs" Inherits="Order.OrderTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-bg-color">
        <h1 class="tm-handwriting-font SetToCenter">Tạo Đơn Hàng</h1>
        <br>
        <asp:Label ID="lblCoffee" runat="server" Text="Tên hàng:" CssClass="OrderLabels"></asp:Label>
        <asp:DropDownList ID="coffeeType" CssClass="form-control" runat="server" />
        <asp:HiddenField ID="hf_ddl" runat="server" Value="0"/>
        <br>
        <br>
        <asp:Label ID="lblQuantity" runat="server" Text="Số lượng:" CssClass="OrderLabels"></asp:Label>
        <asp:TextBox ID="quantity" runat="server" TextMode="Number" Text="1" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="requiredQuantity" runat="server" ControlToValidate="quantity" EnableClientScript="False" ErrorMessage="Bạn phải chọn số lượng" ForeColor="Coral"></asp:RequiredFieldValidator>
        <br>
        <asp:RangeValidator ID="rangeQuantity" runat="server" ErrorMessage="Số lượng phải nằm trong khoảng từ 1 tới 12" EnableClientScript="False" ControlToValidate="quantity" MaximumValue="12" MinimumValue="1" Type="Integer" ForeColor="Coral"></asp:RangeValidator>
        <br>
        <asp:Label ID="lblTopping" runat="server" Text="Lớp phủ:" CssClass="OrderLabels"></asp:Label>
        <asp:RadioButtonList ID="topping" runat="server" CssClass="inputs rblListitems">
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator ID="requiredTopping" runat="server" ControlToValidate="topping" EnableClientScript="False" ErrorMessage="Bạn phải chọn lớp phủ" ForeColor="Coral"></asp:RequiredFieldValidator>
        <br>
        <asp:Label ID="lblAddOns" runat="server" Text="Bổ sung:" CssClass="OrderLabels"></asp:Label>
        <asp:CheckBoxList ID="addOns" runat="server" CssClass="inputs rblListitems">
        </asp:CheckBoxList>
        <br>
        <asp:Button ID="submit" runat="server" Text="Tiếp" OnClick="submit_Click" CssClass="submitDiscord" />
        <br>
        <br>
    </div>
</asp:Content>
