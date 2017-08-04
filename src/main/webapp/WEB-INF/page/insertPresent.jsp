<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>

<head>
<style>
	body{
		background-image: url(images/h.jpg);
		background-size:cover;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/js/jquery-1.12.3.js"></script>
	<script src="${pageContext.request.contextPath}/js/json2.js"></script>
    <link rel="stylesheet" href="http://kendo.cdn.telerik.com/2015.3.1111/styles/kendo.common.min.css"/>
    <link rel="stylesheet" href="http://kendo.cdn.telerik.com/2015.3.1111/styles/kendo.rtl.min.css"/>
    <link rel="stylesheet" href="http://kendo.cdn.telerik.com/2015.3.1111/styles/kendo.silver.min.css"/>
    <link rel="stylesheet" href="http://kendo.cdn.telerik.com/2015.3.1111/styles/kendo.mobile.all.min.css"/>
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="http://kendo.cdn.telerik.com/2015.3.1111/js/jszip.min.js"></script>
    <script src="http://kendo.cdn.telerik.com/2015.3.1111/js/kendo.all.min.js"></script>
</head>
<body>
	<div style="text-align: center"><font size="18">新建奖励信息</font></div>
	<div style="margin-top:50px;margin-left:50px;margin-right:50px;background-color: #BAE2EF;padding-top:20px" >
		&nbsp;&nbsp;代码号：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="pname" style="width:200px;margin-top:1px">
		<br><br>
		&nbsp;&nbsp;奖品名称：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="cname" style="width:200px;margin-top:1px">
		<br><br>
		&nbsp;&nbsp;奖品数量：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="num" style="width:50px" >
		<br><br>
		&nbsp;&nbsp;兑换卡种类：&nbsp;&nbsp;<input id="kind" style="width:165px;" >
		<br><br>
		&nbsp;&nbsp;兑换卡数量：&nbsp;&nbsp;<input id="value" style="width:50px" >
		<br><br>
		
	</div>
	<div style="width: 100%;text-align: right;padding-right:10px;margin-top:20px;margin-left:5px">
			<button id="insert" class="btn btn-info" onclick="insert()" >提&nbsp;交</button>
			<button id="return" class="btn btn-info"  >返&nbsp;回</button>
	</div>
</body>
<script>

function insert(){
	
	var cname = $("#cname").val();
	var pname = $("#pname").val();
	var num = $("#num").val();
	var value = $("#value").val();
	var kind =  $("#kind").val();
	
	
	
	$.ajax({
		type : "POST",
		url : "${pageContext.request.contextPath}/insertPresent",
		dataType:'text',
		data : {info: JSON.stringify({cname:cname,pname:pname,num:num,value:value,kind:kind})},
		success : function(d){
			alert("添加成功！");
			window.location.href = "./presentMessage";
		},
		error : function(){
			alert("添加失败！");
		}
	});
	
}

$("#return").click(function(){
	window.location.href="./presentMessage";
})
</script>
</html>