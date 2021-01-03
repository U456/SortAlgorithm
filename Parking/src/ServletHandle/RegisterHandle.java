package ServletHandle;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class RegisterHandle extends HttpServlet {
	
	HttpServletRequest request;
	HttpServletResponse response;
	DAL.User user=new DAL.User();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");//设置输出编码格式
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session=request.getSession();
		PrintWriter out=response.getWriter();
		String user_id=request.getParameter("user_id");//获取前台url传过来的uName参数
		String user_pwd=request.getParameter("user_pwd");//获取前台url传过来的uPwd参数
		
		DAL.register _reg=new DAL.register();//实例化Login对象，来至DAL包
		
		boolean result =false;
		
		
		
		
		if(!user.checkExist(user_id)) {
		if( result=_reg.insertEntity(user_id,"r002",null,null, user_pwd,null)==1)
		{
			out.write("<script>alert('注册成功'); location.href = '/Parking/Login.jsp';</script>");
		}
		else {
			out.write("<script>alert('注册失败！'); location.href = '/Parking/Register.jsp';</script>");
		}
		}
		else
		{
			out.write("<script>alert('用户已经存在'); location.href = '/Parking/Login.jsp';</script>");
		}
	}
	
	
	
	
	
	
	private void register() throws UnsupportedEncodingException, IOException
	{
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		String UserId=new String(request.getParameter("user_id").getBytes("ISO8859_1"),"UTF-8");
		String RoleId=new String(request.getParameter("role_id").getBytes("ISO8859_1"),"UTF-8");
		String UserName=new String(request.getParameter("user_name").getBytes("ISO8859_1"),"UTF-8");
		String RealName=new String(request.getParameter("real_name").getBytes("ISO8859_1"),"UTF-8");
		String UserPwd=new String(request.getParameter("user_pwd1").getBytes("ISO8859_1"),"UTF-8");
		String UserPhone=new String(request.getParameter("user_phone").getBytes("ISO8859_1"),"UTF-8");

		if(!user.checkExist(UserId))
		{
			if(user.insertEntity(UserId,RoleId,UserName,RealName,UserPwd,UserPhone)==1)
			{
			    SimpleDateFormat dateFormat =new    SimpleDateFormat("yyyyMMddHHmmss"); 
			    String AId=dateFormat.format(new Date());
			    //Account account=new Account();
			    //account.insertEntity(AId, UserId, "0","2015-12-30");
			    out.write("<script>alert('恭喜你，注册成功~'); location.href = '/Parking/Login.jsp';</script>");
			}
		}
		else {
			  out.write("<script>alert('您注册的登陆账号已存在，请重新注册！'); location.href = '/Parking/Login.jsp';</script>");
		}
	}

}
