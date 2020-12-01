<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Order.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-bg-color">
        <h1 class="tm-handwriting-font SetToCenter">Đăng Nhập</h1>
        <br>
        <asp:Label ID="lblLoginEmail" runat="server" Text="Email:" CssClass="OrderLabels"></asp:Label>
        <asp:TextBox ID="loginEmail" runat="server" TextMode="Email" CssClass="inputs"></asp:TextBox>
        <br>
        <asp:RequiredFieldValidator ID="reqLoginEmail" runat="server" ErrorMessage="Email không được để trống!" EnableClientScript="False" ControlToValidate="loginEmail" ForeColor="Coral"></asp:RequiredFieldValidator>
        <br>
        <asp:Label ID="lblLoginPassword" runat="server" Text="Mật khẩu:" CssClass="OrderLabels"></asp:Label>
        <asp:TextBox ID="loginPassword" runat="server" TextMode="Password" CssClass="inputs"></asp:TextBox>
        <br>
        <asp:RequiredFieldValidator ID="reqLoginPassword" runat="server" ErrorMessage="Mật khẩu không được để trống!" EnableClientScript="False" ControlToValidate="loginEmail" ForeColor="Coral"></asp:RequiredFieldValidator>
        <br>
        <br>
        <asp:Button ID="submitLogin" runat="server" Text="Đăng nhập" OnClick="submitLogin_Click" CssClass="submitDiscord" />
        <br>
        <br>
        <asp:Label ID="loginErrorMsg" runat="server" Text="" ForeColor="White" CssClass="btn-danger"></asp:Label>
    </div>
</asp:Content>
