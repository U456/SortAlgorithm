<%@page import="DAL.*" %>
<%@page import="java.util.*"%>
<%@page import="java.util.Date.*"%>
<%@page import="java.util.Calendar"%>
<%@ page import="java.text.*"%>
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
<script>
	$(function()
	{
		$(".btnGo").click(function()
		{
			if($("[name=htype]").val()=="4")
			{
				location.href="<%=path %>/UserHandle?type=4&page="+($(".txtPage").val()==""?1:$(".txtPage").val());
			}
			else
			{
				location.href="<%=path %>/UserHandle?type=5&page="+($(".txtPage").val()==""?1:$(".txtPage").val())+"&condition="+$("[name=hcondition]").val()+"&value="+$("[name=hvalue]").val();
			}		
		});
	});
</script>
</head>
<body>
<div class="div_container">
	<div class="searchDiv">
	
	</div>
	<!-- searchDiv End -->
    <%
    response.setCharacterEncoding("UTF-8");//设置输出数据的编码格式
	request.setCharacterEncoding("UTF-8");//设置获取数据的编码格式
	List<Object> list=(List<Object>)request.getAttribute("list");//获取servlet端转发的list数据列表
	List<Object> moeny=(List<Object>)request.getAttribute("bermy");//获取servlet端转发的list数据列表
	
	if(list==null) {  %>
	 <jsp:forward page="Login.jsp" ></jsp:forward>
	  
	 
	  <%}
	 Object[] obj = (Object[])list.get(0);
	 Object[] obj1 = (Object[])moeny.get(0);
	 String time_before = obj[1].toString();
	 float a=Float.parseFloat(obj1[0].toString());
	 StringBuilder sb=new StringBuilder(time_before);
	    sb.insert(6,"-");
	    sb.insert(4,"-");
	    sb.insert(10," ");
	     sb.insert(13,":");
	     sb.insert(16,":");
	     
	     String time= sb.toString();
	     SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	     ParsePosition pos = new ParsePosition(0);
	     Date strtodate = formatter.parse(time, pos);
	     
	     ParsePosition pis = new ParsePosition(0);
	     String str1 = formatter.format(new Date());
	     Date date = formatter.parse(str1, pis);
	     long diff = date.getTime() - strtodate.getTime();
	     long nh = 1000 * 60 * 60;
	     long hour =diff / nh;
	     
	     
	      
	      if(hour==0) {
	    	  hour++;
	      }
	      
	      float charge = hour*a;
	      
	      
	      
	  %>
	<table>
		<thead>
			<tr>
				<th>用户编号</th>
				<th>角色名称</th>
				<th>用户名称</th>
				<th>真实姓名</th>
				<th>用户密码</th>
				<th>联系方式</th>
				
				
			</tr>
		</thead>

		<tbody>
			<% 
	                	response.setCharacterEncoding("UTF-8");//设置输出数据的编码格式
				request.setCharacterEncoding("UTF-8");//设置获取数据的编码格式

				
	        out.print("<td>"+Float.toString(charge)+"</td><td><a href='"+path+"/Admin/UserEdit.jsp?user_id="+obj[0]+"' class='a_edit'>编辑</a><a href='"+path+"/UserHandle?type=1&user_id="+obj[0]+"' class='a_del' onclick='return confirm(\"是否确认删除？\")'>删除</a></td></tr>");
	                	
	                %>
		</tbody>

		<tfoot>
            		<tr><td colspan="7">
            				<div>
						<%
            						
            					 %>
            					
            				</div>
            			</td>
			</tr>
            </tfoot>

	</table>
</div>
</body>
</html>
