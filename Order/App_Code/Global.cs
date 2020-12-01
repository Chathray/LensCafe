namespace Order
{
    public class Global
    {
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