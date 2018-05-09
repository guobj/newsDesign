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
    <title>文章页-虎嗅网</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
    <meta name="renderer" content="webkit">
    <meta name="baidu-site-verification" content="R9XA5lWxu2" />
    <meta name="author" content="虎嗅网">
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
</head>
<script type="text/javascript">
	function publish(){
		$.ajax({
			type : "post",
			url : "CommentAddServlet.so",
			dataType : "json",
			data : {"fk_n_id":"${map.n_id}","fk_u_id":"${sessionScope.umap.u_id}","comment":$("#saytext197460").val()},
			success : function(data){
					window.location.href = "ArticleServlet.so?id="+${map.n_id}
			}
		});
	}
</script>
<body>
<header id="top" role="banner" class="transition">
<!--搜索弹窗 开始-->
<div class="box">
	<div class="box2">
		<div class="icon icon-search-close js-show-search-box"><a class="close"></a></div>
   	 	<div class="search-content overlay-dialog-animate">
        	<div class="search-input">
            	<form role="search" method="get" action="/search.html" onsubmit="return checkinput()">
                	<button type="submit"></button>
                	<input placeholder="请输入关键字" name="s" id="search-input">
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

<script src="js/d-login.js"></script>
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
<div class="article-section-wrap">
    <div class="article-section" data-aid="197460">
    <div class="container" id="article197460">
        <div class="nrtj-wrap" id="nrtj-wrap197460"></div>
        <div class="wrap-left pull-left">
            <!--文章内容页-->
            <div class="article-wrap">
                <h1 class="t-h1">${map.title }</h1>
                <div class="article-author">
                <span class="author-name"><a href="/member/1373658.html" target="_blank">${map.auth }</a></span>
                <div class="column-link-box">
                	<span class="article-time pull-left">${map.creat_time }</span>
                    <span class="article-share pull-left">收藏87</span>
                    <span class="article-pl pull-left">评论16</span>
                </div>                     
            </div>
