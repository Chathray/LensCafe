<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="Order.Menu" %>

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
                <p class="gray-text tm-welcome-description"></p>
                <a id="btnDetails" runat="server" href="#main" class="tm-more-button tm-more-button-welcome"><i class="fa fa-angle-double-down"></i></a>
            </div>
            <img src="img/table-set.png" alt="Table Set" class="tm-table-set img-responsive">
        </div>
    </section>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="tm-section row">
        <div class="col-lg-12 tm-section-header-container margin-bottom-30">
            <h2 class="tm-section-header gold-text tm-handwriting-font">
                <img src="img/logo.png" alt="Logo" class="tm-site-logo">
                Thực Đơn</h2>
            <div class="tm-hr-container">
                <hr class="tm-hr">
            </div>
        </div>
        <div>

            <div class="col-lg-3 col-md-3">
                <div class="tm-position-relative margin-bottom-30">
                    <nav class="tm-side-menu">
                        <ul>
                            <li data-stt="1" class="menu-fuzzy"><a>Affogato</a></li>
                            <li data-stt="2" class="menu-fuzzy"><a class="active">Café Americano</a></li>
                            <li data-stt="3" class="menu-fuzzy"><a>Café latte</a></li>
                            <li data-stt="4" class="menu-fuzzy"><a>Coffee milk</a></li>
                            <li data-stt="5" class="menu-fuzzy"><a>Café mocha</a></li>
                            <li data-stt="6" class="menu-fuzzy"><a>Cappuccino</a></li>
                            <li data-stt="7" class="menu-fuzzy"><a>Espresso</a></li>
                            <li data-stt="8" class="menu-fuzzy"><a>Iced coffee</a></li>
                            <li data-stt="9" class="menu-fuzzy"><a>Instant coffee</a></li>
                            <li data-stt="10" class="menu-fuzzy"><a>Mocha</a></li>
                            <li data-stt="11" class="menu-fuzzy"><a>Black coffee</a></li>
                        </ul>
                    </nav>
                    <img src="img/vertical-menu-bg.png" alt="Menu bg" class="tm-side-menu-bg">
                </div>
            </div>

            <div id="menuContent" class="tm-menu-product-content col-lg-9 col-md-9">
                <!-- menu content -->
                <div class="tm-product">
                    <img src="images/americano/americano.jpg" alt="Product" class="imgmenu">
                    <div class="tm-product-text">
                        <h3 class="tm-product-title">Classic Americano</h3>
                        <p class="tm-product-description">Espresso shots topped with hot water create a light layer of crema culminating in this wonderfully rich cup with depth and nuance.</p>
                    </div>
                    <div class="tm-product-price">
                        <a href="#" class="tm-product-price-link tm-handwriting-font text-center">$30</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
