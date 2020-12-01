<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="Order.Logout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-bg-color SetToCenter">
        <asp:Label ID="lblLogout" runat="server" Text="Bạn có chắc chắn bạn muốn thoát?" CssClass="OrderLabels"></asp:Label>
        <br />
        <asp:Button ID="logoutConfirm" runat="server" Text="Đăng xuất" OnClick="logoutConfirm_Click" CssClass="btnShort"/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" value="Không" onclick="history.go(-1);return false;" class="btnShort">
    </div>
</asp:Content>
