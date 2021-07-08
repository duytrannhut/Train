<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div id="main" role="main" block-ui="myBlockUI" ng-controller="orderController" ng-init="initializeController()" class="ng-scope block-ui block-ui-anim-fade" aria-busy="false">
    <!-- RIBBON -->
    <div id="ribbon">

        <span class="ribbon-button-alignment">
            <span id="refresh" class="btn btn-ribbon" data-action="resetWidgets" data-title="refresh" rel="tooltip" data-placement="bottom" data-original-title="
                <i class='text-warning fa fa-warning'></i> Warning! This will reset all your widget settings." data-html="true">
                <i class="fa fa-refresh"></i>
            </span>
        </span>

        <!-- breadcrumb -->
        <ol class="breadcrumb">
            <li>Home</li>
            <li>Đơn hàng</li>
            <li class="ng-binding">#${order.id}</li>
        </ol>
        <!-- end breadcrumb -->
        <!-- You can also add more buttons to the
                ribbon for further usability
                Example below:
        -->
        <span class="ribbon-button-alignment pull-right">
            <a href="/admin/order" class="btn btn-default btn-sm">Trở về</a>
        </span>
    </div>
    <!-- END RIBBON -->
    <!-- MAIN CONTENT -->
    <div id="content">
        <!-- widget grid -->
        <section id="widget-grid" class="">

            <!-- row -->
            <div class="row">

                <!-- NEW WIDGET START -->
                <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                    <!-- Widget ID (each widget will need unique ID)-->
                    <div class="jarviswidget well jarviswidget-color-darken" id="wid-id-0" data-widget-sortable="false" data-widget-deletebutton="false" data-widget-editbutton="false" data-widget-colorbutton="false">
                        <!-- widget options:
                        usage: <div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false">

                        data-widget-colorbutton="false"
                        data-widget-editbutton="false"
                        data-widget-togglebutton="false"
                        data-widget-deletebutton="false"
                        data-widget-fullscreenbutton="false"
                        data-widget-custombutton="false"
                        data-widget-collapsed="true"
                        data-widget-sortable="false"

                        -->
                        <header>
                            <span class="widget-icon"> <i class="fa fa-barcode"></i> </span>
                            <h2>Item #44761 </h2>
                        </header>

                        <!-- widget div-->
                        <div>

                            <!-- widget edit box -->
                            <div class="jarviswidget-editbox">
                                <!-- This area used as dropdown edit box -->

                            </div>
                            <!-- end widget edit box -->
                            <!-- widget content -->
                            <div class="widget-body no-padding">

                                <div class="widget-body-toolbar">

                                    <div class="row">

                                        <div class="col-sm-8">
                                            <!-- ngIf: TransportId<=0 --><div class="btn-group ng-scope">
                                                <a href="/admin/order/detail/deliveried/${order.id}" class="btn btn-sm ${order.deliveried?'disabled btn-default':'btn-primary'}"> <i class="fa fa-edit"></i> ${order.deliveried?'Đang giao hàng':'Giao hàng'} </a>
                                            </div><!-- end ngIf: TransportId<=0 -->
                                            <!-- ngIf: TransportId>0 -->
                                            <!-- ngIf: PaymentStateId==1 --><div class="btn-group ng-scope">
                                                <a href="javascript:void(0)" class="btn btn-sm  ${order.checkout?'disabled btn-default':'btn-success'}" data-toggle="modal" data-target="#modalPayment"> <i class="fa fa-plus"></i> ${order.checkout?'Đã nhận thanh toán':'Xác nhận đã thanh toán'} </a>
                                            </div><!-- end ngIf: PaymentStateId==1 -->
                                            <!-- ngIf: PaymentStateId==2 -->
                                            <div class="btn-group hidden">
                                                <a href="javascript:void(0)" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#modalRefund"> <i class="fa fa-share-square"></i> Hoàn trả </a>
                                            </div>
                                        </div>
                                        <div class="col-sm-4 text-align-right">
                                            <!-- ngIf: IsConfirm==false -->
                                        </div>
                                    </div>

                                </div>

                                <div class="padding-10">
                                    <br>
                                    <div class="pull-left">
                                        <img src="/views/layout/site/Uploads/shop90/images/banner(1).png" width="150" height="32" alt="">
                                        <br>
                                        <h4 class="semi-bold">
                                            Thông tin khách hàng
                                        </h4>
                                        <address class="ng-binding">
                                            <strong class="ng-binding">${order.account.fullname}</strong>
                                            <span class="pull-right">
                                                <i class="fa fa-pencil cursor-pointer" data-toggle="modal" data-target="#modalCustomer"></i>
                                            </span>
                                            <br>
                                            ${order.account.fullname}
                                            <br>
                                            ${order.address}
                                            <br>
                                            ${order.account.email}
                                            <br>
                                            <abbr title="Phone">Phone:</abbr> 
                                            <br>
                                        </address>
                                    </div>
                                    <div class="pull-right">
                                        <h1 class="font-400">Đơn hàng</h1>
                                    </div>
                                    <div class="clearfix"></div>
                                    <br>
                                    <div class="row">
                                        <div class="col-sm-8">
                                            <h4 class="semi-bold">Thông tin giao hàng <i class="fa fa-pencil cursor-pointer" data-toggle="modal" data-target="#modalDelivery"></i></h4>
                                            <address class="ng-binding">
                                                <strong class="ng-binding">${order.account.fullname}</strong>
                                                <br>
                                                ${order.account.fullname}
                                                <br>
                                                ${order.address}
                                                <br>
                                                ${order.account.email}
                                                <br>
                                                <abbr title="Phone">Phone:</abbr> 
                                                <br>
                                            </address>
                                        </div>
                                        <div class="col-sm-4">
                                            <div>
                                                <div>
                                                    <strong>Mã đơn hàng :</strong>
                                                    <span class="pull-right ng-binding"> #${order.id} </span>
                                                </div>

                                            </div>
                                            <div>
                                                <div class="font-md">
                                                    <strong>Ngày tạo :</strong>
                                                    <span class="pull-right ng-binding"> <i class="fa fa-calendar"></i> ${order.createDate} </span>
                                                </div>

                                            </div>
                                            <br>
                                            <div class="well well-sm  bg-color-darken txt-color-white no-border">
                                                <div class="fa-lg">
                                                    Thanh toán :
                                                    <c:set var="total" value="${0}" />
													<c:forEach var="item" items="${items}">
														<c:set var="total"
															value="${total+(item.price*item.quantity)}" />
													</c:forEach>
                                                    <span class="pull-right ng-binding"> <fmt:formatNumber value="${total}" pattern="###,###,###"/>đ </span>
                                                </div>

                                            </div>
                                            <br>
                                            <br>
                                        </div>
                                    </div>
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>Sản phẩm</th>
                                                <th>Hình ảnh</th>
                                                <th class="text-center">Số lượng</th>
                                                <th>Đơn giá</th>
                                                <th>Thành tiền</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="item" items="${items}">
                                            <tr class="ng-scope">
                                                <td>
                                                    <a href="/product/detail/${item.product.id}" target="_blank" class="ng-binding">${item.product.name}</a>
                                                    <!-- ngIf: item.IsVariant==true -->
                                                    <p class="note">SKU : <span class="ng-binding"></span></p>
                                                </td>
                                                <td><img class="img-responsive" style="height:40px;" src="${item.product.image}"></td>
                                                <td class="text-center"><strong class="ng-binding">${item.quantity}</strong></td>
                                                <td class="ng-binding"><fmt:formatNumber value="${item.price}" pattern="###,###,###"/>đ</td>
                                                <td class="text-right ng-binding"><fmt:formatNumber value="${item.price*item.quantity}" pattern="###,###,###"/>đ</td>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                        <tbody class="order-totals-summary">
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td class="text-right">
                                                    Tổng giá trị sản phẩm:
                                                </td>
                                                <td class="text-right">
                                                    <span class="ng-binding"><fmt:formatNumber value="${total}" pattern="###,###,###"/> ₫</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-right" colspan="4">
                                                    Số tiền phải thanh toán:
                                                </td>
                                                <td class="text-right">
                                                    <span class="ng-binding"><fmt:formatNumber value="${total}" pattern="###,###,###"/></span>
                                                    <span>₫</span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="invoice-footer">

                                        <div class="row">

                                            <div class="col-sm-7">
                                                <div class="payment-methods">
                                                    <h5>Phương thức thanh toán</h5>
                                                    <h3><strong><span class="text-success ng-binding"></span></strong></h3>
                                                </div>
                                            </div>
                                            <div class="col-sm-5">
                                                <div class="invoice-sum-total pull-right">
                                                    <h3><strong>Thanh toán: <span class="text-success ng-binding"><fmt:formatNumber value="${total}" pattern="###,###,###"/> ₫</span></strong></h3>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="row">
                                            <div class="col-sm-12">
                                                <p class="note ng-binding"></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!-- end widget content -->

                        </div>
                        <!-- end widget div -->

                    </div>
                    <!-- end widget -->

                </article>
                <!-- WIDGET END -->

            </div>

            <!-- end row -->

        </section>
        <!-- end widget grid -->

    </div>
    <!-- END MAIN CONTENT -->
    <!-- Modal -->
    <div class="modal fade" id="modalCustomer" tabindex="-1" role="dialog" aria-labelledby="modalCustomerLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <h4 class="modal-title" id="modalCustomerLabel">Cập nhật thông tin khách hàng</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="CustomerName"> Tên khách hàng</label>
                                <input type="text" class="form-control ng-pristine ng-untouched ng-valid" ng-model="CustomerName">
                            </div>
                            <div class="form-group">
                                <label for="CustomerAddress"> Địa chỉ</label>
                                <input type="text" class="form-control ng-pristine ng-untouched ng-valid" ng-model="CustomerAddress">
                            </div>
                            <div class="form-group">
                                <label for="CustomerPhone"> Điện thoại</label>
                                <input type="text" class="form-control ng-pristine ng-untouched ng-valid" ng-model="CustomerPhone">
                            </div>
                            <div class="form-group">
                                <label for="CustomerEmail"> Email</label>
                                <input type="text" class="form-control ng-pristine ng-untouched ng-valid" ng-model="CustomerEmail">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        Hủy
                    </button>
                    <button type="button" class="btn btn-primary" ng-click="updateCustomer()">
                        Lưu
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
    <div class="modal fade" id="modalPayment" tabindex="-1" role="dialog" aria-labelledby="modalPaymentLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <h4 class="modal-title" id="modalPaymentLabel">Xác nhận đơn hàng đã thanh toán</h4>
                </div>
                <div class="modal-body">
                    <span>Bạn có chắc chắn muốn xác nhận đơn hàng đã nhận thanh toán từ ngoài hệ thống ?</span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        Hủy
                    </button>
                    <a type="button" class="btn btn-primary " href="/admin/order/detail/checkout/${order.id}">
                        Đồng ý
                    </a>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
    <div class="modal fade" id="modalShipping" tabindex="-1" role="dialog" aria-labelledby="modalShippingLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" style="max-width:800px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <h4 class="modal-title" id="modalShippingLabel">Hoàn thành sản phẩm</h4>
                </div>
                <div class="modal-footer">
                    <div class="pull-left hidden">
                        <label class="text-no-bold">
                            <input type="checkbox" ng-model="IsSendEmail" ng-init="IsSendEmail=true" class="ng-pristine ng-untouched ng-valid">
                            <span class="pre-line">  Gửi <a class="text-underline" href="/admin#/config/notifications">email thông báo</a> đến khách hàng</span>
                        </label>
                    </div>
                    <span class="clear-mobile"></span>
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        Hủy
                    </button>
                    <button type="button" class="btn btn-primary" ng-click="createShippingOrder()">
                        Cập nhật
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
    <div class="printer-preview-content hidden" id="printer-preview-content">
        <div class="show-print">
            <meta charset="UTF-8">
            <div style="width:100%; float:left; margin:0px 0px;font-family: Helvetica; line-height: 30px; font-size:12px">
                <p style="float: right; text-align: right; padding-right:20px; line-height: 140%" class="ng-binding">
                    Ngày đặt hàng: 9/6/2021<br>
                    <img val="#100000003" class="print_barcode order" style="margin-right:-10px">
                </p>
                <script>
                    function PrintBarcode(barcode) {
                        $('.print_barcode').JsBarcode(barcode, {
                            width: 1,
                            height: 40,
                            quite: 10,
                            format: "CODE128",
                            displayValue: true,
                            font: "monospace",
                            textAlign: "center",
                            fontSize: 12,
                            backgroundColor: "",
                            lineColor: "#000"
                        });
                    }
                </script>
                <div style="margin:0 0 1.5em 0;">
                    <strong style="font-size: 18px;">PS11604 Shop</strong>
                    <br>
                    <strong>Địa chỉ:</strong> PS11604 Shop
                    <br>
                    <strong>Điện thoại:</strong> 0123456789
                    <br>
                    <strong>Website:</strong> http://www.runtime.vn
                    <br>
                    <strong>Email:</strong> duytrannhut.xy@gmail.com
                </div>
                <div style="clear:both"></div>
            </div>
        </div>
    </div>
</div>