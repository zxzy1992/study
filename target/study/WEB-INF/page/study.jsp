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
    <script src="http://kendo.cdn.telerik.com/2015.3.1111/js/jszip.min.js"></script>
    <script src="http://kendo.cdn.telerik.com/2015.3.1111/js/kendo.all.min.js"></script>
</head>
<body>
	<div style="padding: 2px">
		<div class="input-group" style="width:100%;margin-top:10px;margin-left:5px;margin-right:5px">
			<span class="input-group-addon">姓名</span>
			<input id="name" type="text" class="form-control" >&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="btn btn-info" onclick="select()">查&nbsp;询</button>
		
			<div style="width: 80%;text-align: right;margin-right:10px">
				<button class="btn btn-info" id="p1">+1</button>
				<button class="btn btn-info" id="p2">+2</button>
				<button class="btn btn-info" id="change">修&nbsp;改</button>
				<button class="btn btn-info" id="dui">兑&nbsp;换</button>
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
			url : "${pageContext.request.contextPath}/card",
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
	pageSize :　10,
});
	
var grid = $("#grid").kendoGrid({
	excel : {
		fileName : "星星卡信息.xlsx",
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
			title : "星星卡数",
			field : "star_num",
			width : "120"
		},
		{
			title : "月亮卡数",
			field : "moon_num",
			width : "120"
		},
		{
			title : "太阳卡数",
			field : "sun_num",
			width : "120"
		},
		{
			title : "超级太阳卡数",
			field : "supersun_num",
			width : "120"
		}
	],
	change :function(e){
		 var selectedItem = this.dataItem(this.select());
		 con = {sid:selectedItem.sid, sname:selectedItem.sname,star_num:selectedItem.star_num,moon_num:selectedItem.moon_num,sun_num:selectedItem.sun_num,supersun_num:selectedItem.supersun_num};
	},
	sortable: true,
    pageable: true,
    resizable : true,
    selectable : "row"
		
}).data("kendoGrid");

$("#export").click(function(e) {
    
    grid.saveAsExcel();
});

function select(){
	$("#grid").data("kendoGrid").dataSource.read();	
}

$("#p1").click(function(e){
	if(con==""||con== undefined|| con==null){
		alert("需要选中一名学员！");
	}else{
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/cardPlus",
			dataType:'text',
			data : {info: JSON.stringify(con)},
			success : function(d){
				alert("成功加一个星星卡！");
				$("#grid").data("kendoGrid").dataSource.read();	
			},
			error : function(){
				alert("添加失败！");
			}
		});
	}
})

$("#p2").click(function(e){
	if(con==""||con== undefined|| con==null){
		alert("需要选中一名学员！");
	}else{

		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/cardPlus2",
			dataType:'text',
			data : {info: JSON.stringify(con)},
			success : function(d){
				alert("成功加两个星星卡！");
				$("#grid").data("kendoGrid").dataSource.read();	
			},
			error : function(){
				alert("添加失败！");
			}
		});
	}
})

$("#change").click(function(){
	if(con==""||con== undefined|| con==null){
		alert("需要选中一名学员！");
	}else{
		window.location.href = "./updateCard?sid="+con.sid;
	}
	
})

$("#dui").click(function(){
	
	if(con==""||con== undefined|| con==null){
		alert("需要选中一名学员！");
	}else{
		window.location.href = "./prize?sid="+con.sid;
	}
	
});
</script>
</html>