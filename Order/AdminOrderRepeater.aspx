<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminOrderRepeater.aspx.cs" Inherits="Order.AdminOrderRepeater" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required Meta Tags Always Come First -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Title -->
    <title>Lens Coffee Shop | Administrators</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="./S/favicon.ico">

    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="./S/vendor.min.css">
    <link rel="stylesheet" href="./S/style.css">



    <!-- CSS Front Template -->
    <link rel="stylesheet" href="./S/theme.min.css?v=1.0">
</head>

<body class="   footer-offset">

    <script src="./S/hs-navbar-vertical-aside-mini-cache.js"></script>


    <!-- ========== MAIN CONTENT ========== -->

    <main id="content" role="main" class="main">
        <!-- Content -->
        <div class="content container-fluid">
            <!-- Page Header -->
            <div class="page-header">
                <div class="row align-items-center mb-3">
                    <div class="col-sm">
                        <a href="Home.aspx">
                            <h2 class="page-header-title"><span class="text-warning">Lens </span><span class="text-primary">Café</span></h2>
                        </a>
                    </div>
                    <div class="col-sm-auto">
                        <!-- Nav -->
                        <ul class="nav nav-segment" id="leaderboardTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="all-time-tab" data-toggle="tab" href="#all-time" role="tab" aria-selected="true">Toàn bộ
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="today-tab" data-toggle="tab" href="#today" role="tab" aria-selected="false">Hôm nay
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="weekly-tab" data-toggle="tab" href="#weekly" role="tab" aria-selected="false">Tuần này
                                </a>
                            </li>
                        </ul>
                        <!-- End Nav -->
                    </div>
                </div>
            </div>
            <!-- End Page Header -->

            <div class="card card-body mb-3 mb-lg-5" style="margin-top: 1.5rem;">
                <div class="row gx-lg-4">
                    <div class="col-sm-6 col-lg-3">
                        <div class="media">
                            <div class="media-body">
                                <h6 class="card-subtitle">Hôm nay</h6>
                                <span id="thomnay" runat="server" class="card-title h3"></span>

                                <div class="d-flex align-items-center">
                                    <span id="chomnay" runat="server" class="d-block font-size-sm"></span>
                                </div>
                            </div>

                            <span class="icon icon-sm icon-soft-light icon-circle ml-3 bg-info">
                                <i class="tio-time"></i>
                            </span>
                        </div>

                        <div class="d-lg-none">
                            <hr>
                        </div>
                    </div>

                    <div class="col-sm-6 col-lg-3 column-divider-sm">
                        <div class="media">
                            <div class="media-body">
                                <h6 class="card-subtitle">Đã thanh toán</h6>
                                <span id="tdathanhtoan" runat="server" class="card-title h3"></span>

                                <div class="d-flex align-items-center">
                                    <span id="cdathanhtoan" runat="server" class="d-block font-size-sm"></span>
                                </div>
                            </div>

                            <span class="icon icon-sm icon-soft-light icon-circle ml-3 bg-success">
                                <i class="tio-done"></i>
                            </span>
                        </div>

                        <div class="d-lg-none">
                            <hr>
                        </div>
                    </div>

                    <div class="col-sm-6 col-lg-3 column-divider-lg">
                        <div class="media">
                            <div class="media-body">
                                <h6 class="card-subtitle">Đang chờ</h6>
                                <span id="tdancho" runat="server" class="card-title h3"></span>

                                <div class="d-flex align-items-center">
                                    <span id="cdancho" runat="server" class="d-block font-size-sm"></span>
                                </div>
                            </div>

                            <span class="icon icon-sm icon-soft-light icon-circle ml-3 bg-warning">
                                <i class="tio-infinity"></i>
                            </span>
                        </div>

                        <div class="d-sm-none">
                            <hr>
                        </div>
                    </div>

                    <div class="col-sm-6 col-lg-3 column-divider-sm">
                        <div class="media">
                            <div class="media-body">
                                <h6 class="card-subtitle">Tổng cộng</h6>
                                <span id="tdoanhthu" runat="server" class="card-title h3"></span>

                                <div class="d-flex align-items-center">
                                    <span id="cdoanhthu" runat="server" class="d-block font-size-sm"></span>
                                </div>
                            </div>

                            <span class="icon icon-sm icon-soft-light icon-circle ml-3 bg-primary">
                                <i class="tio-wishlist-outlined"></i>
                            </span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Card -->
            <div class="card">
                <!-- Header -->
                <div class="card-header">
                    <div class="row justify-content-between align-items-center flex-grow-1">
                        <div class="col-12 col-md">
                            <div class="d-flex justify-content-between align-items-center">
                                <button id="js-daterangepicker-predefined" class="btn btn-sm btn-white dropdown-toggle mb-2 mb-sm-0">
                                    <i class="tio-date-range"></i>
                                    <span class="js-daterangepicker-predefined-preview ml-1"></span>
                                </button>
                            </div>
                        </div>

                        <div class="col-auto">
                            <!-- Filter -->
                            <div class="row align-items-sm-center">
                                <div class="col-sm-auto">
                                    <div class="d-flex align-items-center mr-2">
                                        <span class="text-secondary">Tình trạng:</span>

                                        <!-- Select -->
                                        <select class="js-select2-custom js-datatable-filter custom-select-sm" size="1" style="opacity: 0;"
                                            data-target-column-index="9"
                                            data-hs-select2-options='{
                                "minimumResultsForSearch": "Infinity",
                                "customClass": "custom-select custom-select-sm custom-select-borderless",
                                "dropdownAutoWidth": true,
                                "width": true
                              }'>
                                            <option value="">Tất cả</option>
                                            <option value="Đã thanh toán">Đã thanh toán</option>
                                            <option value="Đang chờ">Đang chờ</option>
                                            <option value="Đã hủy">Đã hủy</option>
                                        </select>
                                        <!-- End Select -->

                                    </div>
                                </div>

                                <div class="col-md">
                                    <form>
                                        <!-- Search -->
                                        <div class="input-group input-group-merge input-group-flush">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">
                                                    <i class="tio-search"></i>
                                                </div>
                                            </div>
                                            <input id="datatableSearch" type="search" class="form-control" placeholder="Tìm kiếm" aria-label="Search">
                                        </div>
                                        <!-- End Search -->
                                    </form>
                                </div>
                            </div>
                            <!-- End Filter -->
                        </div>
                    </div>
                </div>
                <!-- End Header -->

                <!-- Table -->
                <div class="table-responsive datatable-custom">
                    <form id="form00" runat="server">

                        <table id="datatable" class="table table-sm table-hover table-borderless table-thead-bordered table-nowrap table-align-middle card-table" style="width: 100%"
                            data-hs-datatables-options='{
                     "columnDefs": [{
                        "targets": [0],
                        "orderable": false
                      }],
                     "order": [],
                     "info": {
                       "totalQty": "#datatableWithPaginationInfoTotalQty"
                     },
                     "search": "#datatableSearch",
                     "entries": "#datatableEntries",
                     "pageLength": 12,
                     "isResponsive": true,
                     "isShowPaging": false,
                     "pagination": "datatablePagination"
                   }'>
                            <thead class="thead-light">
                                <tr>
                                    <th scope="col" class="table-column-pr-0">
                                        <div class="custom-control custom-checkbox">
                                            <input id="datatableCheckAll" type="checkbox" class="custom-control-input">
                                            <label class="custom-control-label" for="datatableCheckAll"></label>
                                        </div>
                                    </th>
                                    <th>UID</th>
                                    <th>ID</th>
                                    <th>Tên hàng</th>
                                    <th>Số lượng</th>
                                    <th>Ngày</th>
                                    <th>Lớp phủ</th>
                                    <th>Bổ sung</th>
                                    <th>Tổng tiền</th>
                                    <th>Trạng thái</th>
                                    <th>Lựa chọn</th>
                                </tr>
                            </thead>

                            <asp:Repeater ID="repeaterAdminOrder" runat="server">
                                <ItemTemplate>
                                    <tr role="row">
                                        <td class="table-column-pr-0">
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="ordersCheck<%# Eval("OrderId") %>">
                                                <label class="custom-control-label" for="ordersCheck<%# Eval("OrderId") %>"></label>
                                            </div>
                                        </td>

                                        <td><%# Eval("MemberId") %></td>
                                        <td class="text-primary"><%# Eval("OrderId") %></td>

                                        <td>
                                            <a class="">
                                                <span class="h5 text-hover-primary mb-0"><%# Eval("Flavor") %></span>
                                            </a>
                                        </td>

                                        <td><%# Eval("Quantity") %></td>
                                        <td><%# Eval("Date", "{0:dd/MM/yyyy}") %></td>
                                        <td><%# Eval("Topping") %></td>
                                        <td><%# Eval("AddOns") %></td>
                                        <td><%# Eval("TotalPrice") %></td>


                                        <td>
                                            <span class="legend-indicator <%#GetCheckMark(Eval("Status").ToString())%>"></span><%# Eval("Status") %>
                                        </td>


                                        <td>
                                            <div class="btn-group" role="group">
                                                <asp:LinkButton ID="orderLinkButton" runat="server" CssClass="btn btn-sm btn-white" CommandArgument='<%# Eval("OrderId").ToString() %>' OnClick="ViewOrder">
                                                <i class="tio-visible-outlined"></i> Xem
                                                </asp:LinkButton>

                                                <!-- Unfold -->
                                                <div class="hs-unfold btn-group">
                                                    <a class="js-hs-unfold-invoker btn btn-icon btn-sm btn-white dropdown-toggle dropdown-toggle-empty" href="javascript:;" data-hs-unfold-options="{&quot;target&quot;: &quot;#ordersDropdown<%# Eval("OrderId") %>&quot;,&quot;type&quot;: &quot;css-animation&quot;,&quot;smartPositionOffEl&quot;: &quot;#datatable&quot;}"
                                                        data-hs-unfold-target="#ordersDropdown<%# Eval("OrderId") %>" data-hs-unfold-invoker=""></a>
                                                    <div id="ordersDropdown<%# Eval("OrderId") %>" class="hs-unfold-content dropdown-unfold dropdown-menu dropdown-menu-sm dropdown-menu-right mt-1 hs-unfold-hidden hs-unfold-content-initialized hs-unfold-css-animation animated" data-hs-target-height="324" data-hs-unfold-content="" data-hs-unfold-content-animation-in="slideInUp" data-hs-unfold-content-animation-out="fadeOut" style="animation-duration: 300ms;">

                                                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="dropdown-item" CommandArgument='<%# Eval("OrderId").ToString() %>' OnClick="DoneOrder">
                                                            <i class="tio-done dropdown-item-icon"></i> Xác nhận
                                                        </asp:LinkButton>
                                                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="dropdown-item" CommandArgument='<%# Eval("OrderId").ToString() %>' OnClick="CancelOrder">
                                                            <i class="tio-clear dropdown-item-icon"></i> Hủy đơn
                                                        </asp:LinkButton>
                                                        <div class="dropdown-divider"></div>
                                                        <asp:LinkButton ID="LinkButton3" runat="server" CssClass="dropdown-item" CommandArgument='<%# Eval("OrderId").ToString() %>' OnClick="DelOrder">
                                                            <i class="tio-remove dropdown-item-icon"></i> Xóa
                                                        </asp:LinkButton>

                                                    </div>
                                                </div>
                                                <!-- End Unfold -->
                                            </div>
                                        </td>


                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>

                        </table>
                    </form>
                </div>
                <!-- End Table -->

                <!-- Footer -->
                <div class="card-footer">
                    <!-- Pagination -->
                    <div class="row justify-content-center justify-content-sm-between align-items-sm-center">
                        <div class="col-sm mb-2 mb-sm-0">
                            <div class="d-flex justify-content-center justify-content-sm-start align-items-center">
                                <span class="mr-1">Hiện:</span>

                                <!-- Select -->
                                <select id="datatableEntries" class="js-select2-custom"
                                    data-hs-select2-options='{
                            "minimumResultsForSearch": "Infinity",
                            "customClass": "custom-select custom-select-sm custom-select-borderless",
                            "dropdownAutoWidth": true,
                            "width": true
                          }'>
                                    <option value="12 selected">12</option>
                                    <option value="14">14</option>
                                    <option value="16">16</option>
                                    <option value="-1">Tất cả</option>
                                </select>
                                <!-- End Select -->

                                <span class="text-secondary mr-2">trong tổng số</span>

                                <!-- Pagination Quantity -->
                                <span id="datatableWithPaginationInfoTotalQty"></span>
                                <span class="text-secondary ml-2">mục</span>
                            </div>
                        </div>

                        <div class="col-sm-auto">
                            <div class="d-flex justify-content-center justify-content-sm-end">
                                <!-- Pagination -->
                                <nav id="datatablePagination" aria-label="Activity pagination"></nav>
                            </div>
                        </div>

                        <div class="col-sm-auto">

                            <div class="d-sm-flex justify-content-sm-end align-items-sm-center">

                                <!-- Datatable Info -->
                                <div id="datatableCounterInfo" class="mr-2 mb-2 mb-sm-0" style="display: none;">
                                    <div class="d-flex align-items-center">
                                        <span class="font-size-sm mr-3">Đã chọn
                                            <span id="datatableCounter">0</span>
                                        </span>
                                        <a class="btn btn-sm btn-outline-danger" href="javascript:;">
                                            <i class="tio-delete-outlined"></i>Xóa
                                        </a>
                                    </div>
                                </div>
                                <!-- End Datatable Info -->

                                <!-- Unfold -->
                                <div class="hs-unfold mr-2">
                                    <a class="js-hs-unfold-invoker btn btn-sm btn-white dropdown-toggle" href="javascript:;" data-hs-unfold-options="{
                         &quot;target&quot;: &quot;#usersExportDropdown&quot;,
                         &quot;type&quot;: &quot;css-animation&quot;
                       }"
                                        data-hs-unfold-target="#usersExportDropdown" data-hs-unfold-invoker="">
                                        <i class="tio-download-to mr-1"></i>Xuất
                                    </a>

                                    <div id="usersExportDropdown" class="hs-unfold-content dropdown-unfold dropdown-menu dropdown-menu-sm-right hs-unfold-content-initialized hs-unfold-css-animation animated slideInUp" data-hs-target-height="275" data-hs-unfold-content="" data-hs-unfold-content-animation-in="slideInUp" data-hs-unfold-content-animation-out="fadeOut" style="animation-duration: 300ms;">
                                        <span class="dropdown-header">Tùy chọn</span>
                                        <a id="export-copy" class="dropdown-item" href="javascript:;">
                                            <img class="avatar avatar-xss avatar-4by3 mr-2" src="./img/copy.svg" alt="Image Description">
                                            Sao chép
                                        </a>
                                        <a id="export-print" class="dropdown-item" href="javascript:;">
                                            <img class="avatar avatar-xss avatar-4by3 mr-2" src="./img/print.svg" alt="Image Description">
                                            In...
                                        </a>
                                        <div class="dropdown-divider"></div>
                                        <span class="dropdown-header">Tải về</span>
                                        <a id="export-excel" class="dropdown-item" href="javascript:;">
                                            <img class="avatar avatar-xss avatar-4by3 mr-2" src="./img/excel.svg" alt="Image Description">
                                            Excel
                                        </a>
                                        <a id="export-csv" class="dropdown-item" href="javascript:;">
                                            <img class="avatar avatar-xss avatar-4by3 mr-2" src="./img/placeholder-csv-format.svg" alt="Image Description">
                                            .CSV
                                        </a>
                                        <a id="export-pdf" class="dropdown-item" href="javascript:;">
                                            <img class="avatar avatar-xss avatar-4by3 mr-2" src="./img/pdf.svg" alt="Image Description">
                                            PDF
                                        </a>
                                    </div>
                                </div>
                                <!-- End Unfold -->

                                <!-- Unfold -->
                                <div class="hs-unfold">
                                    <a class="js-hs-unfold-invoker btn btn-sm btn-white" href="javascript:;"
                                        data-hs-unfold-options='{
                         "target": "#showHideDropdown",
                         "type": "css-animation"
                       }'>
                                        <i class="tio-table mr-1"></i>Columns <span id="colcount" runat="server" class="badge badge-soft-dark rounded-circle ml-1"></span>
                                    </a>

                                    <div id="showHideDropdown" class="hs-unfold-content dropdown-unfold dropdown-menu dropdown-menu-right dropdown-card" style="width: 15rem;">
                                        <div class="card card-sm">
                                            <div class="card-body">
                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="mr-2">Mã người dùng</span>

                                                    <!-- Checkbox 1 -->
                                                    <label class="toggle-switch toggle-switch-sm" for="toggleColumn_uid">
                                                        <input type="checkbox" class="toggle-switch-input" id="toggleColumn_uid">
                                                        <span class="toggle-switch-label">
                                                            <span class="toggle-switch-indicator"></span>
                                                        </span>
                                                    </label>
                                                    <!-- End Checkbox Switch -->
                                                </div>

                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="mr-2">Mã đơn hàng</span>

                                                    <!-- Checkbox 2 -->
                                                    <label class="toggle-switch toggle-switch-sm" for="toggleColumn_id">
                                                        <input type="checkbox" class="toggle-switch-input" id="toggleColumn_id" checked>
                                                        <span class="toggle-switch-label">
                                                            <span class="toggle-switch-indicator"></span>
                                                        </span>
                                                    </label>
                                                    <!-- End Checkbox Switch -->
                                                </div>

                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="mr-2">Tên hàng</span>

                                                    <!-- Checkbox 3 -->
                                                    <label class="toggle-switch toggle-switch-sm" for="toggleColumn_flavor">
                                                        <input type="checkbox" class="toggle-switch-input" id="toggleColumn_flavor" checked>
                                                        <span class="toggle-switch-label">
                                                            <span class="toggle-switch-indicator"></span>
                                                        </span>
                                                    </label>
                                                    <!-- End Checkbox Switch -->
                                                </div>

                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="mr-2">Số lượng</span>

                                                    <!-- Checkbox 4 -->
                                                    <label class="toggle-switch toggle-switch-sm" for="toggleColumn_quantity">
                                                        <input type="checkbox" class="toggle-switch-input" id="toggleColumn_quantity" checked>
                                                        <span class="toggle-switch-label">
                                                            <span class="toggle-switch-indicator"></span>
                                                        </span>
                                                    </label>
                                                    <!-- End Checkbox Switch -->
                                                </div>

                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="mr-2">Ngày tạo</span>

                                                    <!-- Checkbox 5 -->
                                                    <label class="toggle-switch toggle-switch-sm" for="toggleColumn_date">
                                                        <input type="checkbox" class="toggle-switch-input" id="toggleColumn_date" checked>
                                                        <span class="toggle-switch-label">
                                                            <span class="toggle-switch-indicator"></span>
                                                        </span>
                                                    </label>
                                                    <!-- End Checkbox Switch -->
                                                </div>

                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="mr-2">Lớp phủ</span>

                                                    <!-- Checkbox 6 -->
                                                    <label class="toggle-switch toggle-switch-sm" for="toggleColumn_topping">
                                                        <input type="checkbox" class="toggle-switch-input" id="toggleColumn_topping" checked>
                                                        <span class="toggle-switch-label">
                                                            <span class="toggle-switch-indicator"></span>
                                                        </span>
                                                    </label>
                                                    <!-- End Checkbox Switch -->
                                                </div>

                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="mr-2">Bổ sung</span>

                                                    <!-- Checkbox 7 -->
                                                    <label class="toggle-switch toggle-switch-sm" for="toggleColumn_addons">
                                                        <input type="checkbox" class="toggle-switch-input" id="toggleColumn_addons" checked>
                                                        <span class="toggle-switch-label">
                                                            <span class="toggle-switch-indicator"></span>
                                                        </span>
                                                    </label>
                                                    <!-- End Checkbox Switch -->
                                                </div>

                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="mr-2">Đơn giá</span>

                                                    <!-- Checkbox 8 -->
                                                    <label class="toggle-switch toggle-switch-sm" for="toggleColumn_cost">
                                                        <input type="checkbox" class="toggle-switch-input" id="toggleColumn_cost" checked>
                                                        <span class="toggle-switch-label">
                                                            <span class="toggle-switch-indicator"></span>
                                                        </span>
                                                    </label>
                                                    <!-- End Checkbox Switch -->
                                                </div>

                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="mr-2">Trạng thái</span>

                                                    <!-- Checkbox 9 -->
                                                    <label class="toggle-switch toggle-switch-sm" for="toggleColumn_status">
                                                        <input type="checkbox" class="toggle-switch-input" id="toggleColumn_status" checked>
                                                        <span class="toggle-switch-label">
                                                            <span class="toggle-switch-indicator"></span>
                                                        </span>
                                                    </label>
                                                    <!-- End Checkbox Switch -->
                                                </div>

                                                <div class="d-flex justify-content-between align-items-center">
                                                    <span class="mr-2">Lựa chọn</span>

                                                    <!-- Checkbox 10 -->
                                                    <label class="toggle-switch toggle-switch-sm" for="toggleColumn_actions">
                                                        <input type="checkbox" class="toggle-switch-input" id="toggleColumn_actions" checked>
                                                        <span class="toggle-switch-label">
                                                            <span class="toggle-switch-indicator"></span>
                                                        </span>
                                                    </label>
                                                    <!-- End Checkbox Switch -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Unfold -->
                            </div>
                        </div>

                    </div>
                    <!-- End Pagination -->
                </div>
                <!-- End Footer -->
            </div>
            <!-- End Card -->
        </div>
        <!-- End Content -->

        <!-- Footer -->

        <div class="footer">
            <div class="row justify-content-between align-items-center">
                <div class="col">
                    <p class="font-size-sm mb-0">Copyright &copy; <span class="d-none d-sm-inline-block">2021 Lens Café. All rights reserved</span></p>
                </div>
                <div class="col-auto">
                    <div class="d-flex justify-content-end">
                        <!-- List Dot -->
                        <ul class="list-inline list-separator">
                            <li class="list-inline-item">
                                <a class="list-separator-link" href="#">FAQ</a>
                            </li>

                            <li class="list-inline-item">
                                <a class="list-separator-link" href="#">License</a>
                            </li>

                            <li class="list-inline-item">
                                <!-- Keyboard Shortcuts Toggle -->
                                <div class="hs-unfold">
                                    <a class="js-hs-unfold-invoker btn btn-icon btn-ghost-secondary rounded-circle" href="javascript:;"
                                        data-hs-unfold-options='{
                              "target": "#keyboardShortcutsSidebar",
                              "type": "css-animation",
                              "animationIn": "fadeInRight",
                              "animationOut": "fadeOutRight",
                              "hasOverlay": true,
                              "smartPositionOff": true
                             }'>
                                        <i class="tio-command-key"></i>
                                    </a>
                                </div>
                                <!-- End Keyboard Shortcuts Toggle -->
                            </li>
                        </ul>
                        <!-- End List Dot -->
                    </div>
                </div>
            </div>
        </div>



        <!-- End Footer -->
    </main>
    <!-- ========== END MAIN CONTENT ========== -->

    <!-- ========== SECONDARY CONTENTS ========== -->
    <!-- Keyboard Shortcuts -->
    <div id="keyboardShortcutsSidebar" class="hs-unfold-content sidebar sidebar-bordered sidebar-box-shadow">
        <div class="card card-lg sidebar-card">
            <div class="card-header">
                <h4 class="card-header-title">Keyboard shortcuts</h4>

                <!-- Toggle Button -->
                <a class="js-hs-unfold-invoker btn btn-icon btn-xs btn-ghost-dark ml-2" href="javascript:;"
                    data-hs-unfold-options='{
                "target": "#keyboardShortcutsSidebar",
                "type": "css-animation",
                "animationIn": "fadeInRight",
                "animationOut": "fadeOutRight",
                "hasOverlay": true,
                "smartPositionOff": true
               }'>
                    <i class="tio-clear tio-lg"></i>
                </a>
                <!-- End Toggle Button -->
            </div>

            <!-- Body -->
            <div class="card-body sidebar-body sidebar-scrollbar">
                <div class="list-group list-group-sm list-group-flush list-group-no-gutters mb-5">
                    <div class="list-group-item">
                        <h5 class="mb-1">Formatting</h5>
                    </div>
                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span class="font-weight-bold">Bold</span>
                            </div>
                            <div class="col-7 text-right">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">b</kbd>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <em>italic</em>
                            </div>
                            <div class="col-7 text-right">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">i</kbd>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <u>Underline</u>
                            </div>
                            <div class="col-7 text-right">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">u</kbd>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <s>Strikethrough</s>
                            </div>
                            <div class="col-7 text-right">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">Alt</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">s</kbd>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span class="small">Small text</span>
                            </div>
                            <div class="col-7 text-right">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">s</kbd>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <mark>Highlight</mark>
                            </div>
                            <div class="col-7 text-right">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">e</kbd>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="list-group list-group-sm list-group-flush list-group-no-gutters mb-5">
                    <div class="list-group-item">
                        <h5 class="mb-1">Insert</h5>
                    </div>
                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Mention person <a href="#">(@Brian)</a></span>
                            </div>
                            <div class="col-7 text-right">
                                <kbd class="d-inline-block mb-1">@</kbd>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Link to doc <a href="#">(+Meeting notes)</a></span>
                            </div>
                            <div class="col-7 text-right">
                                <kbd class="d-inline-block mb-1">+</kbd>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <a href="#">#hashtag</a>
                            </div>
                            <div class="col-7 text-right">
                                <kbd class="d-inline-block mb-1">#hashtag</kbd>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Date</span>
                            </div>
                            <div class="col-7 text-right">
                                <kbd class="d-inline-block mb-1">/date</kbd>
                                <kbd class="d-inline-block mb-1">Space</kbd>
                                <kbd class="d-inline-block mb-1">/datetime</kbd>
                                <kbd class="d-inline-block mb-1">/datetime</kbd>
                                <kbd class="d-inline-block mb-1">Space</kbd>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Time</span>
                            </div>
                            <div class="col-7 text-right">
                                <kbd class="d-inline-block mb-1">/time</kbd>
                                <kbd class="d-inline-block mb-1">Space</kbd>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Note box</span>
                            </div>
                            <div class="col-7 text-right">
                                <kbd class="d-inline-block mb-1">/note</kbd>
                                <kbd class="d-inline-block mb-1">Enter</kbd>
                                <kbd class="d-inline-block mb-1">/note red</kbd>
                                <kbd class="d-inline-block mb-1">/note red</kbd>
                                <kbd class="d-inline-block mb-1">Enter</kbd>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="list-group list-group-sm list-group-flush list-group-no-gutters mb-5">
                    <div class="list-group-item">
                        <h5 class="mb-1">Editing</h5>
                    </div>
                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Find and replace</span>
                            </div>
                            <div class="col-7 text-right">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">r</kbd>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Find next</span>
                            </div>
                            <div class="col-7 text-right">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">n</kbd>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Find previous</span>
                            </div>
                            <div class="col-7 text-right">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">p</kbd>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Indent</span>
                            </div>
                            <div class="col-7 text-right">
                                <kbd class="d-inline-block mb-1">Tab</kbd>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Un-indent</span>
                            </div>
                            <div class="col-7 text-right">
                                <kbd class="d-inline-block mb-1">Shift</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">Tab</kbd>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Move line up</span>
                            </div>
                            <div class="col-7 text-right">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">Shift</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1"><i class="tio-arrow-large-upward-outlined"></i></kbd>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Move line down</span>
                            </div>
                            <div class="col-7 text-right">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">Shift</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1"><i class="tio-arrow-large-downward-outlined font-size-sm"></i></kbd>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Add a comment</span>
                            </div>
                            <div class="col-7 text-right">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">Alt</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">m</kbd>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Undo</span>
                            </div>
                            <div class="col-7 text-right">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">z</kbd>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Redo</span>
                            </div>
                            <div class="col-7 text-right">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">y</kbd>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="list-group list-group-sm list-group-flush list-group-no-gutters">
                    <div class="list-group-item">
                        <h5 class="mb-1">Application</h5>
                    </div>
                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Create new doc</span>
                            </div>
                            <div class="col-7 text-right">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">Alt</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">n</kbd>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Present</span>
                            </div>
                            <div class="col-7 text-right">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">Shift</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">p</kbd>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Share</span>
                            </div>
                            <div class="col-7 text-right">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">Shift</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">s</kbd>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Search docs</span>
                            </div>
                            <div class="col-7 text-right">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">Shift</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">o</kbd>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item">
                        <div class="row align-items-center">
                            <div class="col-5">
                                <span>Keyboard shortcuts</span>
                            </div>
                            <div class="col-7 text-right">
                                <kbd class="d-inline-block mb-1">Ctrl</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">Shift</kbd> <small class="text-muted">+</small> <kbd class="d-inline-block mb-1">/</kbd>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Body -->
        </div>
    </div>
    <!-- End Keyboard Shortcuts -->

    <!-- ========== END SECONDARY CONTENTS ========== -->


    <!-- JS Implementing Plugins -->
    <script src="./S/vendor.min.js"></script>



    <!-- JS Front -->
    <script src="./S/theme.min.js"></script>

    <!-- JS Plugins Init. -->
    <script>
        if (window.history.replaceState) {
            window.history.replaceState(null, null, window.location.href);
        }

        var start = moment("19900101", "YYYYMMDD");
        var end = moment();

        $.fn.dataTableExt.afnFiltering.push(
            function (oSettings, aData, iDataIndex) {
                if (start === "" && end === "") return true;

                var min = start.format('DD/MM/YYYY');
                var max = end.format('DD/MM/YYYY')
                var cur = aData[5];

                min = min.substring(6, 10) + min.substring(3, 5) + min.substring(0, 2);
                max = max.substring(6, 10) + max.substring(3, 5) + max.substring(0, 2);
                cur = cur.substring(6, 10) + cur.substring(3, 5) + cur.substring(0, 2);


                if (min <= cur && max === "") {
                    return true;
                }
                else if (max >= cur && min === "") {
                    return true;
                }
                else if (min <= cur && max >= cur) {
                    return true;
                }
                return false;
            }
        );

        $(document).on('ready', function () {

            $('#all-time-tab').click(function () {
                cb(moment("01011990", "DDMMYYYY"), moment());
            });

            $('#today-tab').click(function () {
                var today = moment();
                cb(today, today);
            });

            $('#weekly-tab').click(function () {
                var from_date = moment().startOf('isoWeek');
                var to_date = moment().endOf('isoWeek')
                cb(from_date, to_date);
            });

            // INITIALIZATION OF UNFOLD
            // =======================================================
            $('.js-hs-unfold-invoker').each(function () {
                var unfold = new HSUnfold($(this)).init();
            });


            // INITIALIZATION OF FORM SEARCH
            // =======================================================
            $('.js-form-search').each(function () {
                new HSFormSearch($(this)).init()
            });


            // INITIALIZATION OF NAV SCROLLER
            // =======================================================
            $('.js-nav-scroller').each(function () {
                new HsNavScroller($(this)).init()
            });


            // INITIALIZATION OF SELECT2
            // =======================================================
            $('.js-select2-custom').each(function () {
                var select2 = $.HSCore.components.HSSelect2.init($(this));
            });


            // INITIALIZATION OF DATERANGEPICKER
            // =======================================================
            $('.js-daterangepicker').daterangepicker();

            $('.js-daterangepicker-times').daterangepicker({
                timePicker: true,
                startDate: moment().startOf('hour'),
                endDate: moment().startOf('hour').add(32, 'hour'),
                locale: {
                    format: 'DD/MM/YYYY hh:mm A'
                }
            });

            function cb(s, e) {
                start = s;
                end = e;

                $('#js-daterangepicker-predefined .js-daterangepicker-predefined-preview')
                    .html(s.format('DD/MM/YYYY') + ' - ' + e.format('DD/MM/YYYY'));

                if (datatable != null)
                    datatable.draw();
            }

            $('#js-daterangepicker-predefined').daterangepicker({
                startDate: start,
                endDate: end,
                ranges: {
                    'Hôm nay': [moment(), moment()],
                    'Hôm qua': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                    '7 ngày trước': [moment().subtract(6, 'days'), moment()],
                    '30 ngày trước': [moment().subtract(29, 'days'), moment()],
                    'Tháng này': [moment().startOf('month'), moment().endOf('month')],
                    'Tháng trước': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')],
                    'Năm nay': [moment().startOf('year'), moment().endOf('year')],
                    'Năm trước': [moment().subtract(1, 'year').startOf('year'), moment().subtract(1, 'year').endOf('year')],
                }
            }, cb);

            cb(start, end);


            // INITIALIZATION OF DATATABLES
            // =======================================================
            var datatable = $.HSCore.components.HSDatatables.init($('#datatable'), {
                dom: 'Bfrtip',
                buttons: [
                    {
                        extend: 'copy',
                        className: 'd-none'
                    },
                    {
                        extend: 'excel',
                        className: 'd-none'
                    },
                    {
                        extend: 'csv',
                        className: 'd-none'
                    },
                    {
                        extend: 'pdf',
                        className: 'd-none'
                    },
                    {
                        extend: 'print',
                        className: 'd-none'
                    },
                ],
                select: {
                    style: 'multi',
                    selector: 'td:first-child input[type="checkbox"]',
                    classMap: {
                        checkAll: '#datatableCheckAll',
                        counter: '#datatableCounter',
                        counterInfo: '#datatableCounterInfo'
                    }
                },
                language: {
                    zeroRecords: '<div class="text-center p-4">' +
                        '<img class="mb-3" src="./img/sorry.svg" alt="Image Description" style="width: 7rem;">' +
                        '<p class="mb-0">Không có dữ liệu để hiển thị</p>' +
                        '</div>'
                }
            });

            datatable.columns(1).visible(false);

            $('#export-copy').click(function () {
                datatable.button('.buttons-copy').trigger()
            });

            $('#export-excel').click(function () {
                datatable.button('.buttons-excel').trigger()
            });

            $('#export-csv').click(function () {
                datatable.button('.buttons-csv').trigger()
            });

            $('#export-pdf').click(function () {
                datatable.button('.buttons-pdf').trigger()
            });

            $('#export-print').click(function () {
                datatable.button('.buttons-print').trigger()
            });

            $('.js-datatable-filter').on('change', function () {
                var $this = $(this),
                    elVal = $this.val(),
                    targetColumnIndex = $this.data('target-column-index');

                datatable.column(targetColumnIndex).search(elVal).draw();
            });

            $('#datatableSearch').on('mouseup', function (e) {
                var $input = $(this),
                    oldValue = $input.val();

                if (oldValue == "") return;

                setTimeout(function () {
                    var newValue = $input.val();

                    if (newValue == "") {
                        // Gotcha
                        datatable.search('').draw();
                    }
                }, 1);
            });

            $('#toggleColumn_uid').change(function (e) {
                datatable.columns(1).visible(e.target.checked)
            })

            $('#toggleColumn_id').change(function (e) {
                datatable.columns(2).visible(e.target.checked)
            })

            $('#toggleColumn_flavor').change(function (e) {
                datatable.columns(3).visible(e.target.checked)
            })

            $('#toggleColumn_quantity').change(function (e) {
                datatable.columns(4).visible(e.target.checked)
            })

            $('#toggleColumn_date').change(function (e) {
                datatable.columns(5).visible(e.target.checked)
            })

            $('#toggleColumn_topping').change(function (e) {
                datatable.columns(6).visible(e.target.checked)
            })

            $('#toggleColumn_addons').change(function (e) {
                datatable.columns(7).visible(e.target.checked)
            })

            $('#toggleColumn_cost').change(function (e) {
                datatable.columns(8).visible(e.target.checked)
            })

            $('#toggleColumn_status').change(function (e) {
                datatable.columns(9).visible(e.target.checked)
            })

            $('#toggleColumn_actions').change(function (e) {
                datatable.columns(10).visible(e.target.checked)
            })
        });
    </script>
</body>
</html>
