<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="ng-scope"><div id="main" role="main" block-ui="myBlockUI" ng-controller="productController" ng-init="initProductListController()" class="ng-scope block-ui block-ui-anim-fade" aria-busy="false">
        <!-- RIBBON -->
        <div id="ribbon">
    
            <span class="ribbon-button-alignment">
                <span id="refresh" class="btn btn-ribbon" data-action="resetWidgets" data-title="refresh" rel="tooltip" data-placement="bottom" data-original-title="
                        &lt;i class=&#39;text-warning fa fa-warning&#39;&gt;&lt;/i&gt; Warning! This will reset all your widget settings." data-html="true">
                        <i class="fa fa-refresh"></i>
                    </span>
            </span>
    
            <!-- breadcrumb -->
            <ol class="breadcrumb">
                <li>Home</li>
                <li>Thống kê</li>
                <li>Danh sách tồn kho</li>
            </ol>
            <!-- end breadcrumb -->
            <!-- You can also add more buttons to the
            ribbon for further usability
    
            Example below: -->
            <span class="ribbon-button-alignment pull-right">
                <a href="javascript:void(0)" data-target="#modalExportProduct" data-toggle="modal" class="btn btn-sm btn-primary btn-sm hidden" data-title="add"><i class="fa fa-download"></i> Xuất file dữ liệu</a>
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
                        <div class="ui-jqgrid ui-corner-all" id="gbox_jqgrid" dir="ltr">
                            <div class="ui-widget-overlay jqgrid-overlay" id="lui_jqgrid"></div>
                            <div class="loading ui-state-default ui-state-active" id="load_jqgrid" style="display: none;">Loading...</div>
                            <div class="ui-jqgrid-view" id="gview_jqgrid" >
                                <div class="ui-jqgrid-titlebar ui-corner-top ui-helper-clearfix">
                                    <a role="link" class="ui-jqgrid-titlebar-close HeaderButton" style="right: 0px;">
                                        <span class="ui-icon ui-icon-circle-triangle-n"></span>
                                    </a>
                                    <span class="ui-jqgrid-title">Danh sách tồn kho</span>
                            </div>
                            <div class="">
                                <div class="">
                                    <table class="ui-jqgrid-htable table table-bordered table-hover" role="grid" aria-labelledby="gbox_jqgrid" cellspacing="0" cellpadding="0" border="0">
                                        <thead>
                                            <tr class="ui-jqgrid-labels" role="rowheader">
                                                <th id="jqgrid_Id" role="columnheader" class="" style="width: 150px;">
                                                    <span class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                                    <div id="jqgh_jqgrid_Id" class="ui-jqgrid-sortable">Loại hàng<span class="s-ico">
                                                        <span sort="asc" class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span>
                                                        <span sort="desc" class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                                    </div>
                                                </th>
                                                <th id="jqgrid_Name" role="columnheader" class="" style="width: 150px;">
                                                    <span class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                                    <div id="jqgh_jqgrid_Name" class="ui-jqgrid-sortable">Tổng giá<span class="s-ico">
                                                        <span sort="asc" class="ui-grid-ico-sort ui-icon-asc ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span>
                                                        <span sort="desc" class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                                    </div>
                                                </th>
                                                <th id="jqgrid_Name" role="columnheader" class="" style="width: 150px;">
                                                    <span class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                                    <div id="jqgh_jqgrid_Name" class="ui-jqgrid-sortable">Số sản phẩm<span class="s-ico">
                                                        <span sort="asc" class="ui-grid-ico-sort ui-icon-asc ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span>
                                                        <span sort="desc" class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                                    </div>
                                                </th>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                            <div class="ui-jqgrid-bdiv" style="height: auto; width: auto;">
                                <div style="position:relative;"><div></div>
                                    <table id="jqgrid" tabindex="0" cellspacing="0" cellpadding="0" border="0" role="grid" aria-multiselectable="true" aria-labelledby="gbox_jqgrid" class="ui-jqgrid-btable table table-bordered table-striped">
                                        <tbody>
                                            <tr class="jqgfirstrow" role="row" style="height:auto">
                                                <td role="gridcell" style="height: 0px; width: 150px;"></td>
                                                <td role="gridcell" style="height: 0px; width: 150px;"></td>
                                                <td role="gridcell" style="height: 0px; width: 150px;"></td>
                                            </tr>
                                            <c:forEach var="item" items="${items}">
	                                            <tr role="row" id="228544" tabindex="-1" class="ui-widget-content jqgrow ui-row-ltr" aria-selected="false">
	                                                <td role="gridcell" title="" aria-describedby="jqgrid_Name">${item.group.name}</td>
	                                                <td role="gridcell" title="" aria-describedby="jqgrid_Name"><fmt:formatNumber value="${item.sum}" pattern="###,###,###"/></td>
	                                                <td role="gridcell" title="" aria-describedby="jqgrid_Name">${item.count}</td>
	                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="ui-jqgrid-resize-mark" id="rs_mjqgrid">&nbsp;</div>
                        <div id="pjqgrid" class="ui-jqgrid-pager ui-corner-bottom" dir="ltr">
                        </div>
                    </div>
                        
                    </article>
                    <!-- WIDGET END -->
                </div>
                <!-- end row -->
            </section>
            <!-- end widget grid -->
        </div>
        <!-- END MAIN CONTENT -->
        <!-- Modal -->
        <!-- /.modal -->
    <!-- <div block-ui-container="" class="block-ui-container ng-scope"><div class="block-ui-overlay"></div><div class="block-ui-message-container" aria-live="assertive" aria-atomic="true"><div class="block-ui-message ng-binding" ng-class="$_blockUiMessageClass">Loading ...</div></div></div></div> -->
</div>