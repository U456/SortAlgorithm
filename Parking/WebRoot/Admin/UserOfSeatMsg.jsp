<%@page import="DAL.*" errorPage="_Error.jsp"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path=request.getContextPath();//获取项目名称
 %>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=path %>/Style/MsgStyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/Script/jquery-1.10.1.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
String user_id=session.getAttribute("user_id").toString();//获取url传过来的UserId

//out.print("<script>alert('用户名或密码错误！')</script>");
%>
<div class="div_container">
	
	<!-- searchDiv End -->


  <%
  
  DAL.Seat seat =new DAL.Seat();
  List<Object> list=seat.getEntityByid(user_id);//获取servlet端转发的list数据列表
  
  if(list==null) //循环数据列表，生成表格行
	{
	  out.print("<script>alert('用户名或密码错误！')</script>");
	}
		
	
  Object[] obj=(Object[])list.get(0);	
				
				
	
  %>
	<table>
		<thead>
			<tr>
				<th>车位ID</th>
				<th>车位编号</th>
				<th>所属区域</th>
				
				<th>操作</th>
			</tr>
		</thead>

		<tbody>
			<% 
	            response.setCharacterEncoding("UTF-8");//设置输出数据的编码格式
				request.setCharacterEncoding("UTF-8");//设置获取数据的编码格式
				
				
	            out.print("<tr><td>"+obj[0]+"</td><td>"+obj[1]+"</td><td>"+obj[2]+"</td><td><a href='"+path+"/Admin/SeatEdit.jsp?seat_id="+obj[0]+"' class='a_edit'>编辑</a><a href='"+path+"/SeatHandle?type=1&seat_id="+obj[0]+"' class='a_del' onclick='return confirm(\"是否确认删除？\")'>删除</a></td></tr>");
	                	
	        %>
		</tbody>                                                                                                                                                                                                                                                                                                                                                                                      

		

	</table>
</div>
</body>
</html>
