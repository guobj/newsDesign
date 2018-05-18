<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>个人中心-猎讯网</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
    <meta name="renderer" content="webkit">
    <meta name="baidu-site-verification" content="R9XA5lWxu2" />
    <meta name="author" content="猎讯网">
    <meta name="keywords" content="科技资讯,商业评论,明星公司,动态,宏观,趋势,创业,精选,有料,干货,有用,细节,内幕">
    <meta name="description" content="聚合优质的创新信息与人群，捕获精选|深度|犀利的商业科技资讯。在虎嗅，不错过互联网的每个重要时刻。">
    <link rel="stylesheet" type="text/css" href="forward/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="forward/css/build.css">
    <link href="forward/css/login.css" rel="stylesheet" type="text/css"/>
    <link href="forward/css/zzsc.css" rel="stylesheet" type="text/css"/>
    <link href="forward/css/dlzc.css" rel="stylesheet" type="text/css"/>
    <script language="javascript" type="text/javascript" src="forward/js/jquery-1.11.1.min.js"></script>
	<script language="javascript" type="text/javascript" src="forward/js/main.js"></script>
    <script language="javascript" type="text/javascript" src="forward/js/popwin.js"></script> 
    <script type="text/javascript" src="js/jquery.js"></script>
    <style type="text/css">
    	.file {
			    position: relative;
			    display: inline-block;
			    background: #D0EEFF;
			    border: 1px solid #99D3F5;
			    border-radius: 4px;
			    padding: 4px 12px;
			    overflow: hidden;
			    color: #1E88C7;
			    text-decoration: none;
			    text-indent: 0;
			    line-height: 20px;
			}
			.file input {
			    position: absolute;
			    font-size: 100px;
			    right: 0;
			    top: 0;
			    opacity: 0;
			}
			.file:hover {
			    background: #AADFFD;
			    border-color: #78C3F3;
			    color: #004974;
			    text-decoration: none;
			}
    </style>
    <script type="text/javascript">
    $(function(){
	    $("#upload").on("change","input[type='file']",function(){
	        var filePath=$(this).val();
	        if(filePath.indexOf("jpg")!=-1 || filePath.indexOf("png")!=-1){
	            $(".fileerrorTip").html("").hide();
	            var arr=filePath.split('\\');
	            var fileName=arr[arr.length-1];
	            $(".showFileName").html(fileName);
	            $("#confirmUpload").removeAttr("disabled");
	        }else{
	            $(".showFileName").html("");
	            $(".fileerrorTip").html("您未上传文件，或者您上传文件类型有误！").show();
	            return false 
	        }
	    })
    })
    </script>
</head>

<body style="background-color:#f0f4fb;">
<header id="top" role="banner" class="transition">
<!--搜索弹窗 开始-->
<div class="box">
	<div class="box2">
		<div class="icon icon-search-close js-show-search-box"><a class="close"></a></div>
   	 	<div class="search-content overlay-dialog-animate">
        	<div class="search-input">
            	<form role="search" method="get" action="ArticleSearchServlet.so" onsubmit="return checkinput()">
                	<button type="submit"></button>
                	<input placeholder="请输入关键字" name="title" id="search-input">
                </form>
        	</div>
        	<div class="search-history hide" id="history">
            	<span>我的搜索历史</span>
            	<ul class="transition" id="history_ul">
                	<li class="transition"><a href="#">数码</a></li>
                	<li class="transition"><a href="#">科技</a></li>
                	<li class="transition"><a href="#">科技</a></li>
                	<li class="transition"><a href="#">互联网</a></li>
                	<li class="transition"><a href="#">汽车之家</a></li>
           	 	</ul>
            	<div class="pull-right empty-history js-empty-history">清空历史</div>
        	</div>
        	<div class="search-history search-hot">
            	<strong>热搜词</strong>
            	<div class="dh-seach">
					<a href="#">数码</a>
                	<a href="#">科技</a>
                	<a href="#">互联网</a>
                	<a href="#">汽车之家</a>
                	<a href="#">Uber</a>
                	<a href="#">支付宝</a>
                	<a href="#">大数据</a>
                	<a href="#">创业</a>
                	<a href="#">旅游</a>
                	<a href="#">美团</a>
                	<a href="#">社交</a>
                    </ul>
                </div>
        	</div>
    	</div>
	</div>
