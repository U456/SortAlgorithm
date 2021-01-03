<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();//获取项目名称
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="Script/jquery-1.10.1.js"></script>
<title>注册界面</title>
<script>
	function checkPwd()
	{
		if($("[name=user_pwd]").val()==$("[name=user_pwdbk]").val())
		{
			return true;
		}
		alert("两次输入密码不一~~~");
		return false;
	}
</script>
</head>
<body>
<div class="wrapLogi">
		    <div class="loginPane">
		    	<form action="<%=path %>/RegisterHandle" method="post" onsubmit="return checkPwd()" >
		    		<h2>注册</h2>
			       	<p><label>用名：</label><input type="text" name="user_id"  /></p>
			           	<p><label>密码：</label><input type="password" name="user_pwd"  /></p>
			           	<p><label>密码</label><input type="password" name ="user_pwdbk"/> </p>
			        	<p class="btn"><input type="submit" class="btnLogin" value="注册"  /><input type="button" class="btnCancel" value="重置" /></p>	       		
		       	</form>
		     </div>
    </div>
</body>
</html>