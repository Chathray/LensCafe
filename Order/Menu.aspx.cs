using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web.UI;

namespace Order
{
    public partial class Menu : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.MaintainScrollPositionOnPostBack = true;

            var data = GetCategory();
            string inner = "";
            foreach (DataRowView rowView in data)
            {
                DataRow row = rowView.Row;
                // Do something //
                string txt = row[0].ToString().Trim();
                if (txt == "") continue;
                if (inner == "")
                    inner += "<li class='menu-fuzzy'><a class='active'>" + txt + "</a></li>";
                else
                    inner += "<li class='menu-fuzzy'><a>" + txt + "</a></li>";
            }
            hanbu.InnerHtml = inner;
        }

        private ICollection GetCategory()
        {
            SqlConnection con = new SqlConnection(Global.connectionString);
            string q = "SELECT DISTINCT Category FROM Items";
            using (con)
            {
                SqlDataAdapter da = new SqlDataAdapter(q, con);
                DataSet ds = new DataSet();
                da.Fill(ds);

                var view = new DataView(ds.Tables[0]);

                return view;
            }
        }
    }
}