</div>
<!--搜索弹窗 结束-->
<script>
    function checkinput(){
        var input = $("#search-input").val();
        if(input ==  null || input == ''){
            return false;
        }
        return true;
    }
</script>
  <jsp:include page="../../common/tag.jsp"></jsp:include>
<script src="forward/js/d-login.js"></script>
<div id="cd-signup"> <!-- 注册表单 -->
	<div class="modal-alert-title">极速注册</div>
    <div class="user-register-box">
		<div class="login-form sms-box">
			<label class="login-label col-xs-label transition"><input id="sms_username" class="login-input username" placeholder="手机号"></label>
			<div class="geetest_login_sms_box" >
				<div id="geetest_1496454436837" class="gt_holder gt_float" style="touch-action: none;">
					<div class="gt_slider">
						<div class="gt_guide_tip gt_show">按住左边滑块，拖动完成上方拼图</div>
						<div class="gt_slider_knob gt_show" style="left: 0px;"></div>
						<div class="gt_curtain_knob gt_hide">移动到此开始验证</div>
						<div class="gt_ajax_tip gt_ready"></div>
					</div>
				</div>
			</div>
			<label class="login-label captcha"><input id="sms_captcha" class="login-input" placeholder="输入6位验证码" maxlength="6">
			<span class="js-btn-captcha btn-captcha">获取验证码</span></label>
			<a class="js-label-select label-select-box text-center"><span class="js-country-sms">+86</span><i class="icon-modal icon-l-caret"></i></a>
			<button class="js-btn-sms-login btn-login">注&nbsp;册</button>
		</div>
		<div class="js-user-login register-text">已有账号，立即登录</div>
    </div>
</div>
</header>
<div class="placeholder-height"></div>
<div class="container per_center_body" id="per_center">
    <div class="user-info-warp">
        <div class="user-head-box">
            <div class="user-face"><img src="/upload/${map.u_img }"></div>
            <div class="user-name">${map.u_name }<a href="#" target="_blank"><i class="i-vip icon-vip" title="虎嗅黑卡会员"></i></a></div>
            <div class="user-one">${map.u_profession }</div>
                 <div class="user-one user-auth">虎嗅认证作者<i class="i-icon icon-auth3" title="虎嗅认证作者"></i></div>
                 <c:if test="${map.u_id eq sessionScope.umap.u_id }">
                 <form method="post" action="UserLogServlet.so?id=${sessionScope.umap.u_id }" enctype="multipart/form-data">
                 	<span id="upload" class="file">选择头像
                 		<input class="btn btn-messages js-login" type="file" name="file">
                 	</span>
                 	<span class="file">确认上传
                 		<input id="confirmUpload" disabled="disabled" type="submit">
                 	</span>
                 	<div class="fileerrorTip"></div>
					<div class="showFileName"></div>
                 </form>
                 </c:if>
                 <div class="admin-btn-warp"></div>
        	</div>
        	<div class="user-info-box">
            <div class="col-lg-5">
                <div class="user-info"><i class="icon icon-user-point"></i>真实姓名：${map.u_realname }</div>
                <div class="user-info"><i class="icon icon-user-point"></i>手机：${map.u_tel }</div>
                <div class="user-info"><i class="icon icon-user-point"></i>邮箱：${map.u_email }</div>
            </div>
            <div class="col-lg-7">
            	<div class="user-info"><i class="icon icon-user-point"></i>职业：${map.u_profession }</div>
                <div class="user-info"><i class="icon icon-user-point"></i>所在地址：${map.u_address }</div>
