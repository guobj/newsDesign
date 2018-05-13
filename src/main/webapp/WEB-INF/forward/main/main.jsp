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
<head lang="en">
	<base href="${basePath }">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>个人中心-虎嗅网</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
    <meta name="renderer" content="webkit">
    <meta name="baidu-site-verification" content="R9XA5lWxu2" />
    <meta name="author" content="虎嗅网">
    <meta name="keywords" content="科技资讯,商业评论,明星公司,动态,宏观,趋势,创业,精选,有料,干货,有用,细节,内幕">
    <meta name="description" content="聚合优质的创新信息与人群，捕获精选|深度|犀利的商业科技资讯。在虎嗅，不错过互联网的每个重要时刻。">
    <link rel="stylesheet" type="text/css" href="forward/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="forward/css/build.css">
    <link rel="stylesheet" type="text/css" href="forward/css/activity.css">
    <link href="forward/css/login.css" rel="stylesheet" type="text/css"/>
    <link href="forward/css/zzsc.css" rel="stylesheet" type="text/css"/>
    <link href="forward/css/dlzc.css" rel="stylesheet" type="text/css"/>
    <script language="javascript" type="text/javascript" src="forward/js/jquery-1.11.1.min.js"></script>
	<script language="javascript" type="text/javascript" src="forward/js/main.js"></script>
    <script language="javascript" type="text/javascript" src="forward/js/popwin.js"></script> 
    <link rel="stylesheet" type="text/css" href="forward/css/nanoscroller.css">
    <script type="text/javascript" src="js/jquery.js"></script>
    
</head>
<style>
	.test {
		font-size:14px;
		color:#999;
		line-height:24px;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space:nowrap;
	}
</style>
<script type="text/javascript">
	$(function() {
		var x = 1;
		$.ajax({
			type : "post",
			url : "ArticleListServlet.so",
			dataType : "json",
			success : function(data) {
				console.log(data)
				
				for (var list in data.list){
					if(x == 1){
						$("#firsta").attr({"href":'ArticleServlet.so?id='+data.list[list].n_id+'&sign='+data.list[list].sign,"title":data.list[list].title})
						$("#firstimg").attr({"src":'/upload/'+data.list[list].img,"alt":data.list[list].title})
						$("#firsth").html(data.list[list].title)
					}
					if(x == 2){
						$("#seconda").attr({"href":'ArticleServlet.so?id='+data.list[list].n_id+'&sign='+data.list[list].sign,"title":data.list[list].title})
						$("#secondimg").attr({"src":'/upload/'+data.list[list].img,"alt":data.list[list].title})
						$("#secondh").html(data.list[list].title)
					}
					if(x == 3){
						$("#thirda").attr({"href":'ArticleServlet.so?id='+data.list[list].n_id+'&sign='+data.list[list].sign,"title":data.list[list].title})
						$("#thirdimg").attr({"src":'/upload/'+data.list[list].img,"alt":data.list[list].title})
						$("#thirdh").html(data.list[list].title)
					}
					x = x+1;
				}
					
			},
			error : function() {
				window.location.href = "MainServlet.do";
			}
		})
	});
	
</script>

