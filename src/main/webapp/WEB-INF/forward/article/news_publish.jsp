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
	<title>Insert title here</title>
	<script type="text/javascript" src="ueditor/ueditor.config.js"></script>    
	<script type="text/javascript" src="ueditor/ueditor.all.js"></script>  
	<script type="text/javascript" src="ueditor/lang/zh-cn/zh-cn.js"></script> 
	<script type="text/javascript" src="js/jquery.js"></script>
	<style type="text/css">
		div{
			width:500px;
			height:500px;
			background:deeplink;
			margin:0 auto;
		}
	</style>
	<script type="text/javascript">
			$(function(){  
			     var fil=$("#img");  
			     $("<img id='file'>").insertAfter($("#img"));
			     $.post(
			 			"NewsTypeServlet.do",
			 			function(data) {
			 				for(var type in data){
			 					$("#type").append("<option value="+data[type].nt_id+">"+data[type].nt_name+"</option>");
			 				}
			 			},
			 			"json"
			 		)
			     fil.bind('change',function(){  
			         var fordate=new FormData();  //得到一个FormData对象：
			         var fils=$("#img").get(0).files[0];  //得到file对象
			         console.log(fils);
			         fordate.append('pic',fils);  //用append方法添加键值对
			         var srcc=window.URL.createObjectURL(fils);     //传入的参数创建一个指向该参数对象的URL
			         console.log(srcc);   
			         $("#file").attr({'src':srcc,'width':130+'px','heigth':130+'px'});  
			         $("#img").attr("style",'display:none')
			     });  
			    }); 
			function newsPublish(){
				var text = ue.getContentTxt();
				var form = new FormData(document.getElementById("news"));
				console.log(text);
				form.append("sign",1)
				form.append("content",text);
				$.ajax({
					  type:"POST",
					  url:"ForwardNewsAddServlet.so",
					  data:form,
					  processData:false,
		              contentType:false,
		              async:false,
					  success:function (data) {
						  console.log("success"+data)
						  window.location.href="MainForwardServlet.so";
					  },
					  error:function(data){
						  console.log("error"+data)
					  }
				  });
			}
	</script>
</head>
<body>
	<form id="news" method="post">
		<div>
			<label>
				<span>新闻标题：</span><input style="margin-top: 15px" type="text" id="title" name="title"><br>
			</label>
			<label>
				<span>新闻分类：</span>
				<select style="margin-top: 15px" id="type" name="type">
					<option>请选择</option>
				</select><br>
			</label>
			<label>
				<span>新闻图片：</span><input style="margin-top: 15px" type="file" id="img" name="file">
			</label>
			<script style="margin-top: 15px" type="text/plain" id="container" name="content"></script>
			<script type="text/javascript">
				 var ue = UE.getEditor('container',{
			        	initialFrameWidth : 600,
			            initialFrameHeight: 400
			        });
		        var text = ue.getContentTxt();
		         function func(){
		        	return text;
		        }
		    </script>
		    <label style="margin: 300 auto">
				<button style="margin-top: 15px;margin-left: 250px" onclick="newsPublish()">发表</button>
				<button style="margin-top: 15px">取消</button>
			</label>
	    </div>
    </form>
</body>
</html>