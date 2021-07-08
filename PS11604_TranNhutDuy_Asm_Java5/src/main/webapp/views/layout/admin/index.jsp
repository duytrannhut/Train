<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html class="smart-style-1">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>PS11604 | Shop</title>
    <!-- Basic Styles -->
    <link href="/views/layout/admin/Scripts/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/views/layout/admin/App_Themes/Admin/font-awesome.min.css" rel="stylesheet" />

    <!-- SmartAdmin Styles : Caution! DO NOT change the order -->
    <link rel="stylesheet" type="text/css" media="screen" href="/views/layout/admin/App_Themes/Admin/smartadmin-production-plugins.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="/views/layout/admin/App_Themes/Admin/smartadmin-production.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="/views/layout/admin/App_Themes/Admin/smartadmin-skins.min.css">

    <!-- SmartAdmin RTL Support  -->
    

    <!-- We recommend you use "your_style.css" to override SmartAdmin
             specific styles this will also ensure you retrain your customization with each SmartAdmin update. -->
    <link rel="stylesheet" type="text/css" media="screen" href="/views/layout/admin/App_Themes/Admin/style.css">
    <!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
    

    <!-- FAVICONS -->
    <link rel="shortcut icon" href="/views/layout/admin/Areas/Admin/Images/favicon/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/views/layout/admin/Areas/Admin/Images/favicon/favicon.ico" type="image/x-icon">

    <!-- GOOGLE FONT -->
    

    <!-- Specifying a Webpage Icon for Web Clip
         Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
    <link rel="apple-touch-icon" href="/views/layout/admin/Areas/Admin/Images/splash/sptouch-icon-iphone.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/views/layout/admin/Areas/Admin/Images/splash/touch-icon-ipad.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/views/layout/admin/Areas/Admin/Images/splash/touch-icon-iphone-retina.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/views/layout/admin/Areas/Admin/Images/splash/touch-icon-ipad-retina.png">

    <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <!-- Startup image for web apps -->
    <link rel="apple-touch-startup-image" href="/views/layout/admin/Areas/Admin/Images/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
    <link rel="apple-touch-startup-image" href="/views/layout/admin/Areas/Admin/Images/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
    <link rel="apple-touch-startup-image" href="/views/layout/admin/Areas/Admin/Images/splash/iphone.png" media="screen and (max-device-width: 320px)">

    <!--Start of Zopim Live Chat Script-->
    <script type="text/javascript">
        window.$zopim || (function (d, s) {
            var z = $zopim = function (c) {
                z._.push(c)
            }, $ = z.s =
            d.createElement(s), e = d.getElementsByTagName(s)[0]; z.set = function (o) {
                z.set.
                _.push(o)
            }; z._ = []; z.set._ = []; $.async = !0; $.setAttribute('charset', 'utf-8');
            $.src = '//v2.zopim.com/?3pP8pVV1WLgGjqTb48HsSqXiEJ33t8Nx'; z.t = +new Date; $.
            type = 'text/javascript'; e.parentNode.insertBefore($, e)
        })(document, 'script');
    </script>
    <!--End of Zopim Live Chat Script-->
</head>
<body class="fixed-header fixed-navigation smart-style-1">
    
<!-- HEADER -->
	<tiles:insertAttribute name="header" />
<!-- END HEADER -->
    
<!-- Left panel : Navigation area -->
<!-- Note: This width of the aside area can be adjusted through LESS variables -->
	<tiles:insertAttribute name="menu" />
<!-- END NAVIGATION -->

    
<!-- MAIN PANEL -->
	<body>
	    <tiles:insertAttribute name="body"/>
	</body>
<!-- END MAIN PANEL -->


<!-- PAGE FOOTER -->
	<tiles:insertAttribute name="footer" />
<!-- END PAGE FOOTER -->

<script src="/views/layout/admin/Scripts/jQuery/jquery-2.1.4.min.js" type="text/javascript"></script>
<script src="/views/layout/admin/Scripts/jQuery/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="/views/layout/admin/Scripts/jQuery-UI/jquery-ui.min.js" type="text/javascript"></script>
<script src="/views/layout/admin/Scripts/bootstrap/js/bootstrap.min.js"></script>

<!-- IMPORTANT: APP CONFIG -->
<script src="/views/layout/admin/Areas/Admin/Scripts/app.config.js"></script>

<script src="/views/layout/admin/Scripts/plugin/jquery-validate/jquery.validate.min.js"></script>

<!-- JQUERY MASKED INPUT -->
<script src="/views/layout/admin/Scripts/plugin/masked-input/jquery.maskedinput.min.js"></script>

<!--[if IE 8]>

<h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>

<![endif]-->
<!-- Demo purpose only -->


<!-- MAIN APP JS FILE -->
<script src="/views/layout/admin/Areas/Admin/Scripts/app.min.js"></script>

<!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
<!-- Voice command : plugin -->
<!-- PAGE RELATED PLUGIN(S) -->
<script src="http://maps.google.com/maps/api/js?key=AIzaSyBO93-_2pxx4UBTNduADxfoWpsFrHAFKsA"></script>
    

    <script type="text/javascript">
        function heartBeat() {
            $.get("/KeepAlive.ashx", function (data) { });
        }
        $(function () {
            setInterval("heartBeat()", 1000 * 30); // 30s gửi request một lần
        });
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
        function closeBuyService() {
            $('#toast-main').hide();
        }
    </script>
</body>
</html>
