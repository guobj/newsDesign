<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container">
        <div class="navbar-header transition">
            <a href="#" title="首页"><img src="forward/images/logo.jpg" alt="虎嗅网" title="首页" /></a>
        </div>
        <ul class="nav navbar-nav navbar-left" id="jsddm">
            <li class="nav-news js-show-menu">
               <a href="#">资讯 <span class="caret"></span></a>
				<ul id="type">
					<li><a href="#" target="_blank">电商消费</a></li>
                    <li><a href="#" target="_blank">娱乐淘金</a></li>
                    <li><a href="#" target="_blank">雪花一代</a></li>
                    <li><a href="#" target="_blank">人工智能</a></li>
                    <li><a href="#" target="_blank">车与出行</a></li>
				</ul>
            </li>
            <style>
#jsddm ul{position: absolute; visibility: hidden; background:#fff; width:250px;  top:60px; left:-50px; z-index:9999; box-shadow:0 1px 15px rgba(18,21,21,.2);padding:10px 5px;}
#jsddm ul li{ float:left; width:105px; padding-left:20px; line-height:40px;}
</style>
            <li class="nav-news"><a href="#" target="_blank">热议<span class="nums-prompt nums-prompt-topic"></span></a></li>
            <li class="nav-news"><a href="#" target="_blank">活动</a></li>
            <li class="nav-news"><a href="#" target="_blank">创业白板<span class="nums-prompt"></span></a></li>
            <li class="nav-news"><a href="#" target="_blank">会员专享<em class="nums-prompt"></em></a></li>
            <li class="nav-news"><a href="#" target="_blank">官方Blog</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right transition  xiala main_nav">
            <li class="search-li js-show-search-box"><a><i class="icon icon-search "></i></a><span>搜索</span></li>
            <li class="login-link-box"><a class="cd-signin">登录</a></li>
            <li ><a class="cd-signup" >注册</a></li>
            <li><a class="cd-tougao">投稿</a></li>
        </ul>
</div>