<body>

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
            	<ul>
                	<li class="transition"><a href="#">数码</a></li>
                	<li class="transition"><a href="#">科技</a></li>
                	<li class="transition"><a href="#">互联网</a></li>
                	<li class="transition"><a href="#">汽车之家</a></li>
                	<li class="transition"><a href="#">Uber</a></li>
                	<li class="transition"><a href="#">支付宝</a></li>
                	<li class="transition"><a href="#">大数据</a></li>
                	<li class="transition"><a href="#">创业</a></li>
                	<li class="transition"><a href="#">旅游</a></li>
                	<li class="transition"><a href="#">美团</a></li>
                	<li class="transition"><a href="#">社交</a></li>
            	</ul>
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
<div class="container" id="index">
	<div class="wrap-left pull-left">
        <div class="big-pic-box">
             <div class="big-pic">
                  <a id="firsta" target="_blank" class="transition">
                     <div class="back-img"><img width="533px" height="400px" id="firstimg"></div>
                     <div class="big-pic-content">
                          <h1 id="firsth" class="t-h1"></h1>
                      </div>
                  </a>
             </div>
             <div class="big2-pic big2-pic-index big2-pic-index-top">
                  <a id="seconda" class="back-img transition" target="_blank">
                     <div class="back-img"><img width="257px" height="195px" id="secondimg" class="lazy"></div>
                  	<div class="big2-pic-content">
                          <h2 id="secondh" class="t-h1"></h2>
                     </div>
                  </a>
                  <!-- <a href="#" target="_blank" title="嘘！Facebook 正在上海悄悄寻找办公室">
                     
                  </a> -->
             </div>
             <div class="big2-pic big2-pic-index big2-pic-index-bottom">
                  <a id="thirda" class="back-img transition" target="_blank">
                    <div class="back-img"><img width="257px" height="195px" class="lazy" id="thirdimg"></div>
                  	<div class="big2-pic-content">
                          <h2  id="thirdh" class="t-h1"></h2>
                     </div>
                  </a>
                  <!--<a href="#" target="_blank" 马云在人生最艰难时去了延安，在革命根据地决定建立淘宝>
                     
                  </a> -->
             </div>
       </div>
       <div class="mod-info-flow">
       <c:forEach  var="list" items="${map.list }" begin="3">
            <div class="mod-b mod-art" data-aid="213665">
            	<!--  <div class="mod-angle">热</div>--> 
                 <div class="mod-thumb ">
                       <a class="transition" title="${list.title }" href="ArticleServlet.so?id=${list.n_id }&sign=${list.sign}" target="_blank">
						  <img class="lazy" src="/upload/${list.img }" alt="${list.title }">
                       </a>
                 </div>
                 <div class="column-link-box">
                 	<a href="ArticleServlet.so?id=${list.n_id }" class="column-link" target="_blank">${list.nt_name }</a>
                 </div>
                 <div class="mob-ctt">
                    <h2><a href="ArticleServlet.so?id=${list.n_id }" class="transition msubstr-row2" target="_blank">${list.title }</a></h2>
					<div class="mob-author">
                         <!-- <div class="author-face">
                              <a href="#" target="_blank"><img src="forward/sy-img/59_1502432173.jpg"></a>
                         </div> -->
                         <!-- <a href="#" target="_blank">
                            <span class="author-name ">量子位</span>
                         </a> -->
                         <!-- <a href="#" target="_blank" title="购买VIP会员"></a> -->
                         <span class="time">${list.creat_time }</span>
                         <i class="icon icon-cmt"></i><em>0</em>
                         <i class="icon icon-fvr"></i><em>0</em>
                    </div>
                    <div class="test">${list.content }
                    </div>
                 </div>
            </div>
        </c:forEach>
		</div>
        <div class="get-mod-more js-get-mod-more-list transition" data-cur_page="1" data-last_dateline="1504655833">
            点击加载更多
        </div>
	</div>
    <div class="wrap-right pull-right">
        <div class="right-ad-box"></div>

<link rel="stylesheet" type="text/css" href="https://static.huxiucdn.com/www/css/moment.css">
		<div id="moment"></div>
		<div class="box-moder moder-story-list">
    		<h3>24小时</h3>
    		<span class="pull-right project-more story-more"><a href="#" class="transition index-24-right js-index-24-right" target="_blank">查看全部</a></span>
    		<span class="span-mark"></span>
    		<div class="story-box-warp hour-box-warp">
        		<div class="nano">
            	<div class="overthrow nano-content description" tabindex="0">
                	<jsp:include page="../../common/hour24.jsp"></jsp:include>
            	</div>
            	<div class="nano-pane">
                	<div class="nano-slider" style="height: 179px; transform: translate(0px, 0px);"></div>
            	</div>
        	</div>
    	</div>
    	<div class="js-more-moment" data-cur_page="0"></div>
	</div>
	<div class="placeholder"></div>
<!--24小时部分结束1-->
	<div class="ad-wrap">
    	<div class="ad-title">广告</div>
    </div>
    <div class="placeholder"></div>

    <div class="placeholder"></div>
    <div class="placeholder"></div>
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
<script type="text/javascript" src="forward/js/mouse.js"></script>

</body>

</html>
