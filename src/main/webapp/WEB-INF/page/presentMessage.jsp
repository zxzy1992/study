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
			<span class="input-group-addon">奖品名称</span>
			<input id="name" type="text" class="form-control" >&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="btn btn-info" onclick="select()">查&nbsp;询</button>
		
			<div style="width: 80%;text-align: right;margin-right:10px">
				<button class="btn btn-info" id="create">新&nbsp;建</button>
				<button class="btn btn-info" id="update">修&nbsp;改</button>
				<button class="btn btn-info" id="delete">删&nbsp;除</button>
			</div>
		</div>
		
		<div id="grid" style="margin-top: 20px;margin-left:5px;margin-right:5px">
		</div>
	</div>
</body>
<script >
var con ;   //用来记录表中已选中的某条信息

var data = new kendo.data.DataSource({
	transport : {
		read : {
			type :　"POST",
			contentType : "application/json",
			url : "${pageContext.request.contextPath}/present",
			dataType : "json",
		},
		parameterMap : function(options, operation) {//function (data, type)
			if (operation == "read") {
				 var msg = {
				    		name : $("#name").val(),
				}		
				return JSON.stringify(msg);
			}
		}
	},
	pageSize :　15,
});
	
var grid = $("#grid").kendoGrid({

	height: $(window).height() - 130,
	dataSource : data,
	columns : [
		{
			title : "序号",
			field : "pid",
			hidden : true
		},
		{
			title : "代码号",
			field : "pname",
			width : "100"
		},
		{
			title : "奖品名称",
			field : "cname",
			width : "200"
		},
		{
			title : "奖品数量",
			field : "num",
			width : "100"
		},
		{
			title : "兑换卡种类",
			field : "kind",
			width : "120"
		},
		{
			title : "兑换卡数量",
			field : "value",
			width : "50"
		}
		
	],
	change :function(e){
		 var selectedItem = this.dataItem(this.select());
		 con = {pid:selectedItem.pid, cname:selectedItem.cname,pname:selectedItem.pname,num:selectedItem.num,value:selectedItem.value,kind:selectedItem.kind};
	},
	sortable: true,
    pageable: true,
    resizable : true,
    selectable : "row"
		
}).data("kendoGrid");

function select(){
	$("#grid").data("kendoGrid").dataSource.read();	
}

$("#create").click(function(){
	window.location.href= "./insertPresent";
});

$("#update").click(function(){
	if(con ==""||con== undefined|| con==null){
		alert("需要选中一条信息！");
	}else{
		window.location.href= "./updatePresent?pid="+con.pid;
	}	
});

$("#delete").click(function(){
	if(con ==""||con== undefined|| con==null){
		alert("需要选中信息！");
	}else{
		var r = confirm("确认删除该条信息么？");
		if(r==true){
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/deletePresent",
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

</script>
</html>