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
	<div style="text-align: center"><font size="18">学员信息填写</font></div>
	<div style="margin-top:50px;margin-left:50px;margin-right:50px;background-color: #BAE2EF" >
		&nbsp;&nbsp;姓名：&nbsp;&nbsp;<input id="name" style="width:200px;margin-top:1px">
		<br><br>
		&nbsp;&nbsp;性别：&nbsp;&nbsp;<input id="dropDownList" >
		<br><br>
		&nbsp;&nbsp;家长电话：&nbsp;&nbsp;<input id="phone" style="width:165px;" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="11" >
		<br><br>
		&nbsp;&nbsp;班级：&nbsp;&nbsp;<input id="grade" style="width:50px" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="1">年&nbsp;&nbsp;<input id="classId" style="width:50px" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="1">班
		<br><br>
		&nbsp;&nbsp;选择课程：<label for="E1">英语一</label>&nbsp;<input name="sub" id="E1" type="checkbox" value="英语一" style="width:15px;height:15px">
		<label for="E2">英语二</label>&nbsp;<input name="sub" id="E2" type="checkbox" value="英语二" style="width:15px;height:15px">
		<label for="E3">英语三</label>&nbsp;<input name="sub" type="checkbox"  id="E3" value="英语三" style="width:15px;height:15px">
		<label for="E4">英语四</label>&nbsp;<input name="sub" type="checkbox"  id="E4" value="英语四" style="width:15px;height:15px">
		<label for="X">写字班</label>&nbsp;<input name="sub" type="checkbox"  id="X" value="写字班" style="width:15px;height:15px">
		<label for="T">托管班</label>&nbsp;<input name="sub" type="checkbox"  id="T" value="托管班" style="width:15px;height:15px">
		<br><br>
		&nbsp;&nbsp;入学时间：<input id="datepicker" />
	</div>
	<div style="width: 100%;text-align: right;padding-right:10px;margin-top:20px;margin-left:5px">
			<button id="insert" class="btn btn-info" onclick="insert()" >提&nbsp;交</button>
	</div>
</body>
<script>
$("#dropDownList").kendoDropDownList({
	dataSource: [
	  { name : "男", sex : 1},
	  { name : "女", sex : 0}
	 ],
	dataTextField: "name",
	dataValueField: "sex"
});

$("#datepicker").kendoDatePicker({
	format : "yyyy-MM-dd"
});

function insert(){
	
	var arr = [];
	var subject ="";
	var name = $("#name").val();
	var sex = $("#dropDownList").data("kendoDropDownList").value()
	var grade = $("#grade").val();
	var classId = $("#classId").val();
	var phone = $("#phone").val();
	var datepicker = $("#datepicker").data("kendoDatePicker").value();
	
	$('input[name="sub"]:checked').each(function(){
		arr.push($(this).val());
	});
	
	for(var i = 0;i<arr.length;i++){
		subject += arr[i] +"，";
	}	
	
	subject = subject.substring(0, subject.length-1);
	
	$.ajax({
		type : "POST",
		url : "${pageContext.request.contextPath}/insertMessage",
		dataType:'text',
		data : {info: JSON.stringify({sname:name,sex:sex,grade:grade,classId:classId,phone:phone,joindate:datepicker,subjectId:subject})},
		success : function(d){
			alert("添加成功！");
			window.location.href = "./message";
		},
		error : function(){
			alert("添加失败！");
		}
	});
	
}


</script>
</html>