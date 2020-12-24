using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
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

        [WebMethod]
        public static string SayHello(string name)
        {
            string outp = "";
            DataView d;
            SqlConnection con = new SqlConnection(Global.connectionString);
            string q = "SELECT * FROM Items WHERE Category=N'" + name + "'";
            using (con)
            {
                SqlDataAdapter da = new SqlDataAdapter(q, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                d = new DataView(ds.Tables[0]);
            }

            foreach (DataRowView rowView in d)
            {
                DataRow row = rowView.Row;
                // Do something //
                string Name = row[1].ToString();
                string Price = row[2].ToString();
                string Info = row[3].ToString();

                outp +=
                    "<div class='tm-product'>" +
                    "<img src='images/" + Name + ".jpg' alt='Product' class='imgmenu'>" +
                    "<div class='tm-product-text'>" +
                    "<h3 class='tm-product-title'>" + Name + "</h3>" +
                    "<p class='tm-product-description'>" + Info + "</p>" +
                    "</div>" +
                    "<div class='tm-product-price'>" +
                    "<a class='tm-product-price-link tm-handwriting-font'>$" + Price + "</a>" +
                    "</div>" +
                    "</div>";
            }
            return outp;
        }
    }
}