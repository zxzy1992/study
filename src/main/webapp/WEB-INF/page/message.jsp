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

	<div id="grid" style="padding: 1px">
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
	

	$("#grid").kendoGrid({
		dataSource : data,
		columns : [
			{
				title :　"姓名",
				field : "sname",
				width : "60%"
			}
		]
			
		
	});
	
</script>
</html>