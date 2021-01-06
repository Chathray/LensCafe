<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="AdminUserTable.aspx.cs" Inherits="Order.AdminUserTable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="TableBackground">
        <h1 class="tm-handwriting-font SetToCenter">Danh sách thành viên</h1>
        <br>
        <table id="dataGrid" class="TableCss row-border">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Role</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th></th>
                </tr>
            </thead>
            <asp:Repeater ID="MemberTableRepeater" runat="server">
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("MemberId") %></td>
                        <td><%# Eval("MemberUsername") %></td>
                        <td><%# Eval("MemberEmail") %></td>
                        <td><%# Eval("MemberPassword") %></td>
                        <td><%# Eval("MemberRole") %></td>
                        <td><%# Eval("MemberAddress") %></td>
                        <td><%# Eval("MemberPhone") %></td>
                        <td>
                            <asp:LinkButton ID="UserEditLinkBtn" runat="server" CommandArgument='<%# Eval("MemberId") %>' OnClick="userEditLinkBtn_Click" CssClass="text-primary">Cập nhật</asp:LinkButton>
                            <asp:LinkButton ID="UserDeleteLinkBtn" runat="server" CommandArgument='<%# Eval("MemberId") %>' OnClick="userDeleteLinkBtn_Click" CssClass="text-danger">Xoá</asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tfoot>
                <tr>
                    <th>1</th>
                    <th>2</th>
                    <th>3</th>
                    <th>4</th>
                    <th>5</th>
                    <th>6</th>
                    <th>7</th>
                    <th></th>
                </tr>
            </tfoot>
        </table>
    </div>

</asp:Content>
