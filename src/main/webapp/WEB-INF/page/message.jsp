<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/js/jquery-1.12.3.js"></script>
    <link rel="stylesheet" href="http://kendo.cdn.telerik.com/2015.3.1111/styles/kendo.common.min.css"/>
    <link rel="stylesheet" href="http://kendo.cdn.telerik.com/2015.3.1111/styles/kendo.rtl.min.css"/>
    <link rel="stylesheet" href="http://kendo.cdn.telerik.com/2015.3.1111/styles/kendo.silver.min.css"/>
    <link rel="stylesheet" href="http://kendo.cdn.telerik.com/2015.3.1111/styles/kendo.mobile.all.min.css"/>
    <script src="http://kendo.cdn.telerik.com/2015.3.1111/js/jszip.min.js"></script>
    <script src="http://kendo.cdn.telerik.com/2015.3.1111/js/kendo.all.min.js"></script>
</head>
<body>
	<div style="padding: 2px">
		<div class="input-group" style="width:100%;margin-top:10px;margin-left:5px;margin-right:5px">
			<span class="input-group-addon">姓名</span>
			<input id="name" type="text" class="form-control" >&nbsp;&nbsp;&nbsp;&nbsp;
			<input id="grade" type="text" class="form-control" >
			<span class="input-group-addon">年</span>
			<input id="classId" type="text" class="form-control" >
			<span class="input-group-addon">班</span>
			<span class="input-group-addon">星期</span>
			<input type="text" class="form-control" >
			<input type="text" class="form-control" >
			<span class="input-group-addon">点接</span>
			<button class="btn btn-info" onclick="select()">查&nbsp;询</button>
			
			<div style="width: 40%;text-align: right;margin-right:10px">
				<button class="btn btn-info">新&nbsp;建</button>
				<button class="btn btn-info">修&nbsp;改</button>
				<button id="delete" class="btn btn-info">删&nbsp;除</button>
			</div>
		</div>
		
		<div id="grid" style="margin-top: 20px;margin-left:5px;margin-right:5px">
		</div>
		<div style="width: 100%;text-align: right;padding-right:10px;margin-top:20px;margin-left:5px">
			<button id="export" class="btn btn-info" >下载Excel</button>
		</div>
	</div>
	
</body>
<script>
	
	var con ;   //用来记录表中已选中的某条信息
	var data = new kendo.data.DataSource({
		transport : {
			read : {
				url : "${pageContext.request.contextPath}/student",
				dataType : "json",
				data : {id : 1}
			}
		},
		pageSize :　10
	});
		
	var grid = $("#grid").kendoGrid({
		excel : {
			fileName : "学生信息.xlsx",
			allPages : true
		},
		dataSource : data,
		columns : [
			{
				title : "姓名",
				field : "sname",
				width : "100"
			},
			{
				title : "性别",
				field : "sex",
				width : "50"
			},
			{
				title : "班级",
				field : "classId",
				width : "100"
			},
			{
				title : "课程",
				field : "subjectId",
				width : "150"
			},
			{
				title : "家长联系方式",
				field : "phone",
				width : "200"
			},
		],
		change :function(e){
			 var selectedItem = this.dataItem(this.select());
			 con = {sname:selectedItem.sname,sex:selectedItem.sex,classId:selectedItem.classId,subjectId:selectedItem.subjectId,phone:selectedItem.phone};
		},
		sortable: true,
	    pageable: true,
	    selectable : "row"
			
	}).data("kendoGrid");
	
	/*var dataRows = grid.items();
	// 获取行号
	var rowIndex = dataRows.index(grid.select());
	// 获取行对象
	var data1 = grid.dataItem(grid.select()) */
	$("#delete").click(function(){
		$.ajax({
			
		})
	});
	
	
	
	$("#export").click(function(e) {
	    
	    grid.saveAsExcel();
	});
	
	function select(){
		var name = $("#name").val();
		var grade = $("#grade").val();
		var classId = $("#classId").val();
		console.log(grid.dataSource={sname:"2"});
		
	}
	
</script>
</html>