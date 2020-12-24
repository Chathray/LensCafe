using System;
using System.Web.UI;

namespace Order
{
    public partial class Index : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string currentPage = Page.Request.FilePath;

            switch (currentPage)
            {
                case "/Home.aspx":
                    homeButton.Attributes["class"] = "active";
                    break;
                case "/Menu.aspx":
                    menuButton.Attributes["class"] = "active";
                    break;
                case "/Contact.aspx":
                    contactButton.Attributes["class"] = "active";
                    break;
                case "/OrderTest.aspx":
                    coffeeButton.Attributes["class"] = "active";
                    break;
            }

            if (Session["MemberEmail"] != null)
            {
                btnLoginSwitch.InnerHtml = "<div class='dropdown'>";
                btnLoginSwitch.InnerHtml += "<a runat='server' style='font-size: 13px;' class='dropdown' id='displayName'>" + Session["MemberUsername"].ToString() + "</a>";
                btnLoginSwitch.InnerHtml += "<div class='dropdown-content'>";
                btnLoginSwitch.InnerHtml += "<a runat='server' style='font-size: 13px;' href='UserProfileEdit.aspx'>Hồ Sơ</a>";
                btnLoginSwitch.InnerHtml += "<a runat='server' style='font-size: 13px;' href='UserOrderRepeater.aspx'>Đơn hàng của tôi</a>";

                if (Session["MemberRole"].ToString() == "admin")
                {
                    btnLoginSwitch.InnerHtml += "<a runat='server' style='font-size: 13px;' href='AdminUserOrder.aspx'>Đơn Khách Hàng</a>";
                    btnLoginSwitch.InnerHtml += "<a runat='server' style='font-size: 13px;' href='AdminUserTable.aspx'>Thành Viên</a>";
                }

                btnLoginSwitch.InnerHtml += "<a runat='server' style='font-size: 13px;' href='Logout.aspx'>Đăng Xuất</a>";
                btnLoginSwitch.InnerHtml += "</div>";
                btnLoginSwitch.InnerHtml += "</div>";
            }
            else
            {
                btnLoginSwitch.InnerHtml = "<a id='loginButton' runat='server' style='font-size: 13px;' href='Login.aspx'>Đăng Nhập</a>";
                btnLoginSwitch.InnerHtml += "<a id='registerButton' runat='server' style='font-size: 13px;' href='Register.aspx'>Đăng Ký</a>";
            }
        }
    }
}