<!--管理员按钮-->
            <div class="article-manage-bar" id="article-manage-bar197460"></div>                                
                                    <!--文章头图-->
            <div class="article-img-box"><img src="/upload/${map.img }" alt="${map.title }"></div>
            <div id="article_content197460" class="article-content-wrap">
				<p>${map.content }</p>                                                                <!--作者认证-->
                 <div class="neirong-shouquan">
                      <span class="c2">*文章为作者独立观点，不代表虎嗅网立场<br></span>
                      <span>本文由 <a href="#" target="_blank">判官</a> 授权 <a href="/">虎嗅网</a> 发表，并经虎嗅网编辑。转载此文请于文首标明作者姓名，保持文章完整性（包括虎嗅注及其余作者身份信息），并请附上出处</span>
                      <br />
                      <span><b>未按照规范转载者，虎嗅保留追究相应责任的权利</b></span>
                 </div>
                
            </div>
                    <!--管理员底部按钮-->
             <div class="article-manage-bar article-bottom-manage-bar" id="article-bottom-manage-bar197460"></div>
			 <div class="tag-box ">
                  <ul class="transition">
                      <a href="#" target="_blank"><li class="transition">投稿</li></a>
                      <a href="#" target="_blank"><li class="transition">创业</li></a>
                      <a href="#" target="_blank"><li class="transition">商业模式</li></a>
                   </ul>
              </div>
              <!--公共评论-->
              <div class="pl-wrap" id="pl-wrap-article197460" name="pl-wrap-article">
                   <div class="pl-form-wrap">
                        <span class="span-mark-author active">发表评论</span>
                        <div class="pl-form-box pl-article-wrap">
                        <c:if test = "${sessionScope.umap eq null }">
                             <div class="no-login-box ">
                             	<ul class="main_nav">
						            <li class="login-link-box"><a class="cd-signin">登录</a>后参与评论</li>
						        </ul>
					        </div>
						</c:if>
						<c:if test = "${sessionScope.umap != null }">
						         <textarea class="form-control" id="saytext197460" name="saytext" placeholder="客官，8个字起评，不讲价哟"></textarea>
                        </c:if>
                             <!--普通文章评论发表-->
                             <button id="publish" onclick="publish()" class="btn btn-article js-login transition ">发表</button>
                        </div>
                   </div>
                   <div id="pl-wrap197460" name="pl-wrap"></div>
                   <div class="pl-list-wrap">
                        <div class="pl-loading hide"><img src="/static_2015/img/pl-loading.gif"></div>
                        <a href="javascript:void(0)" class="span-mark-author active js-default-new-pl" data-type="agree">默认评论</a>
                        <i class="icon icon-line-pl"></i>
                        <a href="javascript:void(0)" class="span-mark-author new js-default-new-pl" data-type="dateline">最新评论</a>
                       	<c:forEach var="list" items="${map.list }">
                        <div class="pl-box-wrap">
                			<div class="pl-box-top">
            					<div class="dropdown pull-right">
                					<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                    					<span class="caret"></span>
                					</button>
            					</div>
            					<div class="author-info">
                					<div class="author-face"><img src="https://img.huxiucdn.com/auth/data/avatar/001/54/60/18_1479690318.jpg?|imageMogr2/strip/interlace/1/quality/85/format/jpg"></div>
                					<span class="author-name"><a href="#">${list.u_name }</a><a href="/vip" target="_blank"></a></span>
                					<span class="time">${list.create_time }</span>
            					</div>
            					<div class="pl-content">${list.comment }</div>
                    		</div>
        					<div class="pl-box-btm">
                            	<div class="article-type pull-right">
                					<div class="icon-like-prompt">
                    					<i class="icon icon-like active"></i><span class="c1">+1</span>
                					</div>
                					<div class="icon-no-like-prompt">
                    					<i class="icon icon-no-like active"></i><span class="c1">+1</span>
                					</div>
            					</div>
            					<div class="btn-dp transition js-add-dp-box"><i class="icon icon-dp"></i>我要点评</div>
            					<div class="pl-form-box dp-article-box">
                					<textarea class="form-control" placeholder="客官，8个字起评，不讲价哟"></textarea>
                					<button class="btn btn-article js-article-dp">发表</button>
            					</div>
        					</div>
    					</div>
    					</c:forEach>
                       </div>
              </div>
                    <!--相关文章位置-->
              <div id="related-article-wrap197460"></div>
		</div>
     </div>
     <div class="wrap-right pull-right">
     	<div class="box-author-info">
        	<div class="author-face">
        		<a href="#" target="_blank"><img src="https://img.huxiucdn.com/auth/data/avatar/001/37/36/58_avatar_big.jpg?|imageMogr2/strip/interlace/1/quality/85/format/jpg"></a>
    		</div>
    		<div class="author-name">
    			<%-- <input id="user_id" type="hidden" value="${umap.u_id }"> --%>
        		<a href="MemberServlet.so?id=${map.u_id }" target="_blank">${map.u_name }</a>
        		<a href="#" target="_blank"><i class="i-vip icon-vip" title="虎嗅黑卡会员"></i></a>
        		<i class="i-icon icon-auth3" title="虎嗅认证作者"></i>    
        	</div>
    		<div class="author-one">产品老司机</div>
    		<div class="author-one">产品个体户</div>
    		<div class="author-article-pl">
        		<ul>
            		<li><a href="#" target="_blank">32篇文章</a></li>
        		</ul>
    		</div>
        	<div class="author-next-article">
        		<div class="author-one c2">最近文章</div>
        			<a href="#" target="_blank">冷眼看快手、陌陌们的"短视频社交"</a>
    			</div>
        	</div>
    		<div class="box-moder hot-tag">
        		<h3>热门标签</h3>
        		<span class="pull-right project-more"><a href="#" class="transition" target="_blank">全部</a></span>
        		<span class="span-mark"></span>
        		<div class="search-history search-hot">
            		<ul>
                   	 <li class="transition"><a href="#" target="_blank">阿里巴巴</a></li>
                    	<li class="transition"><a href="#" target="_blank">投稿</a></li>
                    	<li class="transition"><a href="#" target="_blank">创业</a></li>
                    	<li class="transition"><a href="#" target="_blank">头条</a></li>
                    	<li class="transition"><a href="#" target="_blank">马云</a></li>
                    	<li class="transition"><a href="#" target="_blank">大数据</a></li>
                    	<li class="transition"><a href="#" target="_blank">移动互联网</a></li>
                    	<li class="transition"><a href="#" target="_blank">电子商务</a></li>
                    	<li class="transition"><a href="#" target="_blank">微信</a></li>
                    	<li class="transition"><a href="#" target="_blank">Facebook</a></li>
            		</ul>
        		</div>
    		</div>
		<div class="placeholder"></div>
    		<div class="box-moder hot-article">
        		<h3>热文</h3>
        		<span class="span-mark"></span>
        		<ul>
                    <li>
                    	<div class="hot-article-img">
                        	<a href="#" target="_blank"><img src="https://img.huxiucdn.com/article/cover/201706/04/105715329877.jpg?imageView2/1/w/280/h/210/|imageMogr2/strip/interlace/1/quality/85/format/jpg"></a>
                    	</div>
                    	<a href="#" class="transition" target="_blank">3年了，我们的内容消费发生了什么变化？</a>
                	</li>
                    <li>
                    	<div class="hot-article-img">
                        	<a href="#" target="_blank"><img src="https://img.huxiucdn.com/article/cover/201706/04/191327154498.jpg?imageView2/1/w/280/h/210/|imageMogr2/strip/interlace/1/quality/85/format/jpg"></a>
                    	</div>
                    	<a href="#" class="transition" target="_blank">顺丰，菜鸟，令狐冲，岳不群</a>
               		</li>
                    <li>
                    	<div class="hot-article-img">
                        	<a href="#" target="_blank"><img src="https://img.huxiucdn.com/article/cover/201706/04/105715329877.jpg?imageView2/1/w/280/h/210/|imageMogr2/strip/interlace/1/quality/85/format/jpg"></a>
                    	</div>
                    	<a href="#" class="transition" target="_blank">3年了，我们的内容消费发生了什么变化？</a>
                	</li>
                    <li>
                    	<div class="hot-article-img">
                        	<a href="#" target="_blank"><img src="https://img.huxiucdn.com/article/cover/201706/04/191327154498.jpg?imageView2/1/w/280/h/210/|imageMogr2/strip/interlace/1/quality/85/format/jpg"></a>
                    	</div>
                    	<a href="#" class="transition" target="_blank">顺丰，菜鸟，令狐冲，岳不群</a>
               		</li>
                    <li>
                    	<div class="hot-article-img">
                        	<a href="#" target="_blank"><img src="https://img.huxiucdn.com/article/cover/201706/04/105715329877.jpg?imageView2/1/w/280/h/210/|imageMogr2/strip/interlace/1/quality/85/format/jpg"></a>
                    	</div>
                    	<a href="#" class="transition" target="_blank">3年了，我们的内容消费发生了什么变化？</a>
                	</li>
                </ul>
    		</div>
        </div>
    </div>
</div>
<div class="article-section article-section-last"></div>
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
<div id="moquu_wxin" class="moquu_wxin"><a href="javascript:void(0)"><div class="moquu_wxinh"></div></a></div>
<div id="moquu_wshare" class="moquu_wshare"><a href="javascript:void(0)"><div class="moquu_wshareh"></div></a></div>
</footer>
<script language="javascript" type="text/javascript" src="forward/js/jquery-1.11.1.min.js"></script>
<script>
$(document).ready(function() {
     $(".dp-article-box").fadeOut(0);
     $(".js-add-dp-box").click(function() {
          $(".dp-article-box").not($(this).next()).slideUp('fast');
          $(this).next().slideToggle(400);
     });
});
</script>
<script type="text/javascript" src="forward/js/mouse.js"></script>
</body>
</html>