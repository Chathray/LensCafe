<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Order.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <section class="tm-welcome-section">
        <div class="container tm-position-relative">
            <div class="tm-lights-container">
                <img src="img/light.png" alt="Light" class="light light-1">
                <img src="img/light.png" alt="Light" class="light light-2">
                <img src="img/light.png" alt="Light" class="light light-3">
            </div>
            <div id="divWelcome" runat="server" class="row tm-welcome-content">
                <h2 class="white-text tm-handwriting-font tm-welcome-header">
                    <img src="img/header-line.png" alt="Line" class="tm-header-line">&nbsp;Welcome To&nbsp;&nbsp;<img src="img/header-line.png" alt="Line" class="tm-header-line"></h2>
                <h2 class="gold-text tm-welcome-header-2">Lens Coffee</h2>
                <p class="gray-text tm-welcome-description">Chúng tôi mong muốn mang đến cho bạn những trải nghiệm đáng nhớ mỗi lần đến Lens Coffee®. Hãy chia sẻ với chúng tôi để chúng tôi có thể mang đến cho bạn những trải nghiệm tuyệt vời hơn thế.</p>
                <a id="btnDetails" runat="server" href="#main" class="tm-more-button tm-more-button-welcome"><i class="fa fa-angle-double-down"></i></a>
            </div>
            <img src="img/table-set.png" alt="Table Set" class="tm-table-set img-responsive">
        </div>
    </section>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="tm-section row">
        <div class="col-lg-9 col-md-9 col-sm-8">
            <h2 class="tm-section-header gold-text tm-handwriting-font">Khởi nguồn</h2>
            <p class="tm-welcome-description">Lens Coffee® được sinh ra từ niềm đam mê bất tận với hạt cà phê Việt Nam. Qua một chặng đường dài, chúng tôi đã không ngừng mang đến những sản phẩm cà phê thơm ngon, sánh đượm trong không gian thoải mái và lịch sự với mức giá hợp lý. Những ly cà phê của chúng tôi không chỉ đơn thuần là thức uống quen thuộc mà còn mang trên mình một sứ mệnh văn hóa phản ánh một phần nếp sống hiện đại của người Việt Nam.</p>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-4 tm-welcome-img-container">
            <div class="inline-block shadow-img">
                <img src="images/cappuccino/cappuccino.jpg" alt="Image" class="img-circle img-thumbnail" width="168" height="168">
            </div>
        </div>
    </section>
    <section class="tm-section tm-section-margin-bottom-0 row">
        <div class="col-lg-12 tm-section-header-container">
            <h2 class="tm-section-header gold-text tm-handwriting-font">
                <img src="img/logo.png" alt="Logo" class="tm-site-logo"> Phổ biến</h2>
            <div class="tm-hr-container">
                <hr class="tm-hr">
            </div>
        </div>
        <div class="col-lg-12 tm-popular-items-container">
            <div class="tm-popular-item">
                <img src="images/americano/americano.jpg" alt="Popular" class="tm-popular-item-img" width="286" height="220">
                <div class="tm-popular-item-description">
                    <h3 class="tm-handwriting-font2 tm-popular-item-title"><span class="tm-handwriting-font bigger-first-letter">A</span>mericano</h3>
                    <hr class="tm-popular-item-hr">
                    <p class="text-limit">Americano là sự kết hợp giữa cà phê espresso thêm vào nước đun sôi. Bạn có thể tùy thích lựa chọn uống nóng hoặc dùng chung với đá.
</p>
                    <div class="order-now-container">
                        <a href="#" class="order-now-link tm-handwriting-font2">Xem ngay</a>
                    </div>
                </div>
            </div>
            <div class="tm-popular-item">
                <img src="images/cappuccino/cappuccino.jpg" alt="Popular" class="tm-popular-item-img" width="286" height="220">
                <div class="tm-popular-item-description">
                    <h3 class="tm-handwriting-font2 tm-popular-item-title"><span class="tm-handwriting-font bigger-first-letter">C</span>appuccino</h3>
                    <hr class="tm-popular-item-hr">
                    <p class="text-limit">Cappuccino của chúng tôi bắt đầu với cà phê espresso, sau đó thêm một lượng tương đương giữa sữa tươi và bọt sữa cho thật hấp dẫn. Bạn có thể tùy thích lựa chọn uống nóng hoặc dùng chung với đá.</p>
                    <div class="order-now-container">
                        <a href="#" class="order-now-link tm-handwriting-font2">Xem Ngay</a>
                    </div>
                </div>
            </div>
            <div class="tm-popular-item">
                <img src="images/latte/latte.jpg" alt="Popular" class="tm-popular-item-img" width="286" height="220">
                <div class="tm-popular-item-description">
                    <h3 class="tm-handwriting-font2 tm-popular-item-title"><span class="tm-handwriting-font bigger-first-letter">L</span>atte</h3>
                    <hr class="tm-popular-item-hr">
                    <p class="text-limit">Latte của chúng tôi bắt đầu với cà phê espresso, sau đó thêm sữa tươi và bọt sữa một cách đầy nghệ thuật. Bạn có thể tùy thích lựa chọn uống nóng hoặc dùng chung với đá.<br><br><br></p>
                    <div class="order-now-container">
                        <a href="#" class="order-now-link tm-handwriting-font2">Xem ngay</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
