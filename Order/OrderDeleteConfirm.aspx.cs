using System;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Order
{
    public partial class OrderDeleteConfirm : System.Web.UI.Page
    {
        private string connectionString = WebConfigurationManager.ConnectionStrings["userConn"].ConnectionString;

        int num;
        string orderId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MemberEmail"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void submitDelete_Click(object sender, EventArgs e)
        {
            setCoffee();
            orderId = num.ToString();

            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string deleteOrderQuery = "DELETE FROM Orders WHERE OrderId='" + orderId + "'";
            SqlCommand cmdDeleteOrder = new SqlCommand(deleteOrderQuery, con);

            int delete = 0;
            try
            {
                delete = cmdDeleteOrder.ExecuteNonQuery();

                //check if record was successfully inserted
                if (delete > 0)
                {
                    outputDelete.InnerHtml = "<label>This order has been deleted.</label> <br />";
                    string peertype = Request.QueryString["peertype"];

                    if (peertype == "00" || peertype == "10")
                        outputDelete.InnerHtml += "<a href='UserOrderRepeater.aspx'>Back to Customer's Orders</a>";
                    else if(peertype == "11")
                        outputDelete.InnerHtml += "<a href='AdminUserOrder.aspx'>Back to Customer's Orders</a>";
                }
                else
                {
                    deleteErrorMsg.Text = "Order delete unsuccessful, please try again later.";
                }
            }
            catch (Exception err)
            {
                deleteErrorMsg.Text = "Delete Error <br /> " + err.Message;
            }
            finally
            {
                con.Close();
            }
        }

        private void setCoffee()
        {
            string orderId = Global.OrderId;
            num = short.Parse(orderId);
        }
    }
}