using System.Web.Configuration;

namespace Order
{
    public class Global
    {
        public static string connectionString = WebConfigurationManager.ConnectionStrings["userConn"].ConnectionString;

        private static string orderId;
        private static string memberId;

        public static string OrderId
        {
            set { orderId = value; }
            get { return orderId; }
        }

        public static string MemberId
        {
            set { memberId = value; }
            get { return memberId; }
        }
    }
}