<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE html>
<html>
<head>
		<base href="${basePath }">
		<meta charset="utf-8">
		<link href="forward/css/style.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<!--webfonts-->
		<!--//webfonts-->
		<style type="text/css">
			.test{
			  padding:10px 19px;
			  border-radius:0.3em;
			 -webkit-border-radius:0.3em;
			  -moz-border-radius:0.3em;
			  -o-border-radius:0.3em;
			   color:#4D4949;
			  background:#F3F3F3;
			  border:1px solid #EBEBEB;
			  font-weight:bold;
			  font-size:15px;
			  outline:none;
			  transition: all 0.5s ease-out;
			  -webkit-transition: all 0.5s ease-out;
			  -moz-transition: all 0.5s ease-out;
			  -ms-transition: all 0.5s ease-out;
			  -o-transition: all 0.5s ease-out;
			  margin-top:15px;
			  cursor: pointer;
			  margin-left: 570px;
			}
		</style>
</head>
<body>
	<div class="main">
		<div class="header" >
			<h1>个人信息完善</h1>
		</div>
		<p></p>
			<form method="post" action="UserUpdateServlet.so">
			<input type="hidden" name="id" value="${sessionScope.umap.u_id }"/>
				<ul style="margin-left: 100px" class="left-form">
					<h2>邮箱：</h2>
					<li>
						<input type="text"   placeholder="Email" name="u_email" required/>
						<span class="icon ticker"> </span>
						<div class="clear"> </div>
					</li> 
					<h2>电话：</h2>
					<li>
						<input type="text"   placeholder="TEL" name="u_tel" required/>
						<span class="icon ticker"> </span>
						<div class="clear"> </div>
					</li> 
					<h2>地址：</h2>
					<li>
						<input type="text"   placeholder="Address" name="u_address" required/>
						<span class="icon ticker"> </span>
						<div class="clear"> </div>
					</li> 
						<div class="clear"> </div>
				</ul>
				<ul class="left-form">
					<h2>真实姓名：</h2>
					<li>
						<input type="text"   placeholder="RealName" name="u_realname" required/>
						<span class="icon ticker"> </span>
						<div class="clear"> </div>
					</li> 
					<h2>职业：</h2>
					<li>
						<input type="text"   placeholder="Profession" name="u_profession" required/>
						<span class="icon ticker"> </span>
						<div class="clear"> </div>
					</li> 
					<h2>博客：</h2>
					<li>
						<input type="text"   placeholder="Blog" name="u_blog" required/>
						<span class="icon ticker"> </span>
						<div class="clear"> </div>
					</li> 
						<div class="clear"> </div>
				</ul>
				<div class="clear"> </div>
					<input class="test" type="submit" value="保存">
			</form>
			
		</div>

	
</body>
</html>