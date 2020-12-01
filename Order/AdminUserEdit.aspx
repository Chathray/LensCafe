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
        <asp:Label ID="lblMemberUsername" runat="server" Text="Member Username:" CssClass="OrderLabels"></asp:Label>
        <asp:TextBox ID="txtboxUsername" runat="server" CssClass="inputs"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqUsername" runat="server" ErrorMessage="Please fill in a username." ControlToValidate="txtboxUsername" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="regExpUsername" runat="server" ControlToValidate="txtboxUsername" ErrorMessage="Username character must be more than 2" ValidationExpression=".{3}.*" EnableClientScript="False" ForeColor="Red" />
        <asp:CustomValidator ID="customUsername" runat="server" ErrorMessage="This username has been taken" ForeColor="Red" EnableClientScript="false" ControlToValidate="txtboxUsername" OnServerValidate="customUsername_ServerValidate"></asp:CustomValidator>

        <br />

        <asp:Label ID="lblMemberEmail" runat="server" Text="Member Email:" CssClass="OrderLabels"></asp:Label>
        <asp:TextBox ID="txtboxEmail" runat="server" TextMode="Email" CssClass="inputs"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqEmail" runat="server" ErrorMessage="Please fill in a email." ControlToValidate="txtboxEmail" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:CustomValidator ID="customEmail" runat="server" ErrorMessage="This email has been taken" ForeColor="Red" EnableClientScript="false" ControlToValidate="txtboxEmail" OnServerValidate="customEmail_ServerValidate"></asp:CustomValidator>

        <br />

        <asp:Label ID="lblMemberPassword" runat="server" Text="Member Password:" CssClass="OrderLabels"></asp:Label>
        <asp:TextBox ID="txtboxPassword" runat="server" CssClass="inputs"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqPassword" runat="server" ErrorMessage="Please fill in a password." ControlToValidate="txtboxPassword" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="regExpPassword" runat="server" ControlToValidate="txtboxPassword" ErrorMessage="Minimum password length is 8" ValidationExpression=".{8}.*" EnableClientScript="False" ForeColor="Red" />

        <br />

        <asp:Label ID="lblMemberRole" runat="server" Text="Member Role:" CssClass="OrderLabels"></asp:Label>
        <asp:DropDownList ID="ddlRole" runat="server" CssClass="inputs"></asp:DropDownList>

        <br />
        <br />

        <asp:Label ID="lblMemberName" runat="server" Text="Member's Full Name:" CssClass="OrderLabels"></asp:Label>
        <asp:TextBox ID="txtboxName" runat="server" CssClass="inputs"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqName" runat="server" ErrorMessage="Please fill in a name." ControlToValidate="txtboxName" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>

        <br />

        <asp:Label ID="lblMemberPhone" runat="server" Text="Member Phone:" CssClass="OrderLabels"></asp:Label>
        <asp:TextBox ID="txtboxPhone" runat="server" TextMode="Phone" CssClass="inputs"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqPhone" runat="server" ErrorMessage="Please fill in a phone number." ControlToValidate="txtboxPhone" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>

        <br />
        <br />

        <asp:Button ID="submitAdminUserEdit" runat="server" Text="Update" OnClick="submitAdminUserEdit_Click" CssClass="fffxxx submitDiscord" />
        <asp:Button ID="submitUserDelete" runat="server" Text="Delete User" OnClick="submitUserDelete_Click" CssClass="fffxxx submitDiscord" />
        <asp:Button ID="submitCancel" runat="server" Text="Back to Member List" OnClick="submitCancel_Click" CssClass="fffxxx submitDiscord" />

        <br />

        <asp:Label ID="AdminMemberUpdateErrorMsg" runat="server" Text="" ForeColor="Red"></asp:Label>
    </div>
</asp:Content>
