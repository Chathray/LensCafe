using System;
using System.Web.UI;

namespace Order
{
    public partial class Index : System.Web.UI.MasterPage
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
                btnLoginSwitch.InnerHtml += "<a runat='server' class='dropdown' id='displayName'>" + Session["MemberUsername"].ToString() + "</a>";
                btnLoginSwitch.InnerHtml += "<div class='dropdown-content'>";
                btnLoginSwitch.InnerHtml += "<a runat='server' href='UserProfileEdit.aspx'>Hồ Sơ</a>";
                btnLoginSwitch.InnerHtml += "<a runat='server' href='UserOrderRepeater.aspx'>Đơn hàng</a>";

                if (Session["MemberRole"].ToString() == "admin")
                {
                    btnLoginSwitch.InnerHtml += "<a runat='server' href='AdminUserOrder.aspx'>Khách Hàng</a>";
                    btnLoginSwitch.InnerHtml += "<a runat='server' href='AdminUserTable.aspx'>Thành Viên</a>";
                }

                btnLoginSwitch.InnerHtml += "<a runat='server' href='Logout.aspx'>Đăng Xuất</a>";
                btnLoginSwitch.InnerHtml += "</div>";
                btnLoginSwitch.InnerHtml += "</div>";
            }
            else
            {
                btnLoginSwitch.InnerHtml = "<a id='loginButton' runat='server' href='Login.aspx'>Đăng Nhập</a>";
                btnLoginSwitch.InnerHtml += "<a id='registerButton' runat='server' href='Register.aspx'>Đăng Ký</a>";
            }
        }
    }
}