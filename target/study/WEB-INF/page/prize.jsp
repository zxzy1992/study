<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>

<head>
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
	<div style="text-align: center"><font size="18">星星卡兑换</font>
	<div style="width: 100%;text-align: right;padding-right:10px;margin-top:20px;margin-left:5px">
			<button id="return" class="btn btn-info"  >返&nbsp;回</button>
	</div>
	</div>
	<div style="margin-top:50px;margin-left:50px;margin-right:50px;background-color: #BAE2EF" >
		&nbsp;&nbsp;兑换1张月亮卡：&nbsp;&nbsp;<button id="moon" class="btn btn-info"  >确&nbsp;定</button>
		<br><br>
		&nbsp;&nbsp;兑换1张太阳卡：&nbsp;&nbsp;<button id="sun" class="btn btn-info"  >确&nbsp;定</button>
		<br><br>
		
		
	</div>

	<div style="text-align: center"><font size="18">礼物兑换</font></div>
	<div style="margin-top:50px;margin-left:50px;margin-right:50px;background-color: #BAE2EF" >
		&nbsp;&nbsp;消耗星星卡数：&nbsp;&nbsp;<input id="usestar" style="width:65px;" value="0"  onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="3" >张
		<br><br>
		&nbsp;&nbsp;消耗月亮卡数：&nbsp;&nbsp;<input id="usemoon" style="width:65px;" value="0"  onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="3" >张
		<br><br>
		&nbsp;&nbsp;消耗太阳卡数：&nbsp;&nbsp;<input id="usesun" style="width:65px;" value="0"   onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="3" >张
		<br><br>
		&nbsp;&nbsp;消耗超级太阳卡数：&nbsp;&nbsp;<input id="usesupersun" style="width:32px;" value="0"  onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="3" >张
		<div style="width: 100%;text-align: right;padding-right:10px;margin-top:20px;margin-left:5px">
				<button id="use" class="btn btn-info"  >确&nbsp;定</button>
		</div>
	</div>
</body>
<script>
var w = window.location.search;
var s = w.substring(5, 6);

$("#moon").click(function(){
	$.ajax({
		type : "POST",
		url : "${pageContext.request.contextPath}/changeMoonCard/1",
		dataType:'text',
		data : {info: JSON.stringify({sid:s})},
		success : function(d){
			alert("兑换月亮卡1次！");	
		},
	});
});

$("#sun").click(function(){
	$.ajax({
		type : "POST",
		url : "${pageContext.request.contextPath}/changeMoonCard/2",
		dataType:'text',
		data : {info: JSON.stringify({sid:s})},
		success : function(d){
			alert("兑换太阳卡1次！");	
		},
	});
});

$("#supersun").click(function(){
	$.ajax({
		type : "POST",
		url : "${pageContext.request.contextPath}/changeMoonCard/3",
		dataType:'text',
		data : {info: JSON.stringify({sid:s})},
		success : function(d){
			alert("兑换超级太阳卡1次！");	
		},
	});
});
$("#return").click(function(){
	window.location.href = "./study";
})

$("#use").click(function(){
	
	var star = $("#usestar").val();
	var moon = $("#usemoon").val();
	var sun = $("#usesun").val();
	var supersun = $("#usesupersun").val();
	$.ajax({
		type : "POST",
		url : "${pageContext.request.contextPath}/prize",
		dataType:'text',
		data : {info: JSON.stringify({sid:s,star:star,moon:moon,sun:sun,supersun:supersun})},
		success : function(d){
			alert("兑换成功！");	
		},
	});
	
})
</script>
</html>