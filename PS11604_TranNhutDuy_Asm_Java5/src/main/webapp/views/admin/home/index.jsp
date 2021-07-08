<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<div id="main" role="main" class="ng-scope">
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
                <li>Tổng quan</li>
            </ol>
            <!-- end breadcrumb -->
            <!-- You can also add more buttons to the
            ribbon for further usability
    
            Example below:
    
            <span class="ribbon-button-alignment pull-right">
            <span id="search" class="btn btn-ribbon hidden-xs" data-title="search"><i class="fa-grid"></i> Change Grid</span>
            <span id="add" class="btn btn-ribbon hidden-xs" data-title="add"><i class="fa-plus"></i> Add</span>
            <span id="search" class="btn btn-ribbon" data-title="search"><i class="fa-search"></i> <span class="hidden-mobile">Search</span></span>
            </span> -->
    
        </div>
        <!-- END RIBBON -->
        <!-- MAIN CONTENT -->
        <div id="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="well">
                            <div class="text-center">
                                <h1>Chào mừng bạn đến với PS11604 Shop, <span>${user.fullname}</span></h1>
                                <img src="/views/layout/admin/App_Themes/Admin/Images/macbook.png">
                            </div>
                    </div>
                </div>
            </div>
            <!-- widget grid -->
            <!-- end widget grid -->
    
        </div>
</div>