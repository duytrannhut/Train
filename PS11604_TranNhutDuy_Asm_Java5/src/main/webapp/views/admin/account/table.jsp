<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
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
                <li>Thành viên</li>
                <li>Danh sách thành viên</li>
            </ol>
            <!-- end breadcrumb -->
            <!-- You can also add more buttons to the
            ribbon for further usability
    
            Example below: -->
            <span class="ribbon-button-alignment pull-right">
                <a href="javascript:void(0)" data-target="#modalExportProduct" data-toggle="modal" class="btn btn-sm btn-primary btn-sm hidden" data-title="add"><i class="fa fa-download"></i> Xuất file dữ liệu</a>
                <a href="/admin/account/create" class="btn btn-sm btn-primary btn-sm" data-title="add"><i class="fa fa-plus"></i> Thêm mới</a>
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
                                    <span class="ui-jqgrid-title">Danh sách thành viên</span>
                            </div>
                            <div class="">
                                <div class="">
                                    <table class="ui-jqgrid-htable table table-bordered table-hover" role="grid" aria-labelledby="gbox_jqgrid" cellspacing="0" cellpadding="0" border="0">
                                        <thead>
                                            <tr class="ui-jqgrid-labels" role="rowheader">
                                                <th id="jqgrid_act" role="columnheader" class="" style="width: 48px;">
                                                    <span class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                                    <div id="jqgh_jqgrid_act" class="ui-jqgrid-sortable">
                                                        <span class="s-ico" style="display:none">
                                                            <span sort="asc" class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span>
                                                            <span sort="desc" class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span>
                                                        </span>
                                                    </div>
                                                </th>
                                                <th id="jqgrid_Name" role="columnheader" class="" style="width: 102px;">
                                                    <span class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                                    <div id="jqgh_jqgrid_Name" class="ui-jqgrid-sortable">Họ và tên<span class="s-ico">
                                                        <span sort="asc" class="ui-grid-ico-sort ui-icon-asc ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span>
                                                        <span sort="desc" class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                                    </div>
                                                </th>
                                                <th id="jqgrid_ProductGroupName" role="columnheader" class="" style="width: 102px;">
                                                    <span class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                                    <div id="jqgh_jqgrid_ProductGroupName" class="ui-jqgrid-sortable">Tên tài khoản<span class="s-ico" style="display:none">
                                                        <span sort="asc" class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span>
                                                        <span sort="desc" class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                                    </div>
                                                </th>
                                                <th id="jqgrid_Image" role="columnheader" class="" style="width: 102px;">
                                                    <span class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                                    <div id="jqgh_jqgrid_Image" class="ui-jqgrid-sortable">Hình ảnh<span class="s-ico" style="display:none">
                                                        <span sort="asc" class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span>
                                                        <span sort="desc" class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                                    </div>
                                                </th>
                                                <th id="jqgrid_Price" role="columnheader" class="" style="width: 102px;">
                                                    <span class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                                    <div id="jqgh_jqgrid_Price" class="ui-jqgrid-sortable">Email<span class="s-ico" style="display:none">
                                                        <span sort="asc" class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span>
                                                        <span sort="desc" class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                                    </div>
                                                </th>
                                                <th id="jqgrid_Inactive" role="columnheader" class="" style="width: 68px;">
                                                    <span class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                                    <div id="jqgh_jqgrid_Inactive" class="ui-jqgrid-sortable">Trạng thái<span class="s-ico" style="display:none">
                                                        <span sort="asc" class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span>
                                                        <span sort="desc" class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                                    </div>
                                                </th>
                                                 <th id="jqgrid_Inactive" role="columnheader" class="" style="width: 68px;">
                                                    <span class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                                    <div id="jqgh_jqgrid_Inactive" class="ui-jqgrid-sortable">Quyền truy cập<span class="s-ico" style="display:none">
                                                        <span sort="asc" class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span>
                                                        <span sort="desc" class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                                    </div>
                                                </th>
                                            </tr>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                            <div class="ui-jqgrid-bdiv" style="height: auto; width: auto;">
                                <div style="position:relative;"><div></div>
                                    <table id="jqgrid" tabindex="0" cellspacing="0" cellpadding="0" border="0" role="grid" aria-multiselectable="true" aria-labelledby="gbox_jqgrid" class="ui-jqgrid-btable table table-bordered table-striped">
                                        <tbody>
                                            <tr class="jqgfirstrow" role="row" style="height:auto">
                                                <td role="gridcell" style="height: 0px; width: 48px;"></td>
                                                <td role="gridcell" style="height: 0px; width: 102px;"></td>
                                                <td role="gridcell" style="height: 0px; width: 102px;"></td>
                                                <td role="gridcell" style="height: 0px; width: 102px;"></td>
                                                <td role="gridcell" style="height: 0px; width: 102px;"></td>
                                                <td role="gridcell" style="height: 0px; width: 68px;"></td>
                                                <td role="gridcell" style="height: 0px; width: 68px;"></td>
                                            </tr>
                                            <c:forEach items="${page.content}" var="user">
	                                            <tr role="row" id="228544" tabindex="-1" class="ui-widget-content jqgrow ui-row-ltr" aria-selected="false">
	                                                <td role="gridcell" style="text-align:center;" title="" aria-describedby="jqgrid_act"><a href="/admin/account/edit/${user.username}" class="btn btn-xs btn-default" data-original-title="Edit Row"><i class="fa fa-pencil"></i></a><a href="/admin/account/delete/${user.username}" class="btn btn-xs btn-default" data-original-title="Save Row"><i class="fa fa-close"></i></a></td>
	                                                <td role="gridcell" title="" aria-describedby="jqgrid_Name">${user.fullname}</td>
	                                                <td role="gridcell" title="" aria-describedby="jqgrid_ProductGroupName">${user.username}</td>
	                                                <td role="gridcell" style="text-align:center;" title="" aria-describedby="jqgrid_Image"><img class="img-jqgrid-thumbnail" src="${user.photo}"></td>
	                                                <td role="gridcell" style="text-align:left;" title="" aria-describedby="jqgrid_Price">${user.email}</td>
	                                                <td role="gridcell" style="text-align:center;" title="" aria-describedby="jqgrid_Inactive">${user.activated==true?'Đã kích hoạt':'Chưa kích hoạt'}</td>
	                                                <td role="gridcell" style="text-align:center;" title="" aria-describedby="jqgrid_Inactive">${user.admin==true?'Admin':'User'}</td>
	                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="ui-jqgrid-resize-mark" id="rs_mjqgrid">&nbsp;</div>
                        <div id="pjqgrid" class="ui-jqgrid-pager ui-corner-bottom" dir="ltr">
                            <div id="pg_pjqgrid" class="ui-pager-control" role="group">
                                <table cellspacing="0" cellpadding="0" border="0" class="ui-pg-table" style="width:100%;table-layout:fixed;height:100%;" role="row">
                                    <tbody>
                                        <tr>
                                            <td id="pjqgrid_left" align="left">
                                                <table cellspacing="0" cellpadding="0" border="0" class="ui-pg-table navtable" style="float:left;table-layout:auto;">
                                                    <tbody>
                                                        <tr>
                                                            <td class="ui-pg-button ui-corner-all" title="" id="refresh_jqgrid" data-original-title="Reload Grid">
                                                                <a href="/admin/account" class="btn btn-sm btn-primary">
                                                                    <span class="fa fa-refresh"></span>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                            <td id="pjqgrid_center" align="center" style="white-space: pre; width: 292px;"><table cellspacing="0" cellpadding="0" border="0" style="table-layout:auto;" class="ui-pg-table"><tbody><tr><td id="first_pjqgrid" class="ui-pg-button ui-corner-all ${p==0?'ui-state-disabled':''}"><a class="btn btn-sm btn-default ${p==0?'disabled':''}" href="/admin/account?p=0"><span class="fa fa-fast-backward"></span></a></td><td id="prev_pjqgrid" class="ui-pg-button ui-corner-all ${p==0?'ui-state-disabled':''}"><a class="btn btn-sm btn-default ${p==0?'disabled':''}" href="/admin/account?p=${page.number-1}"><span class="fa fa-backward"></span></a></td><td class="ui-pg-button ui-state-disabled" style="width:4px;"><span class="ui-separator"></span></td><td dir="ltr">Page <input class="ui-pg-input" type="text" size="2" maxlength="7" value="${page.number+1}" role="textbox"> of <span id="sp_1_pjqgrid">${page.totalPages}</span></td><td class="ui-pg-button ui-state-disabled" style="width:4px;"><span class="ui-separator"></span></td><td id="next_pjqgrid" class="ui-pg-button ui-corner-all ${p==page.totalPages-1?'ui-state-disabled':''}" style="cursor: default;"><a class="btn btn-sm btn-default ${p==page.totalPages-1?'disabled':''}" href="/admin/account?p=${page.number+1}"><span class="fa fa-forward"></span></a></td><td id="last_pjqgrid" class="ui-pg-button ui-corner-all ${p==page.totalPages-1?'ui-state-disabled':''}"><a class="btn btn-sm btn-default ${p==page.totalPages-1?'disabled':''}" href="/admin/account?p=${page.totalPages-1}"><span class="fa fa-fast-forward"></span></a></td></tr></tbody></table></td><td id="pjqgrid_right" align="right"><div dir="ltr" style="text-align:right" class="ui-paging-info">View ${page.numberOfElements} of ${page.totalElements}</div></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
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
    