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
	<div style="text-align: center"><font size="18">星星卡兑换</font>
	</div>
	<div style="margin-top:50px;margin-left:50px;margin-right:50px;background-color: #BAE2EF;padding-top:20px" >
		&nbsp;&nbsp;姓名：&nbsp;&nbsp;<label id="name" style="width:198px;margin-top:1px"></label>
		<br><br>
		&nbsp;&nbsp;兑换1张月亮卡：&nbsp;&nbsp;<button id="moon" class="btn btn-info"  >确&nbsp;定</button>
		<br><br>
		&nbsp;&nbsp;兑换1张太阳卡：&nbsp;&nbsp;<button id="sun" class="btn btn-info"  >确&nbsp;定</button>
		<br><br>
	</div>

	<div style="text-align: center"><font size="18">礼物兑换</font></div>
		<div style="padding:20px; margin-top:50px;margin-left:50px;margin-right:50px;background-color: #BAE2EF" >
			奖品名称：&nbsp;&nbsp;<div id="dropdownlist" style="width:280px"></div>
			&nbsp;&nbsp;1个（套）
			<div style="width: 100%;text-align: right;padding-right:10px;margin-top:20px;margin-left:5px">
					<button id="use" class="btn btn-info"  >确&nbsp;定</button>
					<button id="return" class="btn btn-info"  >返&nbsp;回</button>
			</div>
		</div>
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
		}
	})
});


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
	window.location.href = "./card";
})

$("#use").click(function(){
	
	var pname = $("#dropdownlist").data("kendoDropDownList").value();
	
	$.ajax({
		type : "POST",
		url : "${pageContext.request.contextPath}/prize",
		dataType:'text',
		data : {info: JSON.stringify({sid:s,pname:pname,num:1})},
		success : function(d){
			alert("兑换该礼物1次！");	
		},
	});
	
})

$("#dropdownlist").kendoDropDownList({
	 optionLabel : "请选择奖品",
	 height: 250,
	 filter: "contains",
	 dataTextField: "cname",
     dataValueField: "pname",
     dataSource: {
         transport: {
             read: {
            	 type :　"POST",
 				 contentType : "application/json",
            	 dataType: "json",
                 url: "${pageContext.request.contextPath}/presentDrop",
             }
         }
     }
});
</script>
</html>