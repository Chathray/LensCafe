<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="OrderDeleteConfirm.aspx.cs" Inherits="Order.OrderDeleteConfirm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="outputDelete" runat="server" class="SetToCenter form-bg-color">
        <asp:Label ID="lblDeleteMsg" runat="server" Text="Bạn có chắc chắn muốn xóa đơn đặt hàng này không?" CssClass="OrderLabels"></asp:Label>
        <br />
        <asp:Button ID="submitDelete" runat="server" Text="Chắc chắn" OnClick="submitDelete_Click" CssClass="btnShort"/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" value="Không" onclick="history.go(-1);return false;" class="btnShort">
        <asp:Label ID="deleteErrorMsg" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
