<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html class="no-js" lang="vi">

<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<meta charset="UTF-8" />
<title>PS11604 | Shop</title>
<meta content="RUNECOM03" name="description" />
<meta content="" name="keywords" />
<link rel="shortcut icon" type="image/x-icon" />

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta property="fb:app_id" content="227481454296289" />

<meta content="vi_VN" property="og:locale" />
<meta content="website" property="og:type" />
<meta content="RUNECOM03" property="og:title" />
<meta content="RUNECOM03" property="og:description" />
<meta content="http://duy2001.runtime.vn" property="og:image" />
<meta content="http://duy2001.runtime.vn/" property="og:url" />
<meta property="og:site_name" />

<link href="/views/layout/site/Scripts/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="/views/layout/site/App_Themes/Home/font-awesome.min.css"
	rel="stylesheet" />
<link href="/views/layout/site/App_Themes/Home/common.css"
	rel="stylesheet" type="text/css" />
<link href="/views/layout/site/App_Themes/Home/animate.css"
	rel="stylesheet" type="text/css" />
<link href="/views/layout/site/Scripts/jQuery-ui/jquery-ui.min.css"
	rel="stylesheet" type="text/css" />

<script src="/views/layout/site/Scripts/jQuery/jquery-2.1.4.min.js"
	type="text/javascript"></script>
<script
	src="/views/layout/site/Scripts/jQuery/jquery-migrate-1.2.1.min.js"
	type="text/javascript"></script>
<script src="/views/layout/site/Scripts/bootstrap/js/bootstrap.min.js"></script>
<script src="/views/layout/site/Scripts/jQuery-ui/jquery-ui.min.js"
	type="text/javascript"></script>

<script src="/views/layout/site/Scripts/common/fix-height.js"
	data-img-box=".image-resize" type="text/javascript"></script>
<script src="/views/layout/site/Scripts/common/common.js"
	type="text/javascript"></script>
<script src="/views/layout/site/Scripts/common/jquery.cookie.js"
	type="text/javascript"></script>
<script src="/views/layout/site/Scripts/common/mycard.js"
	type="text/javascript"></script>
<script src="/views/layout/site/Scripts/lazyLoad/jquery.lazyload.min.js"
	type="text/javascript"></script>

<script src="/views/layout/site/Scripts/angularJS/angular.min.js"></script>
<script
	src="/views/layout/site/Scripts/angularJS/angular-sanitize.min.js"></script>
<script type="text/javascript"
	src="/views/layout/site/Scripts/angular-loading-spinner/spin.min.js"></script>
<script type="text/javascript"
	src="/views/layout/site/Scripts/angular-loading-spinner/angular-spinner.min.js"></script>
<script type="text/javascript"
	src="/views/layout/site/Scripts/angular-loading-spinner/angular-loading-spinner.js"></script>
<script src="/views/layout/site/app/appMain.js"></script>
<script src="/views/layout/site/app/directives/directive.js"></script>
<script src="/views/layout/site/app/directives/angular-summernote.js"></script>
<script src="/views/layout/site/app/directives/paging.js"></script>
<script src="/views/layout/site/app/services/ajaxServices.js"></script>
<script src="/views/layout/site/app/services/alertsServices.js"></script>
<link href="http://static.runtime.vn/App_Themes/RUN003C5/style.css"
	rel="stylesheet" type="text/css" />
<link href="http://static.runtime.vn/App_Themes/RUN003/responsive.css"
	rel="stylesheet" type="text/css" />




</head>
<body ng-app="appMain" style="">
	<div id="fb-root"></div>
	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.6&appId=227481454296289";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>


	<div class="wrapper page-home">

		<tiles:insertAttribute name="header"/>

		<tiles:insertAttribute name="body"/>
		
		<tiles:insertAttribute name="footer"/>
	</div>


	<div style="display: none;" id="loading-mask">
		<div id="loading_mask_loader" class="loader">
			<img alt="Loading..." src="/Images/ajax-loader-main.gif" />
			<div>Please wait...</div>
		</div>
	</div>
	<a class="back-to-top" href="#" style="display: inline;"> <i
		class="fa fa-angle-up"> </i>
	</a>


</body>
</html>
<script type="text/javascript">
	$(".header-content").css({
		"background" : ''
	});
	$("html").addClass('');
	$(document).ready(function() {
		$("img.lazy-img").each(function() {
			//$(this).attr("data-original", $(this).attr("src"));
			//$(this).attr("src", "/Images/blank.gif");
		});
		$("img.lazy-img").lazyload({
			effect : "fadeIn",
			threshold : 200
		});
	});
</script>

