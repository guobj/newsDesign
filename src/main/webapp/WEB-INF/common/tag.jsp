<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
<!-- 登录操作 -->
	$(document).ready(function() {
		$("#login-button").click(function() {
			$.ajax({
				type : "post",
				url : "LoginForwardServlet.so",
				dataType : "json",
				data : {
					"account" : $("#login_username").val(),
					"password" : $("#login_password").val()
				},
				success : function(data) {
					console.log(data)
					if (data.u_id == null || data.u_id == "") {
						$("#message").html(data)
					} else {
						window.location.reload();
					}
				}
			});
		});
	});
	
	function publishNews(){
		if("${sessionScope.umap}" == null || "${sessionScope.umap}" == ""){
			alert("请先登录！");
		}else{
			window.open("NewsPublishServlet.so");
		}
	}
	//注册
	function register() {
		var passward = $("#pwd").val();
		var repwd = $("#repwd").val();
		console.log(passward)
		if(passward == null || passward == ''){
			$("#errorPwd").html("密码为空")
		}else if(repwd == null || repwd == ''){
			$("#errorPwd").html("密码为空")
		}else if(passward != repwd){
			$("#errorPwd").html("密码不一致")
		}else{
			$.post(
				"UserRegisterServlet.so",
				{username:$("#username").val(),passward:$("#pwd").val(),u_name:$("#u_name").val()},
				function(data) {
					if(data >= 1){
						alert("注册成功！")
						window.location.href = "MainForwardServlet.so"
					}else{
						alert(data)
					}
				},
				"json"
			);
		}
	}
	$(function() {
		$("#username").change(function() {
			$.get(
				"IsUserByAccountServlet.so",
				{username:$("#username").val()},
				function(data) {
					debugger
					console.log(typeof(data))
					if(data != null && data != ""){
						$("#userExist").html(data)
						$("#register").attr("disabled",'disabled')
					}else{
						$("#register").removeAttr("disabled")
					}
				},
				"json"
				);
		}) 
	});
</script>
<div class="container">
	<div class="navbar-header transition">
		<a href="javascript:;" title="首页"><img src="forward/images/huntingnews.jpg"
			alt="猎讯网" title="首页" /></a>
	</div>
	<ul class="nav navbar-nav navbar-left" id="jsddm">
		<li class="nav-news js-show-menu"><a href="MainForwardServlet.so">资讯 </a></li>
		<style>
#jsddm ul {
	position: absolute;
	visibility: hidden;
	background: #fff;
	width: 250px;
	top: 60px;
	left: -50px;
	z-index: 9999;
	box-shadow: 0 1px 15px rgba(18, 21, 21, .2);
	padding: 10px 5px;
}

#jsddm ul li {
	float: left;
	width: 105px;
	padding-left: 20px;
	line-height: 40px;
}
</style>
		<li class="nav-news"><a href="ArticleTypeServlet.so?id=1"
			target="_blank">国际<span class="nums-prompt nums-prompt-topic"></span></a></li>
		<li class="nav-news"><a href="ArticleTypeServlet.so?id=2"
			target="_blank">政治</a></li>
		<li class="nav-news"><a href="ArticleTypeServlet.so?id=3"
			target="_blank">经济<span class="nums-prompt"></span></a></li>
		<li class="nav-news"><a href="ArticleTypeServlet.so?id=5"
			target="_blank">娱乐<em class="nums-prompt"></em></a></li>
		<li class="nav-news"><a href="ArticleTypeServlet.so?id=15"
			target="_blank">健康</a></li>
	</ul>
	<ul class="nav navbar-nav navbar-right transition  xiala main_nav">
		<li class="search-li js-show-search-box"><a><i
				class="icon icon-search "></i></a><span>搜索</span></li>
		<c:if test="${sessionScope.umap eq null }">
			<li class="login-link-box"><a class="cd-signin">登录</a></li>
		</c:if>
		<li><a class="cd-signup">注册</a></li>
	</ul>
		<a href="javascript:;" onclick="publishNews()" id="tougao">投稿</a>
</div>
<div class="cd-user-modal">
	<div class="cd-user-modal-container">
		<div id="cd-login">
			<!-- 登录表单 -->
			<div class="modal-alert-title">登录</div>
			<div class="register">
				<div class="register-top" id="reg-top">
				</div>
				<div class="register-con" id="rc">
					<div class="login-form username-box " style="margin-top: 52px;">
						<label class="login-label transition"> <input
							id="login_username" name="account" class="login-input"
							placeholder="请输入账号">
						</label> <label class="login-label"> <input id="login_password"
							name="password" class="login-input password" type="password"
							placeholder="请输入密码">
						</label> <font color="red" id="message"></font>
						<button id="login-button" class="js-btn-login btn-login">登&nbsp;录</button>
					</div>
					<!-- <div class="js-open-register register-text">极速注册</div> -->
				</div>
			</div>
		</div>
		<div id="cd-signup">
			<!-- 注册表单 -->
			<div class="modal-alert-title">极速注册</div>
			<div class="user-register-box">
				<div class="login-form sms-box">
					<label class="login-label transition"> <span
						style="display: inline;">账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：</span><input
						style="display: inline; width: 250px;" id="username"
						name="account" class="login-input" placeholder="请输入账号" />
					</label><font id="userExist" color="red"></font><label
						class="login-label transition"> <span
						style="display: inline;">用户昵称：</span><input
						style="display: inline; width: 250px;" id="u_name" name="u_name"
						type="text" class="login-input" placeholder="请输入昵称">
					</label> <label
						class="login-label transition"> <span
						style="display: inline;">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</span><input
						style="display: inline; width: 250px;" id="pwd" name="password"
						type="password" class="login-input" placeholder="请输入密码">
					</label> <label class="login-label transition"> <span
						style="display: inline;">确认密码：</span><input
						style="display: inline; width: 250px;" id="repwd"
						name="repassword" type="password" class="login-input"
						placeholder="请确认密码">
					</label><font id="errorPwd" color="red"></font>
					<button id="register" onclick="register()"
						class="js-btn-sms-login btn-login">注&nbsp;册</button>
				</div>
				<!-- <div class="js-user-login register-text">已有账号，立即登录</div> -->
			</div>
		</div>
		<a href="javascript:void(0)" class="cd-close-form ">关闭</a>
	</div>
</div>
