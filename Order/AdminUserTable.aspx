<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="AdminUserTable.aspx.cs" Inherits="Order.AdminUserTable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="TableBackground">
        <h1 class="tm-handwriting-font SetToCenter">Danh sách thành viên</h1>
        <br>
        <table border="1" class="TableCss">
            <thead>
                <tr>
                    <th style="width:5%;">ID</th>
                    <th style="width:10%;">Username</th>
                    <th style="width:17%;">Email</th>
                    <th style="width:13%;">Password</th>
                    <th style="width:7%;">Role</th>
                    <th style="width:28%;">Address</th>
                    <th style="width:12%;">Phone</th>
                    <th style="width:8%;"></th>
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
                                    <asp:LinkButton ID="UserEditLinkBtn" runat="server" CommandArgument='<%# Eval("MemberId") %>' OnClick="userEditLinkBtn_Click" CssClass="text-primary"><b>Cập nhật</b></asp:LinkButton>
                                    <asp:LinkButton ID="UserDeleteLinkBtn" runat="server" CommandArgument='<%# Eval("MemberId") %>' OnClick="userDeleteLinkBtn_Click" CssClass="text-danger"><b>Xoá</b></asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
        </table>
    </div>
</asp:Content>
