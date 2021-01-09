using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace Order
{
    /// <summary>
    /// Summary description for WebService
    /// </summary>
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class LensAPI : WebService
    {
        [WebMethod]
        public string GetMenuItem(string cate)
        {
            string outp = "";
            DataView d;
            SqlConnection con = new SqlConnection(Global.connectionString);
            string q = "SELECT * FROM Items WHERE Category=N'" + cate + "'";
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
                    "<a href='OrderTest.aspx?x=" + Name + "' class='tm-product-price-link tm-handwriting-font'>$" + Price + "</a>" +
                    "</div>" +
                    "</div>";
            }
            return outp;
        }
    }
}