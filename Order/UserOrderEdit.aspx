<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="UserOrderEdit.aspx.cs" Inherits="Order.UserOrderEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="divOutput" runat="server" class="form-bg-color">
        <div class="SetToCenter">
            <h1 class="tm-handwriting-font SetToCenter">Chi tiết đơn hàng</h1>

            <asp:Label runat="server" Text="" ID="lblMsg" Visible="false" CssClass="OrderLabels"></asp:Label>
            <br />
            <br />

            <asp:Image ID="image" runat="server" CssClass="img-confirm" />
        </div>

        <br />
        <br />

        <asp:Label runat="server" Text="Mã đơn hàng: " ID="lblOrderId" CssClass="OrderLabels"></asp:Label>

        <br />

        <asp:Label runat="server" Text="Trạng thái: " ID="lblStatus" CssClass="OrderLabels"></asp:Label>

        <br />

        <div id="divAdminOutput" runat="server" visible="false">
            <table>
                <tr>
                    <td>
                        <asp:Label runat="server" Text="Tên tài khoản: " ID="lblUsernameDisplay" CssClass="OrderLabels"></asp:Label>
                    </td>
                    <td class="tableOrderDetails">
                        <asp:Label runat="server" Text="" ID="lblUsername" CssClass="OrderLabels"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" Text="Email: " ID="lblEmailDisplay" CssClass="OrderLabels"></asp:Label>
                    </td>
                    <td class="tableOrderDetails">
                        <asp:Label runat="server" Text="" ID="lblEmail" CssClass="OrderLabels"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" Text="Địa chỉ: " ID="lblNameDisplay" CssClass="OrderLabels"></asp:Label>
                    </td>
                    <td class="tableOrderDetails">
                        <asp:Label runat="server" Text="" ID="lblName" CssClass="OrderLabels"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" Text="Số điện thoại: " ID="lblPhoneDisplay" CssClass="OrderLabels"></asp:Label>
                    </td>
                    <td class="tableOrderDetails">
                        <asp:Label runat="server" Text="" ID="lblPhone" CssClass="OrderLabels"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" Text="Mã khách hàng: " ID="lblMemberIdDisplay" CssClass="OrderLabels"></asp:Label>
                    </td>
                    <td class="tableOrderDetails">
                        <asp:Label runat="server" Text="" ID="lblMemberId" CssClass="OrderLabels"></asp:Label>
                    </td>
                </tr>
            </table>

            <br />
            <br />

            <asp:Label runat="server" Text="Trạng thái: " ID="lblStatusAdmin" CssClass="OrderLabels"></asp:Label>
            <asp:DropDownList ID="statusDropDown" runat="server" CssClass="form-control">
            </asp:DropDownList>
        </div>

        <br />
        <br />

        <asp:Label runat="server" Text="Loại Coffee:" ID="lblCoffee" CssClass="OrderLabels"></asp:Label>
        <asp:Label runat="server" Text="" ID="lblCoffeeType" CssClass="OrderDetails"></asp:Label>

        <br />
        <br />

        <asp:Label runat="server" Text="Số lượng:" ID="lblQuantity" CssClass="OrderLabels"></asp:Label>
        <asp:TextBox ID="quantity" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="requiredQuantity" runat="server" ControlToValidate="quantity" EnableClientScript="False" ErrorMessage="Số lượng là bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="rangeQuantity" runat="server" ErrorMessage="Số phải từ 1 đến 12" EnableClientScript="False" ControlToValidate="quantity" MaximumValue="12" MinimumValue="1" Type="Integer" ForeColor="Red"></asp:RangeValidator>

        <br />
        <br />

        <asp:Label runat="server" Text="Lớp phủ:" ID="lblTopping" CssClass="OrderLabels"></asp:Label>
        <asp:RadioButtonList ID="topping" runat="server" CssClass="inputs rblListitems">
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator ID="requiredTopping" runat="server" ControlToValidate="topping" EnableClientScript="False" ErrorMessage="Chưa chọn lớp phủ" ForeColor="Red"></asp:RequiredFieldValidator>

        <br />

        <asp:Label runat="server" Text="Bổ sung:" ID="lblAddOns" CssClass="OrderLabels"></asp:Label>
        <asp:CheckBoxList ID="addOns" runat="server" CssClass="inputs rblListitems">
        </asp:CheckBoxList>

        <br />

        <asp:Button ID="submit" runat="server" Text="Cập nhật" OnClick="submit_Click" CssClass="fffxxx submitDiscord" />
        <asp:Button ID="submitDelete" runat="server" Text="Xóa" OnClick="submitDelete_Click" CssClass="fffxxx submitDiscord" />
        <input type="button" value="Thoát" onclick="history.go(-1);return false;" class="submitDiscord">
        <br />

        <asp:Label ID="orderUpdateErrorMsg" runat="server" Text="" ForeColor="Red"></asp:Label>
        <br>
        <br>
    </div>
</asp:Content>