<%--                 <fmt:formatDate type="time" var="realDate" value="${map.u_create_time }" pattern="yyyy-MM-dd HH:mm:ss"/> --%>
                <div class="user-info"><i class="icon icon-user-point"></i>注册时间：<fmt:formatDate value="${map.u_create_time }" type="both"/></div>
            </div>
            <div class="btn-box"><a class="js-sea-more-info more-info pull-right">更多<span class="caret"></span></a></div>
            <div class="more-user-info-box">
                <div class="col-lg-5">
                    <div class="more-user-info"><i class="icon icon-user-point"></i>博客：${map.u_blog }</div>
                </div>
            </div>
        </div>
    </div>
    <div id="menu" name="menu"></div>
    <div class="user-menu-warp">
        <div class="menu-warp">
            <ul id=myTabs1>
				<c:if test="${map.u_id ne sessionScope.umap.u_id }">
	                <li class="active" onMouseDown=Tabs1(this,0);><a href="#menu">TA的文章</a></li>
                </c:if>
                <c:if test="${map.u_id eq sessionScope.umap.u_id }">
	                <li class="active" onMouseDown=Tabs1(this,0);><a href="#menu">我的文章</a></li>
	                <li class=""><a href="UserInfoServlet.so" target="_self">完善资料</a></li>
                </c:if>
                <!-- <li class="" onMouseDown=Tabs1(this,1);><a href="#menu">TA的评论</a></li>
                <li class="" onMouseDown=Tabs1(this,2);><a href="#menu">TA的收藏</a></li>
                <li class="" onMouseDown=Tabs1(this,3);><a href="#menu">TA的关注</a></li>
                <li class="" onMouseDown=Tabs1(this,4);><a href="#menu" >TA的项目</a></li> -->
            </ul>
        </div>
		<div class="user-content-warp" id=myTabs1_Content0>
            <div class="message-box" >
            <c:forEach var="list" items="${map.list }">
                 <div class="mod-b mod-art ">
                    <a class="transition" href="ArticleServlet.so?id=${list.n_id }&sign=${list.sign}" target="_blank">
                       <div class="mod-thumb"><img class="lazy" src="/upload/${list.img }" alt="${list.title }" style="display: inline;"></div>
                    </a>
                    <div class="mob-ctt">
                         <h3><a href="ArticleServlet.so?id=${list.n_id }&sign=${list.sign}" class="transition" target="_blank">${list.title }</a></h3>
                         <div class="mob-author"><span class="time"><fmt:formatDate value="${list.creat_time }" type="both"/></span></div>
                         <div class="mob-sub">${list.content }</div>
                    </div>
                 </div> 
             </c:forEach>         
                <!--  <nav class="page-nav">
                 	<ul class="pagination">
                    	<li class="disabled"><a href="#" aria-label="First"><span aria-hidden="true"><i class="icon icon-first"></i></span></a></li>
                        <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true"><i class="icon icon-lt"></i></span></a></li>
                        <li class="active"><a>1</a></li>
                        <li><a href="/member/1373658/article/2.html">2</a></li>
                        <li><a href="/member/1373658/article/3.html">3</a></li>
                        <li><a href="/member/1373658/article/4.html">4</a></li>
                        <li><a href="/member/1373658/article/2.html"><i class="icon icon-gt"></i></a></li>
                        <li><a href="/member/1373658/article/4.html"><i class="icon icon-last"></i></a></li>
                     </ul>
                 </nav>     -->    
            </div>
        </div>
        <div class="user-content-warp" style="display:none" id=myTabs1_Content1>
    		<ul class='nav-box' id=myTabs2>
        		<li class="active" onMouseDown=Tabs2(this,0);><a href="#">评论（115）</a></li>
        		<li class="" onMouseDown=Tabs2(this,1)><a href="#">点评（540）</a></li>
    		</ul>
            <div class="message-box" id=myTabs2_Content0>
        		<ul>
                    <li type="comment" >
                    	<div class="message-title"><a href="#" target="_blank">1直播甚至短视频的最大隐患在于，主流用户的消费习惯尚未形成，一旦受限于用户规模增长停滞，则高流失率带来的后果可想而知</a></div>
                    	<div class="message-time">1天前<span class="message-article">来自文章：<a href="#" target="_blank">资本的局，直播的病，斗鱼映客们扎堆融资背后的心思与隐忧</a></span></div>
                    </li>
                    <li type="comment" >
                    	<div class="message-title"><a href="#" target="_blank">直播甚至短视频的最大隐患在于，主流用户的消费习惯尚未形成，一旦受限于用户规模增长停滞，则高流失率带来的后果可想而知</a></div>
                    	<div class="message-time">1天前<span class="message-article">来自文章：<a href="#" target="_blank">资本的局，直播的病，斗鱼映客们扎堆融资背后的心思与隐忧</a></span></div>
                    </li>
                    <li type="comment" >
                    	<div class="message-title"><a href="#" target="_blank">直播甚至短视频的最大隐患在于，主流用户的消费习惯尚未形成，一旦受限于用户规模增长停滞，则高流失率带来的后果可想而知</a></div>
                    	<div class="message-time">1天前<span class="message-article">来自文章：<a href="#" target="_blank">资本的局，直播的病，斗鱼映客们扎堆融资背后的心思与隐忧</a></span></div>
                    </li>
                    <li type="comment" >
                    	<div class="message-title"><a href="#" target="_blank">直播甚至短视频的最大隐患在于，主流用户的消费习惯尚未形成，一旦受限于用户规模增长停滞，则高流失率带来的后果可想而知</a></div>
                    	<div class="message-time">1天前<span class="message-article">来自文章：<a href="#" target="_blank">资本的局，直播的病，斗鱼映客们扎堆融资背后的心思与隐忧</a></span></div>
                    </li>
                    <li type="comment" >
                    	<div class="message-title"><a href="#" target="_blank">直播甚至短视频的最大隐患在于，主流用户的消费习惯尚未形成，一旦受限于用户规模增长停滞，则高流失率带来的后果可想而知</a></div>
                    	<div class="message-time">1天前<span class="message-article">来自文章：<a href="#" target="_blank">资本的局，直播的病，斗鱼映客们扎堆融资背后的心思与隐忧</a></span></div>
                    </li>
                    <li type="comment" >
                    	<div class="message-title"><a href="#" target="_blank">直播甚至短视频的最大隐患在于，主流用户的消费习惯尚未形成，一旦受限于用户规模增长停滞，则高流失率带来的后果可想而知</a></div>
                    	<div class="message-time">1天前<span class="message-article">来自文章：<a href="#" target="_blank">资本的局，直播的病，斗鱼映客们扎堆融资背后的心思与隐忧</a></span></div>
                    </li>
                    <li type="comment" >
                    	<div class="message-title"><a href="#" target="_blank">直播甚至短视频的最大隐患在于，主流用户的消费习惯尚未形成，一旦受限于用户规模增长停滞，则高流失率带来的后果可想而知</a></div>
                    	<div class="message-time">1天前<span class="message-article">来自文章：<a href="#" target="_blank">资本的局，直播的病，斗鱼映客们扎堆融资背后的心思与隐忧</a></span></div>
                    </li>
                    <li type="comment" >
                    	<div class="message-title"><a href="#" target="_blank">直播甚至短视频的最大隐患在于，主流用户的消费习惯尚未形成，一旦受限于用户规模增长停滞，则高流失率带来的后果可想而知</a></div>
                    	<div class="message-time">1天前<span class="message-article">来自文章：<a href="#" target="_blank">资本的局，直播的病，斗鱼映客们扎堆融资背后的心思与隐忧</a></span></div>
                    </li>
                    <li type="comment" >
                    	<div class="message-title"><a href="#" target="_blank">直播甚至短视频的最大隐患在于，主流用户的消费习惯尚未形成，一旦受限于用户规模增长停滞，则高流失率带来的后果可想而知</a></div>
                    	<div class="message-time">1天前<span class="message-article">来自文章：<a href="#" target="_blank">资本的局，直播的病，斗鱼映客们扎堆融资背后的心思与隐忧</a></span></div>
                    </li>
                    <li type="comment" >
                    	<div class="message-title"><a href="#" target="_blank">10直播甚至短视频的最大隐患在于，主流用户的消费习惯尚未形成，一旦受限于用户规模增长停滞，则高流失率带来的后果可想而知</a></div>
                    	<div class="message-time">1天前<span class="message-article">来自文章：<a href="#" target="_blank">资本的局，直播的病，斗鱼映客们扎堆融资背后的心思与隐忧</a></span></div>
                    </li>
                </ul>
                <nav class="page-nav">
                 	<ul class="pagination">
                    	<li class="disabled"><a href="#" aria-label="First"><span aria-hidden="true"><i class="icon icon-first"></i></span></a></li>
                        <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true"><i class="icon icon-lt"></i></span></a></li>
                        <li class="active"><a>1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#"><i class="icon icon-gt"></i></a></li>
                        <li><a href="#"><i class="icon icon-last"></i></a></li>
                     </ul>
                 </nav> 
            </div>
        	<div class="message-box" style="display:none" id=myTabs2_Content1>
        		<ul>
                    <li type="recomment">
                    	<blockquote>1社交国内产品真能成大气候，月活过三亿的，我估计最终会有四个，微信、QQ、微博、……。过一亿在垂直领域有大成就的，也会有四个左右［不算过三亿］，陌陌、快手基本上会是，还有二个位置</blockquote>
                    	<div class="message-title"><span class="me-dp">TA的点评：</span><a href="#" target="_blank">微博是social media，快手是video community，严格讲不算社交产品</a></div>
                    	<div class="message-time">2017-05-29<span class="message-article">来自文章：<a href="/article/197348.html" target="_blank">冷眼看快手、陌陌们的"短视频社交"</a></span></div>
                    </li>
                    <li type="recomment">
                    	<blockquote>1社交国内产品真能成大气候，月活过三亿的，我估计最终会有四个，微信、QQ、微博、……。过一亿在垂直领域有大成就的，也会有四个左右［不算过三亿］，陌陌、快手基本上会是，还有二个位置</blockquote>
                    	<div class="message-title"><span class="me-dp">TA的点评：</span><a href="#" target="_blank">微博是social media，快手是video community，严格讲不算社交产品</a></div>
                    	<div class="message-time">2017-05-29<span class="message-article">来自文章：<a href="/article/197348.html" target="_blank">冷眼看快手、陌陌们的"短视频社交"</a></span></div>
                    </li>
                    <li type="recomment">
                    	<blockquote>1社交国内产品真能成大气候，月活过三亿的，我估计最终会有四个，微信、QQ、微博、……。过一亿在垂直领域有大成就的，也会有四个左右［不算过三亿］，陌陌、快手基本上会是，还有二个位置</blockquote>
                    	<div class="message-title"><span class="me-dp">TA的点评：</span><a href="#" target="_blank">微博是social media，快手是video community，严格讲不算社交产品</a></div>
                    	<div class="message-time">2017-05-29<span class="message-article">来自文章：<a href="/article/197348.html" target="_blank">冷眼看快手、陌陌们的"短视频社交"</a></span></div>
                    </li>
                    <li type="recomment">
                    	<blockquote>1社交国内产品真能成大气候，月活过三亿的，我估计最终会有四个，微信、QQ、微博、……。过一亿在垂直领域有大成就的，也会有四个左右［不算过三亿］，陌陌、快手基本上会是，还有二个位置</blockquote>
                    	<div class="message-title"><span class="me-dp">TA的点评：</span><a href="#" target="_blank">微博是social media，快手是video community，严格讲不算社交产品</a></div>
                    	<div class="message-time">2017-05-29<span class="message-article">来自文章：<a href="/article/197348.html" target="_blank">冷眼看快手、陌陌们的"短视频社交"</a></span></div>
                    </li>
                    <li type="recomment">
                    	<blockquote>1社交国内产品真能成大气候，月活过三亿的，我估计最终会有四个，微信、QQ、微博、……。过一亿在垂直领域有大成就的，也会有四个左右［不算过三亿］，陌陌、快手基本上会是，还有二个位置</blockquote>
                    	<div class="message-title"><span class="me-dp">TA的点评：</span><a href="#" target="_blank">微博是social media，快手是video community，严格讲不算社交产品</a></div>
                    	<div class="message-time">2017-05-29<span class="message-article">来自文章：<a href="/article/197348.html" target="_blank">冷眼看快手、陌陌们的"短视频社交"</a></span></div>
                    </li>
                    <li type="recomment">
                    	<blockquote>1社交国内产品真能成大气候，月活过三亿的，我估计最终会有四个，微信、QQ、微博、……。过一亿在垂直领域有大成就的，也会有四个左右［不算过三亿］，陌陌、快手基本上会是，还有二个位置</blockquote>
                    	<div class="message-title"><span class="me-dp">TA的点评：</span><a href="#" target="_blank">微博是social media，快手是video community，严格讲不算社交产品</a></div>
                    	<div class="message-time">2017-05-29<span class="message-article">来自文章：<a href="/article/197348.html" target="_blank">冷眼看快手、陌陌们的"短视频社交"</a></span></div>
                    </li>
                    <li type="recomment">
                    	<blockquote>1社交国内产品真能成大气候，月活过三亿的，我估计最终会有四个，微信、QQ、微博、……。过一亿在垂直领域有大成就的，也会有四个左右［不算过三亿］，陌陌、快手基本上会是，还有二个位置</blockquote>
                    	<div class="message-title"><span class="me-dp">TA的点评：</span><a href="#" target="_blank">微博是social media，快手是video community，严格讲不算社交产品</a></div>
                    	<div class="message-time">2017-05-29<span class="message-article">来自文章：<a href="/article/197348.html" target="_blank">冷眼看快手、陌陌们的"短视频社交"</a></span></div>
                    </li>
                    <li type="recomment">
                    	<blockquote>1社交国内产品真能成大气候，月活过三亿的，我估计最终会有四个，微信、QQ、微博、……。过一亿在垂直领域有大成就的，也会有四个左右［不算过三亿］，陌陌、快手基本上会是，还有二个位置</blockquote>
                    	<div class="message-title"><span class="me-dp">TA的点评：</span><a href="#" target="_blank">微博是social media，快手是video community，严格讲不算社交产品</a></div>
                    	<div class="message-time">2017-05-29<span class="message-article">来自文章：<a href="/article/197348.html" target="_blank">冷眼看快手、陌陌们的"短视频社交"</a></span></div>
                    </li>
                    <li type="recomment">
                    	<blockquote>1社交国内产品真能成大气候，月活过三亿的，我估计最终会有四个，微信、QQ、微博、……。过一亿在垂直领域有大成就的，也会有四个左右［不算过三亿］，陌陌、快手基本上会是，还有二个位置</blockquote>
                    	<div class="message-title"><span class="me-dp">TA的点评：</span><a href="#" target="_blank">微博是social media，快手是video community，严格讲不算社交产品</a></div>
                    	<div class="message-time">2017-05-29<span class="message-article">来自文章：<a href="/article/197348.html" target="_blank">冷眼看快手、陌陌们的"短视频社交"</a></span></div>
                    </li>
                    <li type="recomment">
                    	<blockquote>10社交国内产品真能成大气候，月活过三亿的，我估计最终会有四个，微信、QQ、微博、……。过一亿在垂直领域有大成就的，也会有四个左右［不算过三亿］，陌陌、快手基本上会是，还有二个位置</blockquote>
                    	<div class="message-title"><span class="me-dp">TA的点评：</span><a href="#" target="_blank">微博是social media，快手是video community，严格讲不算社交产品</a></div>
                    	<div class="message-time">2017-05-29<span class="message-article">来自文章：<a href="/article/197348.html" target="_blank">冷眼看快手、陌陌们的"短视频社交"</a></span></div>
                    </li>  
                </ul>
        		<nav class="page-nav">
                 	<ul class="pagination">
                    	<li class="disabled"><a href="#" aria-label="First"><span aria-hidden="true"><i class="icon icon-first"></i></span></a></li>
                        <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true"><i class="icon icon-lt"></i></span></a></li>
                        <li class="active"><a>1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#"><i class="icon icon-gt"></i></a></li>
                        <li><a href="#"><i class="icon icon-last"></i></a></li>
                     </ul>
                 </nav> 
            </div>
    	</div>
        <div class="user-content-warp" style="display:none" id=myTabs1_Content2>
        	 <div class="collect-box" data-cid="129416"><span class="collect-title">我的默认收藏夹</span></div>
		</div>
        <div class="user-content-warp" style="display:none" id=myTabs1_Content3>
    		<div class="topic-message-wrap">
                 <div class="no-content-prompt">TA还没有关注</div>
            </div>
		</div>
        <div class="user-content-warp" style="display:none" id=myTabs1_Content4>
        	<div class="product-html-box">
        		<div class="message-box">
            		<ul>
                        <li type="article">
                            <div class="cy-mod-thumb">
                        		<a class="transition" href="#" target="_blank"><img class="lazy" src="images/1461314509617354.png" alt="旅客"></a>
                    		</div>
                    		<div class="cy-mob-ctt">
                        		<div class="cp-name"><a href="#" class="transition" target="_blank">旅客</a></div>
                        		<div class="cp-time"> 提交时间：2016-04-22</div>
                    		</div>
                		</li>
            		</ul>
        		</div>
    		</div>
		</div>
    </div>
