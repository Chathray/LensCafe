<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="AdminUserEdit.aspx.cs" Inherits="Order.AdminUserEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div runat="server" id="outputAdminMember" class="form-bg-color">
        <h1 class="tm-handwriting-font SetToCenter">Thông tin thành viên</h1>
        <br>
        <asp:Label ID="lblMember" runat="server" Text="Member ID: " CssClass="OrderLabels"></asp:Label>
        <asp:Label ID="lblMemberId" runat="server" Text="" CssClass="OrderDetails"></asp:Label>

        <br>
        <br>
        <asp:Label ID="lblMemberUsername" runat="server" Text="Tên thành viên:" CssClass="OrderLabels"></asp:Label>
        <asp:TextBox ID="txtboxUsername" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqUsername" runat="server" ErrorMessage="Vui lòng điền tên người dùng" ControlToValidate="txtboxUsername" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="regExpUsername" runat="server" ControlToValidate="txtboxUsername" ErrorMessage="Ký tự tên người dùng phải nhiều hơn 2" ValidationExpression=".{3}.*" EnableClientScript="False" ForeColor="Red" />
        <asp:CustomValidator ID="customUsername" runat="server" ErrorMessage="Tên người dùng này đã được sử dụng" ForeColor="Red" EnableClientScript="false" ControlToValidate="txtboxUsername" OnServerValidate="customUsername_ServerValidate"></asp:CustomValidator>

        <br />

        <asp:Label ID="lblMemberEmail" runat="server" Text="Email:" CssClass="OrderLabels"></asp:Label>
        <asp:TextBox ID="txtboxEmail" runat="server" TextMode="Email" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqEmail" runat="server" ErrorMessage="Xin vui lòng điền email" ControlToValidate="txtboxEmail" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:CustomValidator ID="customEmail" runat="server" ErrorMessage="Email này đã được sử dụng" ForeColor="Red" EnableClientScript="false" ControlToValidate="txtboxEmail" OnServerValidate="customEmail_ServerValidate"></asp:CustomValidator>

        <br />

        <asp:Label ID="lblMemberPassword" runat="server" Text="Mật khẩu:" CssClass="OrderLabels"></asp:Label>
        <asp:TextBox ID="txtboxPassword" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqPassword" runat="server" ErrorMessage="Vui lòng điền mật khẩu." ControlToValidate="txtboxPassword" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="regExpPassword" runat="server" ControlToValidate="txtboxPassword" ErrorMessage="Độ dài mật khẩu tối thiểu là 8" ValidationExpression=".{8}.*" EnableClientScript="False" ForeColor="Red" />

        <br />

        <asp:Label ID="lblMemberRole" runat="server" Text="Cấp:" CssClass="OrderLabels"></asp:Label>
        <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control"></asp:DropDownList>

        <br />
        <br />

        <asp:Label ID="lblMemberAddress" runat="server" Text="Địa chỉ:" CssClass="OrderLabels"></asp:Label>
        <asp:TextBox ID="txtboxAddress" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqName" runat="server" ErrorMessage="Vui lòng điền địa chỉ." ControlToValidate="txtboxAddress" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>

        <br />

        <asp:Label ID="lblMemberPhone" runat="server" Text="SĐT:" CssClass="OrderLabels"></asp:Label>
        <asp:TextBox ID="txtboxPhone" runat="server" TextMode="Phone" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqPhone" runat="server" ErrorMessage="Vui lòng điền số điện thoại." ControlToValidate="txtboxPhone" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>

        <br />
        <br />

        <asp:Button ID="submitAdminUserEdit" runat="server" Text="Cập nhật" OnClick="submitAdminUserEdit_Click" CssClass="fffxxx submitDiscord" />
        <asp:Button ID="submitUserDelete" runat="server" Text="Xóa" OnClick="submitUserDelete_Click" CssClass="fffxxx submitDiscord" />
        <asp:Button ID="submitCancel" runat="server" Text="Trở về" OnClick="submitCancel_Click" CssClass="fffxxx submitDiscord" />

        <br />

        <asp:Label ID="AdminMemberUpdateErrorMsg" runat="server" Text="" ForeColor="Red"></asp:Label>
    </div>
</asp:Content>
