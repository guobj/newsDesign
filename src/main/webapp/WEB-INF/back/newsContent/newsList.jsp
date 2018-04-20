<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE HTML>
<html>
	<head>
		<base href="${basePath }">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/style.css"/>       
        <link href="assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/ace.min.css" />
        <link rel="stylesheet" href="font/css/font-awesome.min.css" />
        <script src="assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/H-ui.js"></script>     
		<script src="assets/js/typeahead-bs2.min.js"></script>           	
		<script src="assets/js/jquery.dataTables.min.js"></script>
		<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="assets/layer/layer.js" type="text/javascript" ></script>          
        <script src="assets/laydate/laydate.js" type="text/javascript"></script>
        <script src="assets/js/jquery.easy-pie-chart.min.js"></script>
        <script src="js/lrtk.js" type="text/javascript" ></script>
        <script type="text/javascript" src="js/jquery.js"></script>
			<script src="assets/js/jquery.min.js"></script>


		<script type="text/javascript">
			window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>


		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/typeahead-bs2.min.js"></script>
		<script src="assets/js/jquery.dataTables.min.js"></script>
		<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
        <script type="text/javascript" src="js/H-ui.js"></script> 
        <script type="text/javascript" src="js/H-ui.admin.js"></script> 
        <script src="assets/layer/layer.js" type="text/javascript" ></script>
        <script src="assets/laydate/laydate.js" type="text/javascript"></script>
        <script type="text/javascript" src="artDialog/dist/dialog-plus.js"></script>
	    <link href="artDialog/css/ui-dialog.css" rel="stylesheet" type="text/css" />
	<title>订单管理</title>
		<script type="text/javascript">
			function productsDel(id) {
				var d = top.dialog({
					title:'否决产品',
					url:'ProductsDelServlet.do?p_id='+id,
					onclose:function(){
						window.location.href="ProductsListServlet.do";
					}
					
				});
				d.showModal();
			}
		</script>
		<script type="text/javascript">
			function productfail(id) {
				var d = top.dialog({
					title:'删除产品',
					url:'ProductFailServlet.do?p_id='+id,
					onclose:function(){
						window.location.href="ProductsListServlet.do";
					}
					
				});
				d.showModal();
			}
		</script>
			
	</head>
	
<body>
	<div class="margin clearfix">

 	<div class="centent_style" id="centent_style">
     <div id="covar_list" class="order_list">
     <div class="search_style">
     <form action="NewsServlet.do" method="post">
	      <ul class="search_content clearfix">
	       <li><label class="l_f">新闻标题</label><input name="title" type="text" class="text_add" placeholder="请输入新闻标题"  style=" width:200px" value="${title }"/></li>
	       <li><label class="l_f">新闻分类</label><input name="nt_name" type="text" class="text_add" placeholder="请输入新闻分类" style=" margin-left:10px;" style=" width:200px" value="${nt_name }"></li>
	       <li style="width:90px;"><input type="submit" class="btn_search" value="查询"><i class="icon-search"></i></li>
	      </ul>
      </form>
    </div>
     <!---->
     <div class="border clearfix">
       <span class="l_f">
       <a href="javascript:void(0)" id="member_add" class="btn btn-warning"><i class="icon-plus"></i>新增新闻</a>
     <!--    <a href="javascript:ovid()" class="btn btn-danger"><i class="icon-trash"></i>批量删除</a> -->
       </span>
     </div>
      <div class="table_menu_list">
	 <table class="table table-striped table-bordered table-hover" id="sample-table">
		<thead>
		 <tr>
				<th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
				<th width="100px">新闻标题</th>
				<th width="100px">图片</th>
				<th width="300px">内容</th>
				<th width="100px">作者</th>
				<th width="100px">分类</th>
                <th width="150px">发布时间</th>				
				<th width="150px">修改时间</th>             
				<th width="200px">操作</th>
			</tr>
		</thead>
	<tbody>
		<c:forEach var="list" items="${newsList }">
	     <tr>
		     <td><label><input name="n_id" type="checkbox" class="ace" value="${list.n_id }"><span class="lbl"></span></label></td>
		     <td>${list.title }</td>
		     <td><img width="100px" src="/upload/${list.img }"/></td>
		     <td>${list.content }</td>
		     <td>${list.auth }</td>
		     <td>${list.nt_name }</td>
		     <td>${list.creat_time }</td>
		     <td>${list.update_time }</td>
		     <td class="td-manage">
			     <a title="编辑" href="javascript:void(0)" onclick="member_edit(${list.n_id })" class="btn btn-xs btn-info" ><i>编辑</i></a>
		         <a href="javascript:void(0)" onclick="member_del(${list.n_id })" class="btn btn-xs btn-danger" title="删除"><i class="icon-trash" style="height:20px"></i>删除</a>
		     </td>
	     </tr>
	     </c:forEach>
	     </tbody>
     </table>
    <jsp:include page="../../common/page.jsp"></jsp:include>
     </div>
    </div>
   </div>
  </div>

