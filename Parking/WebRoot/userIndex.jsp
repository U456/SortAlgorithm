<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="_Error.jsp"%>
<%
	String path = request.getContextPath();//获取项目名称
%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>智能化停车场系统</title>

<script type="text/javascript" src="<%=path %>/Script/jquery-1.10.1.js"></script>
<script type="text/javascript" src="<%=path %>/Script/Index.js"></script>
<link href="<%=path %>/Style/userIndex.css" rel="stylesheet" type="text/css" />
</head>
<body>
	
	 <%-- 判断uName是否存在，如何不存在则证明非登录操作，跳转至登录页面 --%>
	 <%  if (session.getAttribute("user_name") == null ) {%>
	 <jsp:forward page="Login.jsp" ></jsp:forward>
	 <% } %>

	<!--header-->
 	<div class="header">
	        <div class="header_logo">
	        	智能化停车场系统
	        </div>
	        <%-- 
	        <div class="func">
	        	<ul>
	            	<li class="li_func1"><a href="<%=path %>/Common/ChagePwd.jsp" target="mainFrame">修改密码</a></li>
	                <li class="li_func2"><a href="<%=path %>/Common/UserInfo.jsp" target="mainFrame">用户信息</a></li>
	                <li class="li_func3"><a href="<%=path %>/Common/Logout.jsp">退出系统</a></li>
	            </ul>
	        </div>
	       --%>
    	</div>

    
    <div class="wrap">
        <ul class="siderbar">
        	
        	<%
        		if(session.getAttribute("role_id").toString().equals("r002"))
        		{
        	%>
        	  <li><span>车位信息</span>
	            <ul>
	               <li><a href="<%=path %>/SeatHandle?type=9" target="mainFrame">可用车位</a></li>
	               <li><a href="<%=path %>/SeatHandle?type=6" target="mainFrame">已预约车位</a></li>
	            </ul>
	        </li>
	        <li><span>IC卡信息</span>
	            <ul>
	                <li><a href="<%=path %>/Admin/CardAdd.jsp" target="mainFrame">查看IC卡类型</a></li>
	                <li><a href="<%=path %>/SeatHandle?type=6" target="mainFrame">管理IC卡类型</a></li>
	            </ul>
	        </li>
	       
	        <li><span>收费管理</span>
	            <ul>
	                <li><a href="<%=path %>/UserHandle?type=12" target="mainFrame">待付账单</a></li>
	                <li><a href="<%=path %>/Admin/_Error.jsp" target="mainFrame"></a></li>
	        	</ul>
	        </li>
	        
	        <li><span>系统功能操作</span>
	        	<ul>
	                <li><a href="<%=path %>/Common/ChagePwd.jsp" target="mainFrame">修改密码</a></li>
	               
	                 <li><a href="<%=path %>/Common/UserInfoMsg.jsp"" target="mainFrame">查看个人信息</a></li>
	                <li><a href="<%=path %>/Common/Logout.jsp">退出系统</a></li>
	                
	        	</ul>
	       </li>
	        <%
	        	}
	        	else
	        	{
	        %>  	        	    	        
	        <p>留言信息</p>
	        <div>
	                <a href="<%=path %>/User/MsgAdd.jsp" target="mainFrame">添加留言信息</a>
	                <a href="<%=path %>/MsgHandle?type=4" target="mainFrame">管理留言信息</a>
	        </div>
	        
	        <li><span>系统功能操作</span>
	        <div>
	                <a href="<%=path %>/Common/ChagePwd.jsp" target="mainFrame">修改密码</a>
	                <a href="<%=path %>/Common/UserInfo.jsp" target="mainFrame">个人信息</a>
	                <a href="<%=path %>/Common/Logout.jsp">退出系统</a>
	        </div>

	        <%
	        	}
	         %>
	       	 
        </ul>
        
       	<div class="content">
              	<iframe width="99%" height="100%" name="mainFrame" frameborder="0" >
                  
                </iframe>
        </div>
   </div>
        
   <div class="footer"></div>
</body>
</html>
