<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="AdminUserDelete.aspx.cs" Inherits="Order.AdminUserDelete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="outputAdminUserDelete" class="form-bg-color SetToCenter" runat="server">
        <asp:Label ID="lblUserDeleteMsg" runat="server" Text="Are you sure you want to delete this user from your Member List?" CssClass="OrderLabels"></asp:Label>
        <br />
        <asp:Button ID="submitUserDelete" runat="server" Text="Yes" OnClick="submitUserDelete_Click" CssClass="btnShort"/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" value="Back" onclick="history.go(-1);return false;" class="btnShort">
        <asp:Label ID="userDeleteErrorMsg" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
