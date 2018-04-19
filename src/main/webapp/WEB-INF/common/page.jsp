<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<script type="text/javascript">
		function jumpPages(pages) {
			document.getElementById("pages").value=pages;
			var pageForm=document.getElementById("pageForm");
			pageForm.action="${url}";
			pageForm.method="post";
			pageForm.submit();
		}
</script>
 共<font color="green">${sumPage }</font>页&nbsp;当前第<font color="green">${pages }</font>页
     <form id="pageForm">
     	<c:if test="${!empty title }">
     		<input type="hidden" name=title value="${title }">
     	</c:if>
     	<c:if test="${!empty nt_name }">
     		<input type="hidden" name="nt_name" value="${nt_name }">
     	</c:if>
     	<input type="hidden" name="pages" id="pages">
     	<div style="float: right;">
	     	<a title="首页" onclick="jumpPages(1)" href="javascript:;"  class="btn btn-xs btn-success" ><i class="icon-edit bigger-120">首页</i></a> 
	     	<a title="上一页" onclick="jumpPages(${(pages-1)<1?1:(pages-1)})" href="javascript:;"  class="btn btn-xs btn-success" ><i class="icon-edit bigger-120">上一页</i></a> 
	     	<a title="下一页" onclick="jumpPages(${(pages+1)>sumPage?sumPage:(pages+1)})" href="javascript:;"  class="btn btn-xs btn-success" ><i class="icon-edit bigger-120">下一页</i></a> 
	     	<a title="尾页" onclick="jumpPages(${sumPage})" href="javascript:;"  class="btn btn-xs btn-success" ><i class="icon-edit bigger-120">尾页</i></a> 
     	</div>
	 </form>