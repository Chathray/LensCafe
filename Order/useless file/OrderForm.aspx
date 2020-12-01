<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderForm.aspx.cs" Inherits="Order.OrderForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Page</title>
    <style>
        form, #output {
            display: inline-block;
        }
        form {
            width: 30%;
        }
        #output {
            width: 70%;
            float: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Flavor: <asp:DropDownList ID="flavor" runat="server">
                <asp:ListItem Value="4.50" Text="Red Velvet">Red Velvet</asp:ListItem>
                <asp:ListItem Value="5.00" Text="Chocolate">Chocolate</asp:ListItem>
                <asp:ListItem Value="4.00" Text="Blueberry">Blueberry</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />

            Quantity: <br />
            <asp:TextBox ID="quantity" runat="server" TextMode="Number"></asp:TextBox>
            <asp:RequiredFieldValidator ID="requiredQuantity" runat="server" ControlToValidate="quantity" EnableClientScript="False" ErrorMessage="Quantity is required!" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="rangeQuantity" runat="server" ErrorMessage="Number must be 1 to 12" EnableClientScript="False" ControlToValidate="quantity" MaximumValue="12" MinimumValue="1" Type="Integer" ForeColor="Red"></asp:RangeValidator>
            <br />
            <br />
            <br />

            Topping: <br />
            <asp:RadioButtonList ID="topping" runat="server">
                <asp:ListItem Value="2.50" Text="Fondant"></asp:ListItem>
                <asp:ListItem Value="3.50" Text="Buttercream"></asp:ListItem>
                <asp:ListItem Value="2.00" Text="Naked"></asp:ListItem>
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="requiredTopping" runat="server" ControlToValidate="topping" EnableClientScript="False" ErrorMessage="Topping is required!" ForeColor="Red"></asp:RequiredFieldValidator>
            
            <br />

            Decoration: <br />
            <asp:CheckBoxList ID="decoration" runat="server">
                <asp:ListItem Value="3.00" Text="M&amp;M"></asp:ListItem>
                <asp:ListItem Value="1.00" Text="Snickers"></asp:ListItem>
                <asp:ListItem Value="1.50" Text="Oreo"></asp:ListItem>
            </asp:CheckBoxList>
            <asp:CustomValidator ID="customDecoration" runat="server" ErrorMessage="Decoration is required!" EnableClientScript="False" ForeColor="Red" OnServerValidate="customDecoration_ServerValidate"></asp:CustomValidator>

            <br />

            <asp:Button ID="submit" runat="server" Text="Submit Order" OnClick="submit_Click" />
        </div>
    </form>

    <div id="output" runat="server" visible="false">
        ORDER DETAILS: 
        <br />
        <br />

        <asp:Image ID="image" runat="server" Width="400px" Height="300px" />
        <br />
        <br />

        Flavor: 
        <asp:Label ID="outputFlavor" runat="server"></asp:Label>
        <br />
        Quantity: 
        <asp:Label ID="outputQuantity" runat="server"></asp:Label>
        <br />

        Topping: 
        <asp:Label ID="outputTopping" runat="server"></asp:Label>
        <br />

        Decoration: 
        <asp:Label ID="outputDecoration" runat="server"></asp:Label>
        <br />

        Total Price: 
        <asp:Label ID="outputTotal" runat="server"></asp:Label>
    </div>
</body>
</html>