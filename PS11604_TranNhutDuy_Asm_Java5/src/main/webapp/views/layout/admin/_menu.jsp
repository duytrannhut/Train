<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<aside id="left-panel">

    <!-- User info -->
    <div class="login-info hidden">
        <span>
            <!-- User image size is adjusted inside CSS, it should stay as it -->

            <a href="/" target="_blank">
                
                <i class="fa fa-fw fa-desktop"></i>
                <span>
                    Xem website
                </span>
                <i class="fa fa-external-link "></i>
            </a>

        </span>
    </div>
    <!-- end user info -->
    <!-- NAVIGATION : This navigation is also responsive-->
    <nav>
        <ul>
                    <li>
                        <a href="/admin/home" title="Tổng quan"><i class="fa fa-fw fa-dashboard"></i> <span class="menu-item-parent">Tổng quan</span></a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-fw fa-bar-chart-o"></i> <span class="menu-item-parent">Sản phẩm</span></a>
                        <ul>
                            <li>
                                <a href="/admin/product">Sản phẩm</a>
                            </li>
                            <li>
                                <a href="/admin/category">Danh mục</a>
                            </li>
                    </ul>
                    </li>
                    <li>
                        <a href="/admin/order"><i class="fa fa-fw fa-pencil-square-o"></i> <span class="menu-item-parent">Đơn h&#224;ng</span></a>
                    </li>
                    <li>
                        <a href="/admin/account"><i class="fa fa-fw fa-windows"></i> <span class="menu-item-parent">Kh&#225;ch h&#224;ng</span></a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-fw fa-calendar"></i> <span class="menu-item-parent">Thống kê</span></a>
                        <ul>
                                <li>
                                    <a href="/admin/report-ton-kho">Sản phẩm tồn kho</a>
                                </li>
                                <li>
                                    <a href="/admin/report-doanh-thu">Doanh thu</a>
                                </li>
                        </ul>
                    </li>
        </ul>
    </nav>
    <span class="minifyme" data-action="minifyMenu">
        <i class="fa fa-arrow-circle-left hit"></i>
    </span>

</aside>