<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="js/jquery.js"></script>
<ul class="box-list mt-box-list">
            <!--公共24小时列表部分-->
        <c:forEach  var="list" items="${map.cList }">
        	<li>
				<div class="story-content">
    				<div class="mt-story-title js-story-title" story-data-show="true">
        				<p class="transition hour-arrow">
            				<span class="icon icon-caret js-mt-index-icon"></span>
       					</p>
        				<ul class="hour-head">
            				<!-- <li><img class="hour-tx" src="sy-img/touxiang.jpg" alt="头像"></li> -->
            				<li>
                				<p>${list.title }</p>
                				<p><fmt:formatDate value="${list.creat_time }" type="both"/></p>
            				</li>
        				</ul>
    				</div>
    				<div class="mt-index-info-parent">
        				<div class="story-info mt-story-info" >
            				<p class="story-detail-hide hour-detail-hide mt-index-cont mt-index-cont2 js-mt-index-cont2">${list.content }<a style="float:right" href="ArticleServlet.so?id=${list.n_id }&sign=${list.sign}" target="_blank" class="mt-index-cont2-a">&nbsp原文&nbsp</a>
                             </p>
        				</div>
    				</div>
				</div>
			</li>
		</c:forEach>
</ul>