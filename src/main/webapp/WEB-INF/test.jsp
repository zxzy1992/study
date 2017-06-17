<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
	</head>
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<body>
<h2>Hello World!111</h2><br>
	姓名<input id="user" value="123123" />
	<button width="40px" onclick="go()"></button>
	<script>
	
		var a = $("#user").value;
		alert("${pageContext.request.contextPath}");
		function go(){
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/user",
				data : a
			});
		}
		
	
	</script>
</body>
</html>