<!--添加用户图层-->
<div class="add_menber" id="add_menber_style" style="display:none">
  
    <ul class=" page-content">
     <li><label class="label_name">新闻标题：</label><span class="add_name"><input id="title" value="" name="新闻标题" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">作&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;者：</label><span class="add_name"><input id="auth" name="作者" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
      <li><label class="label_name">分&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;类：&nbsp;</label>
      <span class="add_name">
      <select class="text_add" name="分类" id="type">
      <option>请选择</option>
      </select></span><div class="prompt r_f"></div></li>
    </ul>
 </div>
</body>
</html>
<script type="text/javascript">
/*新闻-添加*/
$('#member_add').on('click', function(){
	$.post(
			"NewsTypeServlet.do",
			function(data) {
				for(var type in data){
					$("#type").append("<option value="+data[type].nt_id+">"+data[type].nt_name+"</option>");
				}
			},
			"json"
		)
   layer.open({
       type: 1,
       title: '添加新闻',
		maxmin: true, 
		shadeClose: true, //点击遮罩关闭层
       area : ['800px' , ''],
       content:$('#add_menber_style'),
		btn:['发布','取消'],
		yes:function(index,layero){
		 var num=0;
		 var str="";
    $(".add_menber input[type$='text']").each(function(n){
         if($(this).val()=="")
         {
			   layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
               title: '提示框',				
				icon:0,								
         }); 
		    num++;
           return false;            
         } 
		 });
		  if(num>0){  return false;}	 	
         else{
			  layer.alert('添加成功！',function(){
				  $.ajax({
					  type:"post",
					  url:"NewsAddServlet.do",
					  data:{"title":$("#title").val(),"auth":$("#auth").val(),"type":$("#type").val()},
					  success:function (data) {
						  window.location.reload();
					  }
				  })
			  }
			);
			   layer.close(index);	
		  }		  		     				
		}
   });
});

/*新闻-编辑*/
function member_edit(id){
	$.post(
		"NewsQueryOneServlet.do",
		{id:id},
		function(data) {
			/* console.log(data) */
			$("#title").val(data.title);
			$("#auth").val(data.auth);
			console.log(data.type)
			for(var t in data.type){
				$("#type").append("<option value="+data.type[t].nt_id+">"+data.type[t].nt_name+"</option>");
				if(parseInt(data.fk_nt_id) == data.type[t].nt_id){
					$("#type option[value='"+data.type[t].nt_id+"']").attr("selected",true);
				}
			}
		},
			"json"
		)
	  layer.open({
        type: 1,
        title: '修改新闻信息',
		maxmin: true, 
		shadeClose:false, //点击遮罩关闭层
        area : ['800px' , ''],
        content:$('#add_menber_style'),
		btn:['提交','取消'],
		yes:function(index,layero){	
		 var num=0;
		 var str="";
     $(".add_menber input[type$='text']").each(function(n){
          if($(this).val()=="")
          {
			   layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
                title: '提示框',				
				icon:0,								
          }); 
		    num++;
            return false;            
          } 
		 });
		  if(num>0){  return false;}	 	
          else{
			  layer.alert('编辑成功！',function(){
				  $.ajax({
					  type:"post",
					  url:"NewsUpdateServlet.do",
					  data:{"id":id,"title":$("#title").val(),"auth":$("#auth").val(),"type":$("#type").val()},
					  success:function (data) {
						  window.location.reload();
					  }
				  })
			  });
			   layer.close(index);	
		  }		  		     				
		}
    });
}

/*新闻-删除*/
function member_del(id){
	layer.confirm('确认要删除吗？',function(){
		$.ajax({
			  type:"get",
			  url:"NewsDelServlet.do",
			  data:{"id":id},
			  success:function (data) {
				  window.location.reload();
			  }
		})
		layer.msg('已删除!',{icon:1,time:1000});
	});
}
</script>