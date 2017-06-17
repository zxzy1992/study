<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
	</head>
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<body>
<h2>Hello World!</h2><br>
<div >
	
</div>
	id<input id="sid" ><br>
	
	姓名<input id="user" /><br>
	
	密码<input id="password" /><br>
	
	年级<input id="age" ><br>
	<button  onclick="go()">hahaha</button>
	<script>
	
		var a = $("#sid").val();
		var b = $("#user").val();
		var c = $("#password").val();
		var d = $("#age").val();
		
		
		function go(){
			
			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/study/user",
				dataType:'text',
				data : {info: JSON.stringify({sid:a,user:b,password:c, age:d})},
				success : function(d){
					alert("haha");
					alert(d);
					
				},
				error : function(){
					alert("no haha");
				}
			});
		}
		
	
	</script>
</body>
</html>
