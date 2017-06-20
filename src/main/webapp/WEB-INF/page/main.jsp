<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<title>思大迪教育</title>
<head>
<style type="text/css">
	div{
		margin:0;
		padding:0;
		border:1px solid #000
		
	}

	#container{
		margin:auto;
		width:100%;
		height:100%;
	}
	#headerleft{
		float:left;
		width:15%;
		height:15%;
	}
	#headerright{
		float:right;
		width:85%;
		height:15%;
	}
	#left{
		float:left;
		width:15%;
		height:85%;
	}
	#right{
		float:right;
		width:85%;
		height:85%;
	}
	


</style>
	
	
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
	<div id="container">
		<div id="headerleft">1</div>
		<div id="headerright" style="text-align: right">
			<button id="button" type="button"   onclick="exit()" >退&nbsp;出</button>
		</div>
		<div id="left" style="background-color: #BAE2EF">
			<button style="width: 100%;height:50px;border:1px solid #000;background-color: #BAE2EF" onclick="studentMessage()">学生基本信息</button>
			<button style="width: 100%;height:50px;border:1px solid #000;background-color: #BAE2EF" onclick="studentStudy()">学生学习情况</button>
			<button style="width: 100%;height:50px;border:1px solid #000;background-color: #BAE2EF" onclick="teacherMessage()">教师信息</button>
			<button style="width: 100%;height:50px;border:1px solid #000;background-color: #BAE2EF" onclick="setting()">参数设置</button>
		</div>
		<div id="right">
			<iframe id="main"  style="width: 100%;height:100%"></iframe>
		</div>
	</div>


</body>
<script type="text/javascript">
	function studentMessage(){
		$("#main").attr("src", "message");
	}
	
	function studentStudy(){
		$("#main").attr("src", "study");
	}
	
	function teacherMessage(){
		$("#main").attr("src", "teacher");
	}
	
	function setting(){
		$("#main").attr("src", "setting");
	}
</script>
</html>