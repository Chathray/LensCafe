<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Order.Contact" %>

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
                <a id="btnDetails" runat="server" href="#main" class="tm-more-button tm-more-button-welcome"><i class="fa fa-angle-down"></i></a>
            </div>
            <img src="img/table-set.png" alt="Table Set" class="tm-table-set img-responsive">
        </div>
    </section>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" id="main">
        <section class="tm-section row">
            <h3 class="col-lg-12 margin-bottom-30">Hãy kết nối với chúng tôi</h3>
            <form action="#" method="post" class="tm-contact-form">
                <div class="col-lg-6 col-md-6">
                    <div class="form-group">
                        <input type="text" id="contact_name" class="form-control" placeholder="Tên của bạn" />
                    </div>
                    <div class="form-group">
                        <input type="email" id="contact_email" class="form-control" placeholder="Email" />
                    </div>
                    <div class="form-group">
                        <input type="text" id="contact_subject" class="form-control" placeholder="Số điện thoại" />
                    </div>
                    <div class="form-group">
                        <textarea id="contact_message" class="form-control" rows="6" placeholder="Nội dung"></textarea>
                    </div>
                    <div class="form-group">
                        <button class="tm-more-button" type="submit" name="submit">Gửi</button>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div id="google-map">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3875.315434677589!2d109.21278561434144!3d13.759841700815437!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x316f6cea4cbc15bd%3A0xc257226e6bc47b71!2sLens%20Coffee!5e0!3m2!1svi!2s!4v1606654770575!5m2!1svi!2s" width="100%" height="100%" style="border: 0;" aria-hidden="false" tabindex="0"></iframe>
                    </div>
                </div>
            </form>
        </section>
    </div>
</asp:Content>
