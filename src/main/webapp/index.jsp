<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<title>思大迪教育</title>

<head>

<style type="text/css">
	body{
		background-image: url(images/bg.jpg);
		background-size:cover;
	}
		
	div{
		margin:0;
		padding:0;
	}
	#container{
		margin:auto;
		width:100%;
		height:100%;
	}
	#header1{
		width:100%;
		height:15%
	}
	#header2{
		width:100%;
		height:20%;
	}
	
	#left{
		float:left;
		width:38%;
		height:45%;
	}
	#mid{
		float:left;
		width:24%;
		height:45%;		
	}
	#right{
		float:right;
		width:38%;
		height:45%;
	}
		
</style>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 

</head>
	
	<link href="css/kendo.common.min.css" rel="stylesheet" type="text/css" />
	<link href="css/kendo.rtl.min.css" rel="stylesheet" type="text/css" />
	<link href="css/kendo.silver.min.css" rel="stylesheet" type="text/css" />
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/js/jquery-1.12.3.js"></script>
	<script src="${pageContext.request.contextPath}/js/kendo.all.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

	
<body>
	<div id=container>
		<div id="header1"></div>
		<div id="header2"><h1 align="center">思大迪教育人员管理系统</h1></div>
		<div id="left"></div>
		<div id="mid">
			<h3 align="center">请&nbsp;&nbsp;登&nbsp;&nbsp;录</h3>
			<br>
			<div class="input-group">
            	<img src="images/user.png" style="margin-top: 1px;margin-bottom: 1px">
           		<input type="text" class="form-control" placeholder="请输入帐号">
        	</div>
        	<br>
        	<div class="input-group">
        		<img src="images/pw.png" style="margin-top: 1px;margin-bottom: 1px">
           		<input type="password" class="form-control" placeholder="请输入密码">
       	 	</div>
       	 	<br>
       	 	<button id="button" type="button" style="width: 100%;height:40px" onclick="go()" >登&nbsp;&nbsp;录</button>
		</div>
		<div id="right" ></div>
	</div>
<script>
	$("#button").kendoButton();
		function go(){
			var a = "12123";
			var b = "123";
			var c = 12;
			
			
			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/study/user",
				dataType:'text',
				data : {info: JSON.stringify({user:a,password:b, age:c})},
				success : function(d){
					alert("haha");
					alert(d);
					
				},
				error : function(){
					alert("no haha");
				}
			});
		}
		
	
	</script>
</body>
</html>
