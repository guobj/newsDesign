<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
<link rel="stylesheet" href="assets/css/ace.min.css" />
<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
<link rel="stylesheet" href="css/style.css" />
<!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
<script src="assets/js/ace-extra.min.js"></script>
<!--[if lt IE 9]>
		<script src="assets/js/html5shiv.js"></script>
		<script src="assets/js/respond.min.js"></script>
		<![endif]-->
<script src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script src="assets/layer/layer.js" type="text/javascript"></script>
<title>登陆</title>
</head>

<body class="login-layout Reg_log_style">
	<div class="logintop">
		<span>欢迎后台管理界面平台</span>
		<ul>
			<li><a href="http://www.erdangjiade.com">返回首页</a></li>
			<li><a href="http://www.erdangjiade.com">帮助</a></li>
			<li><a href="http://www.erdangjiade.com">关于</a></li>
		</ul>
	</div>
	<div class="loginbody">
		<div class="login-container">
			<div class="center">
				<img src="" />
			</div>

			<div class="space-6"></div>

			<div class="position-relative">
				<div id="login-box" class="login-box widget-box no-border visible">
					<div class="widget-body">
						<div class="widget-main">
							<h4 class="header blue lighter bigger">
								<i class="icon-coffee green"></i> 管理员登陆
							</h4>

							<div class="login_icon">
								<img src="images/login.png" />
							</div>

							<form class="">
								<fieldset>
									<ul>
										<li class="frame_style form_error"><label
											class="user_icon"></label><input name="用户名" type="text"
											id="account" /><i>用户名</i></li>
										<li class="frame_style form_error"><label
											class="password_icon"></label><input name="密码"
											type="password" id="password" /><i>密码</i></li>
										
									</ul>
										<div id="message">${message }</div>
									<div class="space"></div>

									<div class="clearfix">
										<label class="inline"> </label>
										<button type="button"
											class="width-35 pull-right btn btn-sm btn-primary"
											id="login_btn">
											<i class="icon-key"></i> 登陆
										</button>
									</div>
									<div class="space-4"></div>
								</fieldset>
							</form>
								${message }
							<div class="social-or-login center">
								<span class="bigger-110">通知</span>
							</div>

							<div class="social-login center">本网站系统不再对IE8以下浏览器支持，请见谅。</div>
						</div>
						<!-- /widget-main -->

						<div class="toolbar clearfix"></div>
					</div>
					<!-- /widget-body -->
				</div>
				<!-- /login-box -->
			</div>
			<!-- /position-relative -->
		</div>
	</div>
	<!--  <div class="loginbm">版权所有  2016  <a href="http://www.erdangjiade.com">二当家的软件源码分享</a> </div><strong></strong>-->
</body>
</html>
<script type="text/javascript">
	$('#login_btn').on('click', function() {
		var num = 0;
		var str = "";
		$("input[type$='text'],input[type$='password']").each(function(n) {
			if ($(this).val() == "") {

				layer.alert(str += "" + $(this).attr("name") + "不能为空！\r\n", {
					title : '提示框',
					icon : 0,
				});
				num++;
				return false;
			}
		});
		if (num > 0) {
			return false;
		} else {
			console.log(2)
			$.ajax({
				type : "post",
				url : "LoginDoServlet.do",
				dataType :"json",
				data : {
					"account" : $("#account").val(),
					"password" : $("#password").val()
				},
			success:function (data) {
				$("#message").html(data).css("color",'red')
				console.log(data)
				if(data == null){
					window.location.href="MainServlet.do";
				}
				 
			},
			error:function(){
			  window.location.href="MainServlet.do";
			}
			})
		}

	});
	$(document).ready(
			function() {
				$("input[type='text'],input[type='password']").blur(
						function() {
							var $el = $(this);
							var $parent = $el.parent();
							$parent.attr('class', 'frame_style').removeClass(
									' form_error');
							if ($el.val() == '') {
								$parent.attr('class', 'frame_style').addClass(
										' form_error');
							}
						});
				$("input[type='text'],input[type='password']").focus(
						function() {
							var $el = $(this);
							var $parent = $el.parent();
							$parent.attr('class', 'frame_style').removeClass(
									' form_errors');
							if ($el.val() == '') {
								$parent.attr('class', 'frame_style').addClass(
										' form_errors');
							} else {
								$parent.attr('class', 'frame_style')
										.removeClass(' form_errors');
							}
						});
			})
</script>