<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="UserProfileEdit.aspx.cs" Inherits="Order.UserProfileEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="tm-section-row AlignContent">
        <div>
            <div class="col-lg-3 col-md-3 ToLeftSide">
                <div class="tm-position-relative margin-bottom-30">
                    <a id="btnEditProfile" runat="server" class="profileActive" href="UserProfileEdit.aspx">Tài khoản</a>
                    <hr class="tm-hr">
                    <a id="btnEditPassword" runat="server" href="UserPasswordEdit.aspx">Bảo mật</a>
                </div>
            </div>
            <div id="menuContent" runat="server" class="col-lg-9 col-md-9 form-bg-color ToRightSide">
                <!-- menu content -->
                <asp:Label ID="lblEmailDisplay" runat="server" Text="Email:" CssClass="OrderLabels"></asp:Label>
                <asp:Label ID="lblEmail" runat="server" Text="" CssClass="OrderDetails"></asp:Label>

                <br />
                <br />

                <asp:Label ID="lblUsernameDisplay" runat="server" Text="Tài khoản:" CssClass="OrderLabels"></asp:Label>
                <asp:TextBox ID="txtboxUsername" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqUsername" runat="server" ErrorMessage="Vui lòng điền tên người dùng" ControlToValidate="txtboxUsername" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regExpUsername" runat="server" ControlToValidate="txtboxUsername" ErrorMessage="Ký tự tên người dùng phải nhiều hơn 2" ValidationExpression=".{3}.*" EnableClientScript="False" ForeColor="Red" />
                <asp:CustomValidator ID="customUsername" runat="server" ErrorMessage="Tên người dùng này đã được sử dụng" ForeColor="Red" EnableClientScript="false" ControlToValidate="txtboxUsername" OnServerValidate="customUsername_ServerValidate"></asp:CustomValidator>

                <br />

                <asp:Label ID="lblName" runat="server" Text="Địa chỉ:" CssClass="OrderLabels"></asp:Label>
                <asp:TextBox ID="txtboxAddress" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqName" runat="server" ErrorMessage="Vui lòng điền tên." ControlToValidate="txtboxAddress" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>

                <br />

                <asp:Label ID="lblPhone" runat="server" Text="Di động:" CssClass="OrderLabels"></asp:Label>
                <asp:TextBox ID="txtboxPhone" runat="server" TextMode="Phone" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqPhone" runat="server" ErrorMessage="Vui lòng điền số điện thoại." ControlToValidate="txtboxPhone" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>

                <br />
                <br />

                <asp:Button ID="submitSave" runat="server" Text="Lưu thay đổi" OnClick="submitSave_Click" CssClass="submitDiscord" />

                <br />

                <asp:Label ID="lblMsg" runat="server" Text="" ForeColor="Red"></asp:Label>
                <br>
            </div>
        </div>
    </section>
</asp:Content>
