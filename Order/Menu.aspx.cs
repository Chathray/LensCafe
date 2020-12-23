using System;
using System.Web.UI;

namespace Order
{
    public partial class Menu : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.MaintainScrollPositionOnPostBack = true;
        }
    }
}