</div>
<footer class="footer">
    <div class="modal-backdrop fade in js-modal-backdrop"></div>
    <div class="container copy-right">
        <div class="footer-tag-list">
            <a href="#" target="_blank" class="transition">关于我们</a>
            <a href="#" target="_blank" class="transition">加入我们</a>
            <a href="#" target="_blank" class="transition">合作伙伴</a>
            <a href="#" target="_blank" class="transition">广告及服务</a>
            <a href="#" target="_blank" class="transition">常见问题解答</a>
            <a href="#" target="_blank" class="transition">防网络诈骗专题</a>
        </div>
        <span>Copyright © <a href="#">虎嗅网</a> <a href="#" target="_blank">京ICP备12013432号-1</a>
            &nbsp;<a href="#" target="_blank"><i class="i-wj"></i>京公网安备 11010102001402号</a>&nbsp;&nbsp;&nbsp;<em class="bull-right">本站由</em><i class="icon-aliyun" style="width: 70px;background-size: 100%;left: 7px;"></i><em class="bull-em">提供计算与安全服务</em>
        </span>
        <div class="footer-icon-list pull-right">
            <ul class="Qr-codee">
                <a><li class="Qr-code-footer">
                    <div class="app-qrcode"><img src="images/weixin_erweima.png"></div>
                    <i class="icon icon-footer icon-footer-wx"></i>
                </li>
                </a>
                <a><li class="Qr-code-footer">
                	<div class="app-qrcode"><img src="images/app_erweima.png"></div>
                    <i class="icon icon-footer icon-footer-ios"></i>
                </li>
                </a>
                <a><li class="Qr-code-footer">
                    <div class="app-qrcode"><img src="images/app_erweima.png"></div>
                    <i class="icon icon-footer icon-footer-android"></i>
                </li>
                </a>
                <a href="#" target="_blank" title="虎嗅英文版">
                    <li><i class="icon icon-footer icon-footer-inter"></i></li>
                </a>
                <a href="#" target="_blank" title="虎嗅RSS订阅中心">
                    <li><i class="icon icon-footer icon-footer-rss"></i></li>
                </a>
            </ul>
        </div>
    </div>
</footer>
<script language="javascript" type="text/javascript" src="forward/js/jquery-1.11.1.min.js"></script>
<script>
$(document).ready(function() {
     $(".more-user-info-box").fadeOut(0);
     $(".btn-box").click(function() {
          $(".more-user-info-box").not($(this).next()).slideUp('fast');
          $(this).next().slideToggle(400);
     });
});
</script>
<script type="text/javascript" src="forward/js/mouse.js"></script>
</body>
</html>