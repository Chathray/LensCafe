<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="UserPasswordEdit.aspx.cs" Inherits="Order.UserPasswordEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="tm-section row AlignContent">
        <div>
            <div class="col-lg-3 col-md-3 ToLeftSide">
                <div class="tm-position-relative margin-bottom-30">
                    <a id="btnEditProfile" runat="server" href="UserProfileEdit.aspx">Tài khoản</a>
                    <hr class="tm-hr">
                    <a id="btnEditPassword" runat="server" class="profileActive" href="UserPasswordEdit.aspx">Bảo mật</a>
                </div>
            </div>
            <div id="menuContent" runat="server" class="tm-menu-product-content col-lg-9 col-md-9 form-bg-color ToRightSide"> <!-- menu content -->
                <asp:Label ID="lblCurrentPassword" runat="server" Text="Mật khẩu hiện tại:" CssClass="OrderLabels"></asp:Label>
                <asp:TextBox ID="txtboxCurrentPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqCurrentPassword" runat="server" ErrorMessage="Bạn phải nhập mật khẩu" ControlToValidate="txtboxCurrentPassword" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regExpCurrentPassword" runat="server" ControlToValidate="txtboxCurrentPassword" ErrorMessage="Độ dài mật khẩu tối thiểu là 8" ValidationExpression=".{8}.*" EnableClientScript="False" ForeColor="Red" />

                <br />

                <asp:Label ID="lblNewPassword" runat="server" Text="Mật khẩu mới:" CssClass="OrderLabels"></asp:Label>
                <asp:TextBox ID="txtboxNewPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqNewPassword" runat="server" ErrorMessage="Mật khẩu mới là bắt buộc" ControlToValidate="txtboxNewPassword" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regExpNewPassword" runat="server" ControlToValidate="txtboxNewPassword" ErrorMessage="Độ dài mật khẩu tối thiểu là 8" ValidationExpression=".{8}.*" EnableClientScript="False" ForeColor="Red" />

                <br />

                <asp:Label ID="lblConfirmPassword" runat="server" Text="Xác nhận lại:" CssClass="OrderLabels"></asp:Label>
                <asp:TextBox ID="txtboxConfirmPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqConfirmPassword" runat="server" ErrorMessage="Xác nhận mật khẩu mới là bắt buộc" ControlToValidate="txtboxConfirmPassword" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="compareConfirmPassword" runat="server" ErrorMessage="Xác nhận mật khẩu mới phải giống với mật khẩu mới" ControlToValidate="txtboxConfirmPassword" EnableClientScript="False" ForeColor="Red" ControlToCompare="txtboxNewPassword"></asp:CompareValidator>

                <br />

                <asp:Button ID="submitChangePW" runat="server" Text="Cập nhật" OnClick="submitChangePW_Click" CssClass="submitDiscord"/>

                <br />

                <asp:Label ID="lblMsg" runat="server" Text="" ForeColor="Red"></asp:Label>
                <br>
            </div>
        </div>
    </section>
</asp:Content>
