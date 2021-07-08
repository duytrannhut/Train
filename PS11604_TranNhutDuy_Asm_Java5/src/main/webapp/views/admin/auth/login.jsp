<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html id="extr-page">

<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Đăng nhập</title>
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
</head>
<body class="animated fadeInDown">
    <script src="/views/layout/admin/Scripts/jQuery/jquery-2.1.4.min.js" type="text/javascript"></script>
    <script src="/views/layout/admin/Scripts/jQuery/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
    <script src="/views/layout/admin/Scripts/jQuery-UI/jquery-ui.min.js" type="text/javascript"></script>
    <script src="/views/layout/admin/Scripts/bootstrap/js/bootstrap.min.js"></script>

    <!-- IMPORTANT: APP CONFIG -->
    <script src="/views/layout/admin/Areas/Admin/Scripts/app.config.js"></script>

    <!-- JS TOUCH : include this plugin for mobile drag / drop touch events
    <script src="~/Scripts/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> -->

    <!-- JQUERY VALIDATE -->
    <script src="/views/layout/admin/Scripts/plugin/jquery-validate/jquery.validate.min.js"></script>

    <!-- JQUERY MASKED INPUT -->
    <script src="/views/layout/admin/Scripts/plugin/masked-input/jquery.maskedinput.min.js"></script>

    <!--[if IE 8]>

        <h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>

    <![endif]-->
    <!-- MAIN APP JS FILE -->
    <script src="/views/layout/admin/Areas/Admin/Scripts/app.min.js"></script>
    
<header id="header">

    <div id="logo-group">
        <span id="logo"> <img src="/views/layout/admin/Areas/Admin/Images/banner(1).png" alt="WebOnline"> </span>
    </div>

</header>
<form action="/admin/login" method="post">    <div id="main" role="main">

        <!-- MAIN CONTENT -->
        <div id="content" class="container">

            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-5 col-lg-4 col-md-offset-3 col-lg-offset-4">
                    <div class="well no-padding">
                        <div id="login-form" class="smart-form client-form">
                            <header>
                                <i class="fa fa-user"></i> 
                                Đăng nhập vào hệ thống
                            </header>

                            <fieldset>

                                <section>
                                    <label class="label">Tên tài khoản</label>
                                    <label class="input">
                                        <i class="icon-append fa fa-user"></i>
                                        <input type="email" name="username" id="txtEmail">
                                        <b class="tooltip tooltip-top-right"><i class="fa fa-user txt-color-teal"></i> Nhập tên tài khoản</b>
                                    </label>
                                </section>

                                <section>
                                    <label class="label">Mật khẩu</label>
                                    <label class="input">
                                        <i class="icon-append fa fa-lock"></i>
                                        <input type="password" name="password" id="txtPassword">
                                        <b class="tooltip tooltip-top-right"><i class="fa fa-lock txt-color-teal"></i> Nhập mật khẩu</b>
                                    </label>
                                </section>

                                <section>
                                    <label class="checkbox">
                                        <input data-val="true" data-val-required="The Ghi nhớ mật khẩu? field is required." id="Remember" name="remember" type="checkbox" value="true" /><input name="Remember" type="hidden" value="false" />
                                        <i></i>Duy trì đăng nhập
                                    </label>
                                </section>
                            </fieldset>
                            <footer>
                                <button type="button" class="btn btn-primary" id="btnLogin">
                                    <i class="fa fa-sign-in"></i>
                                    Đăng nhập
                                </button>
                            </footer>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </div>
</form><script type="text/javascript">
    $(document).ready(function () {
        $("#txtPassword").keydown(function (event) {
            if (event.keyCode == 13) {
                $("#btnLogin").click();
            }
        });
        $("#txtEmail").keydown(function (event) {
            if (event.keyCode == 13) {
                $("#btnLogin").click();
            }
        });
        $("#btnLogin").click(function () {
            var email = $("#txtEmail").val();
            var password = $("#txtPassword").val();
            if (email == '') {
                $("#txtEmail").focus();
                return;
            }
            if (password == '') {
                $("#txtPassword").focus();
                return;
            }
            $('form').submit();
        });
    });
</script>

</body>
</html>
    