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
		height:10%
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


	<link rel = "icon" href="http://localhost:8080/study/images/ico.png" type="image/text-icon">
	<link href="css/kendo.common.min.css" rel="stylesheet" type="text/css" />
	<link href="css/kendo.rtl.min.css" rel="stylesheet" type="text/css" />
	<link href="css/kendo.silver.min.css" rel="stylesheet" type="text/css" />
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/js/jquery-1.12.3.js"></script>
	<script src="${pageContext.request.contextPath}/js/kendo.all.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/kendo.web.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

</head>
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
           		<input id="username" type="text" class="form-control" placeholder="请输入帐号">
        	</div>
        	<br>
        	<div class="input-group">
        		<img src="images/pw.png" style="margin-top: 1px;margin-bottom: 1px">
           		<input id="password" type="password" class="form-control" placeholder="请输入密码">
       	 	</div>
       	 	<br>
       	 	<input id="dropDownList" style="width:100%"/><br><br>
       	 	<button id="button" type="button" style="width: 100%;height:40px" onclick="go()" >登&nbsp;&nbsp;录</button>
		</div>
		<div id="right" ></div>
	</div>
<script>

	$("#button").kendoButton();
	$("#button1").kendoButton();
	$("#dropDownList").kendoDropDownList({
		dataSource: [
		  { identity : "管理员", userId : 0},
		  { identity : "教师", userId : 1}
		 ],
		dataTextField: "identity",
		dataValueField: "userId"
	});
	
	function go(){
		
		
		var username = $("#username").val();
		var password = $("#password").val();
		var type = $("#dropDownList").data("kendoDropDownList").value();
		
		if(username == "" || username==null){
			alert("用户名不能为空！");
		}else if(password =="" || password == null){
			alert("密码不能为空！");
		}else{
			
			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/study/user",
				dataType:'text',
				data : {info: JSON.stringify({username:username,password:password,logintype:type})},
				success : function(d){
					console.log(d, d=="yes", d==="yes")
					if (d === "\"yes\"") {
						window.location.href="${pageContext.request.contextPath}/main"
					} else if(d==="\"notUsername\""){
						alert("帐号输入不正确，请重新输入！");
					} else if(d==="\"notPassword\""){
						alert("密码输入不正确，请重新输入！");
					} else if(d==="\"notType\""){
						alert("选择身份不正确，请重新选择！");
					}
				},
				error : function(){
					alert("传入后台数据失败");
				}
			});
		}
		
	
	}
	
	
</script>
</body>
</html>
