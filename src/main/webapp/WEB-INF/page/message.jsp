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
			<span class="input-group-addon">学习课程</span>
			<input id="subjectId" type="text" class="form-control" >
			<button class="btn btn-info" onclick="select()">查&nbsp;询</button>
			
			<div style="width: 40%;text-align: right;margin-right:10px">
				<button class="btn btn-info" onclick="insert()" >新&nbsp;建</button>
				<button class="btn btn-info" onclick="update()">修&nbsp;改</button>
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
				type :　"POST",
				contentType : "application/json",
				url : "${pageContext.request.contextPath}/student",
				dataType : "json",
			},
			parameterMap : function(options, operation) {//function (data, type)
				if (operation == "read") {
					 var msg = {
					    		name : $("#name").val(),
					    		grade : $("#grade").val(),
					    		classId : $("#classId").val(),
					    		subjectId : $("#subjectId").val()
					}		
					return JSON.stringify(msg);
				}
			}
		},
		pageSize :　15,
	});
		
	var grid = $("#grid").kendoGrid({
		excel : {
			fileName : "学生信息.xlsx",
			allPages : true
		},
		height: $(window).height() - 130,
		dataSource : data,
		columns : [
			{
				title : "学号",
				field : "sid",
				hidden : true
			},
			{
				title : "姓名",
				field : "sname",
				width : "80"
			},
			{
				title : "性别",
				field : "sex",
				width : "40"
			},
			{
				title : "班级",
				field : "classId",
				width : "100"
			},
			{
				title : "课程",
				field : "subjectId",
				width : "200"
			},
			{
				title : "家长联系方式",
				field : "phone",
				width : "120"
			},
			{
				title : "报名时间",
				field : "joindate",
				width : "120"
			},
			{
				title : "交费时间",
				field : "ondate",
				width : "120"
			},
			{
				title : "到费时间",
				field : "offdate",
				width : "120"
			},
		],
		change :function(e){
			 var selectedItem = this.dataItem(this.select());
			 con = {sid:selectedItem.sid,sname:selectedItem.sname,sex:selectedItem.sex,classId:selectedItem.classId,subjectId:selectedItem.subjectId,phone:selectedItem.phone};
		},
		sortable: true,
	    pageable: true,
	    resizable : true,
	    selectable : "row"
			
	}).data("kendoGrid");

	$("#delete").click(function(){
		if(con ==""||con== undefined|| con==null){
			alert("需要选中一名学员！");
		}else{
			var r = confirm("确认删除该条信息么？");
			if(r==true){
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/deleteMessage",
					dataType:'text',
					data : {info: JSON.stringify(con)},
					success : function(d){
						alert("删除成功！");
						$("#grid").data("kendoGrid").dataSource.read();	
					},
					error : function(){
						alert("传入后台数据失败");
					}
				})
			}
		}
	});

	$("#export").click(function(e) {
	    
	    grid.saveAsExcel();
	});
	
	function insert(){
		window.location.href ="./insertMessage";
	}
	
	function select(){
		$("#grid").data("kendoGrid").dataSource.read();	
	}

	function update(){	
		if(con ==""||con== undefined|| con==null){
			alert("需要选中一名学员！");
		}else{
			window.location.href ="./updateMessage?sid="+con.sid;
		}	
	}
</script>
</html>