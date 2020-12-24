<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Order.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-bg-color">
        <asp:Label ID="lblRegUsername" runat="server" Text="Tên tài khoản:" CssClass="OrderLabels"></asp:Label>
        <asp:TextBox ID="regUsername" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqRegUsername" runat="server" ErrorMessage="Phải nhập tên tài khoản" ControlToValidate="regUsername" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="regRegUsername" runat="server" ControlToValidate="regUsername" ErrorMessage="Ký tự tên người dùng phải nhiều hơn 2" ValidationExpression=".{3}.*" EnableClientScript="False" ForeColor="Red" />
        <asp:Label ID="regErrorUsername" runat="server" Text="" ForeColor="Red"></asp:Label>
        <br>
        <asp:Label ID="lblRegEmail" runat="server" Text="Email:" CssClass="OrderLabels"></asp:Label>
        <asp:TextBox ID="regEmail" runat="server" TextMode="Email" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqRegEmail" runat="server" ErrorMessage="Phải nhập Email" ControlToValidate="regEmail" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:Label ID="regErrorEmail" runat="server" Text="" ForeColor="Red"></asp:Label>
        <br>
        <asp:Label ID="lblRegPassword" runat="server" Text="Mật khẩu:" CssClass="OrderLabels"></asp:Label>
        <asp:TextBox ID="regPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqRegPassword" runat="server" ErrorMessage="Phải nhập mật khẩu" ControlToValidate="regPassword" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="regRegPassword" runat="server" ControlToValidate="regPassword" ErrorMessage="Độ dài mật khẩu tối thiểu là 8" ValidationExpression=".{8}.*" EnableClientScript="False" ForeColor="Red" />
        <br>
        <asp:Label ID="lblRegConfirmPassword" runat="server" Text="Xác nhận mật khẩu:" CssClass="OrderLabels"></asp:Label>
        <asp:TextBox ID="regConfirmPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqRegConfirmPassword" runat="server" ErrorMessage="Vui lòng nhập lại mật khẩu của bạn." ControlToValidate="regConfirmPassword" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="compareRegConfirmPassword" runat="server" ErrorMessage="Xác nhận Mật khẩu phải giống với Mật khẩu" ControlToValidate="regConfirmPassword" EnableClientScript="False" ForeColor="Red" ControlToCompare="regPassword"></asp:CompareValidator>
        <br>
        <asp:Label ID="lblRegName" runat="server" Text="Địa chỉ:" CssClass="OrderLabels"></asp:Label>
        <asp:TextBox ID="regName" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqRegName" runat="server" ErrorMessage="Phải nhập địa chỉ" ControlToValidate="regName" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>
        <br>
        <asp:Label ID="lblRegPhone" runat="server" Text="Số điện thoại:" CssClass="OrderLabels"></asp:Label>
        <asp:TextBox ID="regPhone" runat="server" TextMode="Phone" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqRegPhone" runat="server" ErrorMessage="Phải nhập số điện thoại" ControlToValidate="regPhone" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>
        <br>
        <br>
        <asp:Button ID="submitReg" runat="server" Text="Đăng ký" OnClick="submitReg_Click" CssClass="submitDiscord" />
        <br>
        <br>
        <asp:Label ID="regErrorMsg" runat="server" Text="" ForeColor="Red"></asp:Label>
    </div>
</asp:Content>
