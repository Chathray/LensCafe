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
                <a id="btnDetails" runat="server" href="#main" class="tm-more-button tm-more-button-welcome"><i class="fa fa-angle-down"></i></a>
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
                <img src="images/Classic Cappuccino.jpg" alt="Image" class="img-circle img-thumbnail" width="168" height="168">
            </div>
        </div>
    </section>
    <section class="tm-section tm-section-margin-bottom-0 row">
        <div class="col-lg-12 tm-section-header-container">
            <h2 class="tm-section-header gold-text tm-handwriting-font">
                <img src="img/logo.png" alt="Logo" class="tm-site-logo">
                Phổ biến</h2>
            <div class="tm-hr-container">
                <hr class="tm-hr">
            </div>
        </div>
        <div class="col-lg-12 tm-popular-items-container">
            <div class="tm-popular-item">
                <img src="images/Classic Americano.jpg" alt="Popular" class="tm-popular-item-img" width="286" height="220">
                <div class="tm-popular-item-description">
                    <h3 class="tm-handwriting-font2 tm-popular-item-title"><span class="tm-handwriting-font bigger-first-letter">A</span>mericano</h3>
                    <hr class="tm-popular-item-hr">
                    <p class="text-limit">
                        Americano là sự kết hợp giữa cà phê espresso thêm vào nước đun sôi.
                        <br>
                        <br>
                    </p>
                    <div class="order-now-container">
                        <a href="OrderTest.aspx?x=Classic Americano" class="order-now-link tm-handwriting-font2">Mua ngay</a>
                    </div>
                </div>
            </div>
            <div class="tm-popular-item">
                <img src="images/Classic Cappuccino.jpg" alt="Popular" class="tm-popular-item-img" width="286" height="220">
                <div class="tm-popular-item-description">
                    <h3 class="tm-handwriting-font2 tm-popular-item-title"><span class="tm-handwriting-font bigger-first-letter">C</span>appuccino</h3>
                    <hr class="tm-popular-item-hr">
                    <p class="text-limit">
                        Cappuccino của chúng tôi bắt đầu với cà phê espresso, sau đó thêm một lượng tương đương giữa sữa tươi và bọt sữa cho thật hấp dẫn.
                        <br>
                        <br>
                    </p>
                    <div class="order-now-container">
                        <a href="OrderTest.aspx?x=Classic Cappuccino" class="order-now-link tm-handwriting-font2">Mua ngay</a>
                    </div>
                </div>
            </div>
            <div class="tm-popular-item">
                <img src="images/Classic Latte.jpg" alt="Popular" class="tm-popular-item-img" width="286" height="220">
                <div class="tm-popular-item-description">
                    <h3 class="tm-handwriting-font2 tm-popular-item-title"><span class="tm-handwriting-font bigger-first-letter">L</span>atte</h3>
                    <hr class="tm-popular-item-hr">
                    <p class="text-limit">
                        Latte của chúng tôi bắt đầu với cà phê espresso, sau đó thêm sữa tươi và bọt sữa một cách đầy nghệ thuật.
                        <br>
                        <br>
                    </p>
                    <div class="order-now-container">
                        <a href="OrderTest.aspx?x=Classic Latte" class="order-now-link tm-handwriting-font2">Mua ngay</a>
                    </div>
                </div>
            </div>
            <div class="tm-popular-item">
                <img src="images/Phin.jpg" alt="Popular" class="tm-popular-item-img" width="286" height="220">
                <div class="tm-popular-item-description">
                    <h3 class="tm-handwriting-font2 tm-popular-item-title"><span class="tm-handwriting-font bigger-first-letter">P</span>hin</h3>
                    <hr class="tm-popular-item-hr">
                    <p class="text-limit">
                        Phối trộn độc đáo giữa hạt Robusta từ cao nguyên Việt Nam, thêm Arabica thơm lừng. Kết hợp với nước sôi từng giọt cà phê được chiết xuất từ Phin truyền thống.
                        <br>
                        <br>
                    </p>
                    <div class="order-now-container">
                        <a href="OrderTest.aspx?x=Phin" class="order-now-link tm-handwriting-font2">Mua ngay</a>
                    </div>
                </div>
            </div>
            <div class="tm-popular-item">
                <img src="images/Espresso Macchiato.jpg" alt="Popular" class="tm-popular-item-img" width="286" height="220">
                <div class="tm-popular-item-description">
                    <h3 class="tm-handwriting-font2 tm-popular-item-title"><span class="tm-handwriting-font bigger-first-letter">M</span>acchiato</h3>
                    <hr class="tm-popular-item-hr">
                    <p class="text-limit">
                        Ly cà phê Macchiato bắt đầu từ dòng sữa tươi và lớp bọt sữa béo ngậy, sau đó hòa quyện cùng cà phê espresso đậm đà.
                        <br>
                        <br>
                    </p>
                    <div class="order-now-container">
                        <a href="OrderTest.aspx?x=Espresso Macchiato" class="order-now-link tm-handwriting-font2">Mua ngay</a>
                    </div>
                </div>
            </div>
            <div class="tm-popular-item">
                <img src="images/Espresso.jpg" alt="Popular" class="tm-popular-item-img" width="286" height="220">
                <div class="tm-popular-item-description">
                    <h3 class="tm-handwriting-font2 tm-popular-item-title"><span class="tm-handwriting-font bigger-first-letter">E</span>spresso</h3>
                    <hr class="tm-popular-item-hr">
                    <p class="text-limit">
                        Được chiết xuất một cách hoàn hảo từ loại cà phê rang được phối trộn độc đáo từ những hạt cà phê Robusta và Arabica chất lượng hảo hạng.
                        <br>
                        <br>
                    </p>
                    <div class="order-now-container">
                        <a href="OrderTest.aspx?x=Espresso" class="order-now-link tm-handwriting-font2">Mua ngay</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="tm-section">
        <div class="row">
            <div class="col-lg-12 tm-section-header-container">
                <h2 class="tm-section-header gold-text tm-handwriting-font">
                    <img src="img/logo.png" alt="Logo" class="tm-site-logo">
                    Hôm nay</h2>
                <div class="tm-hr-container">
                    <hr class="tm-hr">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="tm-daily-menu-container margin-top-60">
                <div class="col-lg-4 col-md-4">
                    <img src="images/Daily.jpg" alt="Menu board" class="tm-daily-menu-img">
                </div>
                <div class="col-lg-8 col-md-8">
                    <p><em><b>Black Tea Macchiato </b>(trà đen Macchiato) là thức uống hiện nay rất được ưa chuộng tại hệ thống The Coffee House, Hot and Cold… Bạn cũng có thể tự chuẩn bị cho mình một ly Black Tea Macchiato vừa ngon vừa chất lượng, đúng sở thích nếu như không có thời gian đến với các cửa hàng thức uống.</em></p>
                    <ol class="margin-top-30">
                        <p><strong>Công thức chung:</strong></p>
                        <li>Topping Base: 15 ml</li>
                        <li>Sữa tươi: 30 ml</li>
                        <li>Kem béo Rich’s: 15 ml</li>
                        <li>Frappe choice: 10 ml</li>
                        <li>Muối trắng: 1/8 muỗng</li>
                        <li>Trà ô long (1 túi lọc): 5 gr</li>
                        <li>Đường cát trắng: 15 gr</li>
                    </ol>
                    <a href="https://dayphache.edu.vn/cach-lam-black-tea-macchiato" rel="nofollow">Xem tiếp...</a>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
