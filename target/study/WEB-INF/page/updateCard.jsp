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
	<div style="text-align: center"><font size="18">星星卡信息修改</font></div>
	<div style="margin-top:50px;margin-left:50px;margin-right:50px;background-color: #BAE2EF;padding-top:20px;padding-bottom: 20px" >
		&nbsp;&nbsp;姓名：&nbsp;&nbsp;<label id="name" style="width:198px;margin-top:1px"></label>
		<br><br>
		&nbsp;&nbsp;星星卡数：&nbsp;&nbsp;<input id="star" style="width:165px;" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="3" >
		<br><br>
		&nbsp;&nbsp;月亮卡数：&nbsp;&nbsp;<input id="moon" style="width:165px;" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="3" >
		<br><br>
		&nbsp;&nbsp;太阳卡数：&nbsp;&nbsp;<input id="sun" style="width:165px;" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="3" >
		<br><br>
		&nbsp;&nbsp;超级太阳卡数：&nbsp;&nbsp;<input id="supersun" style="width:132px;" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="3" >
		<br><br>
		&nbsp;&nbsp;备注：&nbsp;&nbsp;<input id="bz" style="width:500px;"  >
		
	</div>
	<div style="width: 100%;text-align: right;padding-right:10px;margin-top:20px;margin-left:5px">
			<button id="sure" class="btn btn-info"  >确&nbsp;定</button>
			<button id="return" class="btn btn-info"  >返&nbsp;回</button>
	</div>
</body>
<script>
var w = window.location.search;
var s = w.substring(5, w.length);
$(function(){
	$.ajax({
		type : "POST",
		url : "${pageContext.request.contextPath}/selectCard",
		dataType:'text',
		data : {info: JSON.stringify({"sid":s})},
		success : function(data){
			var d = JSON.parse(data);
			$("#name").text(d.sname);
			$("#star").val(d.star_num);
			$("#moon").val(d.moon_num);
			$("#sun").val(d.sun_num);
			$("#supersun").val(d.supersun_num);
			$("#bz").val(d.bz);
		}
	})
});

$("#sure").click(function(){
	
	var star_num = $("#star").val();
	var moon_num = $("#moon").val();
	var sun_num = $("#sun").val();
	var supersun_num = $("#supersun").val();
	var bz = $("#bz").val();
	
	$.ajax({
		type : "POST",
		url : "${pageContext.request.contextPath}/updateCard",
		dataType:'text',
		data : {info: JSON.stringify({sid:s,star_num,star_num,moon_num:moon_num,sun_num:sun_num, supersun_num:supersun_num,bz:bz})},
		success : function(d){
			alert("修改成功！");			
		},
	});
});

$("#return").click(function(){
	window.location.href = "./card";
})
</script>
</html>