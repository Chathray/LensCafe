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

        <asp:Label runat="server" Text="Order ID: " ID="lblOrderId" CssClass="OrderLabels"></asp:Label>

        <br />

        <asp:Label runat="server" Text="Status: " ID="lblStatus" CssClass="OrderLabels"></asp:Label>

        <br />

        <div id="divAdminOutput" runat="server" visible="false">
            <table>
                <tr>
                    <td>
                        <asp:Label runat="server" Text="Customer Username: " ID="lblUsernameDisplay" CssClass="OrderLabels"></asp:Label>
                    </td>
                    <td class="tableOrderDetails">
                        <asp:Label runat="server" Text="" ID="lblUsername" CssClass="OrderLabels"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" Text="Customer Email: " ID="lblEmailDisplay" CssClass="OrderLabels"></asp:Label>
                    </td>
                    <td class="tableOrderDetails">
                        <asp:Label runat="server" Text="" ID="lblEmail" CssClass="OrderLabels"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" Text="Customer Name: " ID="lblNameDisplay" CssClass="OrderLabels"></asp:Label>
                    </td>
                    <td class="tableOrderDetails">
                        <asp:Label runat="server" Text="" ID="lblName" CssClass="OrderLabels"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" Text="Customer Phone: " ID="lblPhoneDisplay" CssClass="OrderLabels"></asp:Label>
                    </td>
                    <td class="tableOrderDetails">
                        <asp:Label runat="server" Text="" ID="lblPhone" CssClass="OrderLabels"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" Text="Customer Member ID: " ID="lblMemberIdDisplay" CssClass="OrderLabels"></asp:Label>
                    </td>
                    <td class="tableOrderDetails">
                        <asp:Label runat="server" Text="" ID="lblMemberId" CssClass="OrderLabels"></asp:Label>
                    </td>
                </tr>
            </table>

            <br />
            <br />

            <asp:Label runat="server" Text="Status: " ID="lblStatusAdmin" CssClass="OrderLabels"></asp:Label>
            <asp:DropDownList ID="statusDropDown" runat="server" CssClass="inputs">
            </asp:DropDownList>
        </div>

        <br />
        <br />

        <asp:Label runat="server" Text="Coffee:" ID="lblCoffee" CssClass="OrderLabels"></asp:Label>
        <asp:Label runat="server" Text="" ID="lblCoffeeType" CssClass="OrderDetails"></asp:Label>

        <br />
        <br />

        <asp:Label runat="server" Text="Quantity:" ID="lblQuantity" CssClass="OrderLabels"></asp:Label>
        <asp:TextBox ID="quantity" runat="server" TextMode="Number" CssClass="inputs"></asp:TextBox>
        <asp:RequiredFieldValidator ID="requiredQuantity" runat="server" ControlToValidate="quantity" EnableClientScript="False" ErrorMessage="Quantity is required!" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="rangeQuantity" runat="server" ErrorMessage="Number must be 1 to 12" EnableClientScript="False" ControlToValidate="quantity" MaximumValue="12" MinimumValue="1" Type="Integer" ForeColor="Red"></asp:RangeValidator>

        <br />
        <br />

        <asp:Label runat="server" Text="Topping:" ID="lblTopping" CssClass="OrderLabels"></asp:Label>
        <asp:RadioButtonList ID="topping" runat="server" CssClass="inputs rblListitems">
            <asp:ListItem Value="2.50" Text="Cinnamon"></asp:ListItem>
            <asp:ListItem Value="3.50" Text="Whipped Cream"></asp:ListItem>
            <asp:ListItem Value="2.00" Text="Nutmeg"></asp:ListItem>
            <asp:ListItem Value="0.00" Text="None"></asp:ListItem>
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator ID="requiredTopping" runat="server" ControlToValidate="topping" EnableClientScript="False" ErrorMessage="Topping is required!" ForeColor="Red"></asp:RequiredFieldValidator>

        <br />

        <asp:Label runat="server" Text="Add-Ons:" ID="lblAddOns" CssClass="OrderLabels"></asp:Label>
        <asp:CheckBoxList ID="addOns" runat="server" CssClass="inputs rblListitems">
            <asp:ListItem Value="0.50" Text="Brown Sugar"></asp:ListItem>
            <asp:ListItem Value="0.50" Text="White Sugar"></asp:ListItem>
            <asp:ListItem Value="0.50" Text="Salt"></asp:ListItem>
            <asp:ListItem Value="0.50" Text="Creamer"></asp:ListItem>
            <asp:ListItem Value="0.50" Text="Stirrer"></asp:ListItem>
        </asp:CheckBoxList>

        <br />

        <asp:Button ID="submit" runat="server" Text="Update Order" OnClick="submit_Click" CssClass="fffxxx submitDiscord" />
        <asp:Button ID="submitDelete" runat="server" Text="Delete Order" OnClick="submitDelete_Click" CssClass="fffxxx submitDiscord" />
        <input type="button" value="Cancel" onclick="history.go(-1);return false;" class="submitDiscord">
        <br />

        <asp:Label ID="orderUpdateErrorMsg" runat="server" Text="" ForeColor="Red"></asp:Label>
        <br>
        <br>
    </div>
</asp:Content>
