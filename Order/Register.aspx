<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Order.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-bg-color">

        <asp:Label ID="lblRegUsername" runat="server" Text="Username:" CssClass="OrderLabels"></asp:Label>
        <asp:TextBox ID="regUsername" runat="server" CssClass="inputs"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqRegUsername" runat="server" ErrorMessage="Username is required" ControlToValidate="regUsername" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="regRegUsername" runat="server" ControlToValidate="regUsername" ErrorMessage="Username character must be more than 2" ValidationExpression=".{3}.*" EnableClientScript="False" ForeColor="Red" />
        <asp:Label ID="regErrorUsername" runat="server" Text="" ForeColor="Red"></asp:Label>
        <br>
        <asp:Label ID="lblRegEmail" runat="server" Text="Email:" CssClass="OrderLabels"></asp:Label>
        <asp:TextBox ID="regEmail" runat="server" TextMode="Email" CssClass="inputs"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqRegEmail" runat="server" ErrorMessage="Email is required" ControlToValidate="regEmail" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:Label ID="regErrorEmail" runat="server" Text="" ForeColor="Red"></asp:Label>
        <br>
        <asp:Label ID="lblRegPassword" runat="server" Text="Password:" CssClass="OrderLabels"></asp:Label>
        <asp:TextBox ID="regPassword" runat="server" TextMode="Password" CssClass="inputs"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqRegPassword" runat="server" ErrorMessage="Password is required" ControlToValidate="regPassword" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="regRegPassword" runat="server" ControlToValidate="regPassword" ErrorMessage="Minimum password length is 8" ValidationExpression=".{8}.*" EnableClientScript="False" ForeColor="Red" />
        <br>
        <asp:Label ID="lblRegConfirmPassword" runat="server" Text="Confirm Password:" CssClass="OrderLabels"></asp:Label>
        <asp:TextBox ID="regConfirmPassword" runat="server" TextMode="Password" CssClass="inputs"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqRegConfirmPassword" runat="server" ErrorMessage="Please enter your password again." ControlToValidate="regConfirmPassword" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="compareRegConfirmPassword" runat="server" ErrorMessage="Confirm Password must be the same as Password" ControlToValidate="regConfirmPassword" EnableClientScript="False" ForeColor="Red" ControlToCompare="regPassword"></asp:CompareValidator>
        <br>
        <asp:Label ID="lblRegName" runat="server" Text="Full Name:" CssClass="OrderLabels"></asp:Label>
        <asp:TextBox ID="regName" runat="server" CssClass="inputs"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqRegName" runat="server" ErrorMessage="Full name is required" ControlToValidate="regName" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>
        <br>
        <asp:Label ID="lblRegPhone" runat="server" Text="Phone:" CssClass="OrderLabels"></asp:Label>
        <asp:TextBox ID="regPhone" runat="server" TextMode="Phone" CssClass="inputs"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqRegPhone" runat="server" ErrorMessage="Phone number is required" ControlToValidate="regPhone" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>
        <br>
        <br>
        <asp:Button ID="submitReg" runat="server" Text="Register" OnClick="submitReg_Click" CssClass="submitDiscord" />
        <br>
        <br>
        <asp:Label ID="regErrorMsg" runat="server" Text="" ForeColor="Red"></asp:Label>
    </div>
</asp:Content>
