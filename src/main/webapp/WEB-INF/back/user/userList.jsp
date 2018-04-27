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
	</head>
	
<body>
	<div class="margin clearfix">

 	<div class="centent_style" id="centent_style">
     <div id="covar_list" class="order_list">
     <div class="search_style">
     <form action="EmployeeListServlet.do" method="post">
	      <ul class="search_content clearfix">
	       <li><label class="l_f">用户名</label><input name="u_name" type="text" class="text_add" placeholder="请输入用户名"  style=" width:200px" value="${u_name }"/></li>
	       <li><label class="l_f">用户账号</label><input name="account" type="text" class="text_add" placeholder="请输入用户账号" style=" margin-left:10px;" style=" width:200px" value="${account }"></li>
	       <li style="width:90px;"><input type="submit" class="btn_search" value="查询"><i class="icon-search"></i></li>
	      </ul>
      </form>
    </div>
     <!---->
     <div class="border clearfix">
       <span class="l_f">
       <a href="javascript:void(0)" id="member_add" class="btn btn-warning"><i class="icon-plus"></i>添加员工</a>
     <!--    <a href="javascript:ovid()" class="btn btn-danger"><i class="icon-trash"></i>批量删除</a> -->
       </span>
     </div>
      <div class="table_menu_list">
	 <table class="table table-striped table-bordered table-hover" id="sample-table">
		<thead>
		 <tr>
				<th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
				<th width="100px">用户名</th>
				<th width="80px">性别</th>
				<th width="80px">年龄</th>
				<th width="300px">住址</th>
				<th width="120px">电话</th>
                <th width="170px">邮箱</th>				
				<th width="150px">账号</th>
				<th width="200px">操作</th>
			</tr>
		</thead>
	<tbody>
		<c:forEach var="list" items="${list }">
	     <tr>
		     <td><label><input name="u_id" type="checkbox" class="ace" value="${list.u_id }"><span class="lbl"></span></label></td>
		     <td>${list.u_name }</td>
		     <td><c:if test="${list.u_sex eq 1 }">男</c:if>
	             <c:if test="${list.u_sex eq 0 }">女</c:if>
		     </td>
		     <td>${list.u_age }</td>
		     <td>${list.u_address }</td>
		     <td>${list.u_tel }</td>
		     <td>${list.u_email }</td>
		     <td>${list.account }</td>
		     <td class="td-manage">
			     <a title="编辑" href="javascript:void(0)" onclick="member_edit(${list.u_id })" class="btn btn-xs btn-info" ><i>编辑</i></a>
		         <a href="javascript:void(0)" onclick="member_del(${list.u_id })" class="btn btn-xs btn-danger" title="删除"><i class="icon-trash" style="height:20px"></i>删除</a>
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
     <li><label class="label_name">用户名：</label><span class="add_name"><input id="u_name" value="" name="员工姓名" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label><span class="add_name">
     <label><input name="e_sex" type="radio" value="1" checked="checked" class="ace"><span class="lbl">男</span></label>&nbsp;&nbsp;&nbsp;
     <label><input name="e_sex" type="radio" value="0" class="ace"><span class="lbl">女</span></label>&nbsp;&nbsp;&nbsp;
     </span>
     <div class="prompt r_f"></div>
     </li>
     <li><label class="label_name">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：</label><span class="add_name"><input id="e_age" name="年龄" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
      <li><label class="label_name">家庭住址：</label><span class="add_name"><input name="家庭住址" id="e_address" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
      <li><label class="label_name">移动电话：</label><span class="add_name"><input name="移动电话" id="e_tel" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">电子邮箱：</label><span class="add_name"><input name="电子邮箱" id="e_email" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">员工账号：</label><span class="add_name"><input name="员工账号" id="account" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
      <li><label class="label_name"> &nbsp;权&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;限：&nbsp;</label>
      <span class="add_name">
      &nbsp; &nbsp;<select class="text_add" name="权限" id="fk_p_id">
      <option>请选择</option>
      </select></span><div class="prompt r_f"></div></li>
      
    </ul>
 </div>
</body>
</html>
<script type="text/javascript">
/*员工-添加*/
$('#member_add').on('click', function(){
	$.post(
			"AuthorityServlet.do",
			function(data) {
				for(var name in data){
					$("#fk_p_id").append("<option value="+data[name].p_id+">"+data[name].p_name+"</option>");
				}
			},
			"json"
		)
   layer.open({
       type: 1,
       title: '添加员工',
		maxmin: true, 
		shadeClose: true, //点击遮罩关闭层
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
			  layer.alert('添加成功！',function(){
				  $.ajax({
					  type:"post",
					  url:"EmployeeAddServlet.do",
					  data:{
						  "e_name":$("#e_name").val(),"e_sex":$("input[name='e_sex']:checked").val(),
						  "e_age":$("#e_age").val(),"e_address":$("#e_address").val(),
						  "e_tel":$("#e_tel").val(),"e_email":$("#e_email").val(),
						  "account":$("#account").val(),"fk_p_id":$("#fk_p_id").val()
					  },
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

/*员工-编辑*/
function member_edit(id){
	$.post(
		"EmployeeQueryOneServlet.do",
		{id:id},
		function(data) {
			/* console.log(data) */
			$("#e_name").val(data.e_name);
			//$("#e_sex").val(data.),
			$("#e_age").val(data.e_age);
			$("#e_address").val(data.e_address);
			$("#e_tel").val(data.e_tel);
			$("#e_email").val(data.e_email);
			$("#account").val(data.account);
			for(var auth in data.auth){
				$("#fk_p_id").append("<option value="+data.auth[auth].p_id+">"+data.auth[auth].p_name+"</option>");
				if(parseInt(data.fk_p_id) == data.auth[auth].p_id){
					$("#fk_p_id option[value='"+data.auth[auth].p_id+"']").attr("selected",true);
				}
			}
			//$(":radio[name='e_sex']").attr("checked",data.e_sex);
			$("input[type=radio][name=e_sex][value="+data.e_sex+"]").attr("checked",'checked')
			if(parseInt(data.fk_p_id) == 3){
				$("#account").attr("readonly",'readonly');
				$("#fk_p_id").attr("disabled",'disabled');
			}
		},
			"json"
		)
	  layer.open({
        type: 1,
        title: '修改员工信息',
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
					  url:"EmployeeUpdateServlet.do",
					  data:{
						  "id":id,"e_name":$("#e_name").val(),"e_sex":$('input[name="e_sex"]:checked').val(),
						  "e_age":$("#e_age").val(),"e_address":$("#e_address").val(),
						  "e_tel":$("#e_tel").val(),"e_email":$("#e_email").val(),
						  "fk_p_id":$("#fk_p_id").val()
					  },
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
			  url:"EmployeeDelServlet.do",
			  data:{"id":id},
			  success:function (data) {
				  window.location.reload();
			  }
		})
		layer.msg('已删除!',{icon:1,time:1000});
	});
}
</script>