<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>

<head>
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
	<div style="padding: 2px">
		<div class="input-group" style="width:100%;margin-top:10px;margin-left:5px;margin-right:5px">
			<span class="input-group-addon">姓名</span>
			<input type="text" class="form-control" >&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" class="form-control" >
			<span class="input-group-addon">年</span>
			<input type="text" class="form-control" >
			<span class="input-group-addon">班</span>&nbsp;&nbsp;
			<span class="input-group-addon">星期</span>
			<input type="text" class="form-control" >
			<input type="text" class="form-control" >
			<span class="input-group-addon">点接送</span>
			
			<div style="width: 40%;text-align: right;margin-right:10px">
				<button class="btn btn-info">新&nbsp;建</button>
				<button class="btn btn-info">查&nbsp;询</button>
				<button class="btn btn-info">修&nbsp;改</button>
				<button class="btn btn-info">删&nbsp;除</button>
			</div>
		</div>
		
		<div id="grid" style="margin-top: 20px;margin-left:5px;margin-right:5px">
		</div>
	</div>
	
</body>
<script>

	var data = new kendo.data.DataSource({
		transport : {
			read : {
				url : "${pageContext.request.contextPath}/student",
				dataType : "json"
			}
		},
	});
	
	console.log(data);
	
	$("#grid").kendoGrid({
		dataSource : data,
		columns : [
			{
				title :　"姓名",
				field : "sname",
				width : "20%"
			},
			{
				title :　"性别",
				field : "sex",
				width : "10%"
			},
			{
				title :　"班级",
				field : "classId",
				width : "25%"
			},
			{
				title :　"年级",
				field : "grade",
				width : "25%"
			},
			{
				title :　"课程",
				field : "subjectId",
				width : "20%"
			},
		]
			
		
	});
	
</script>
</html>