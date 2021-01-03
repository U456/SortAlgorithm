			package ServletHandle;

			import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

			import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.text.SimpleDateFormat;
import java.util.*;

			public class SeatHandle extends HttpServlet {

			HttpServletRequest request;
			HttpServletResponse response;
			DAL.Seat seat=new DAL.Seat();
	
			//通过表单get方式传值 将进入doGet函数（method="get"）
			public void doGet(HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
					this.response=response;
					this.request=request;
					int handleType=Integer.parseInt(request.getParameter("type").toString());
					switch (handleType) {
					case 1://类型1代表删除表中的数据
						deleteEntity();
						break;
					case 4://类型4代表获取表中信息
						getEntity();
						break;
					case 5://类型5代表根据查询条件获取表中信息
						getEntityByWhere();
						break;
					case  6:
						getEntityByid();
						break;
					case 9://类型9查看可用车位
						getEmptyEntity();
						break;
					default:
						break;
					}
			}
	
			private void getEntityByid() throws ServletException, IOException{
				 request.setCharacterEncoding("UTF-8");
					
					
					List<Object> list=seat.getUsedSeat();//获取数据列表
					request.setAttribute("list",list);//将数据存放到request对象中，用于转发给前台页面使用
					
					request.getRequestDispatcher("/Admin/UserOfSeatMsg.jsp").forward(request, response);//请求转发
			}

			//通过表单post方式传值 将进入doPost函数（method="post"）
			public void doPost(HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
					
			}
			
			
		

			

			//删除数据操作
			private void deleteEntity() throws IOException
			{
				String seat_id=request.getParameter("seat_id");//获取前台通过get方式传过来的JId
				seat.deleteEntity(seat_id);//执行删除操作
				response.sendRedirect("/Parking/SeatHandle?type=4");//删除成功后跳转至管理页面
			}

			

			
			//获取对象所有数据列表
			private void getEntity() throws ServletException, IOException
			{
				request.setCharacterEncoding("UTF-8");
				int page=request.getParameter("page")==null?1:Integer.parseInt(request.getParameter("page").toString());//获取跳转的页面号
				int totalPage=Integer.parseInt(seat.getPageCount().toString()) ;//获取分页总数
				List<Object> list=seat.getEntity(page);//获取数据列表
				request.setAttribute("list",list);//将数据存放到request对象中，用于转发给前台页面使用
				request.setAttribute("totalPage",totalPage );//将totalPage存放到request对象中，用于转发给前台页面使用
				request.getRequestDispatcher("/Admin/SeatMsg.jsp").forward(request, response);//请求转发
			}
			
	          private void getEmptyEntity() throws ServletException, IOException {
				
	        	  request.setCharacterEncoding("UTF-8");
					int page=request.getParameter("page")==null?1:Integer.parseInt(request.getParameter("page").toString());//获取跳转的页面号
					int totalPage=Integer.parseInt(seat.getPageCount().toString()) ;//获取分页总数
					List<Object> list=seat.getEntity(page);//获取数据列表
					request.setAttribute("list",list);//将数据存放到request对象中，用于转发给前台页面使用
					request.setAttribute("totalPage",totalPage );//将totalPage存放到request对象中，用于转发给前台页面使用
					request.getRequestDispatcher("/Admin/emptySeatMsg.jsp").forward(request, response);//请求转发
			}
			
			//根据查询条件获取对象所有数据列表
			private void getEntityByWhere() throws ServletException, IOException
			{
				request.setCharacterEncoding("UTF-8");
				String condition=request.getParameter("condition");//获取查询字段的名称
				//String value=new String(request.getParameter("value").getBytes("ISO8859_1"),"UTF-8");//获取查询的值
				String value = request.getParameter("value");
				if(value.equals("闲置")){
					String where=condition+"=0";
					System.out.println("where="+where);
					int page=request.getParameter("page")==null?1:Integer.parseInt(request.getParameter("page"));//获取要跳转的页面号
					int wherePage=Integer.parseInt(seat.getPageCountByWhere(where).toString()) ;//获取查询后的分页总数
					List<Object> list=seat.getEntityByWhere(where, page);//获取查询后的数据列表
					request.setAttribute("list",list);//将数据存放到request对象中，用于转发给前台页面使用
					request.setAttribute("wherePage",wherePage );
					request.setAttribute("condition",condition);
					request.setAttribute("value",value);
					request.getRequestDispatcher("/Admin/SeatMsg.jsp").forward(request, response);
				}if(value.equals("占用")){
					String where=condition+"=1";
					System.out.println("where="+where);
					int page=request.getParameter("page")==null?1:Integer.parseInt(request.getParameter("page"));//获取要跳转的页面号
					int wherePage=Integer.parseInt(seat.getPageCountByWhere(where).toString()) ;//获取查询后的分页总数
					List<Object> list=seat.getEntityByWhere(where, page);//获取查询后的数据列表
					request.setAttribute("list",list);//将数据存放到request对象中，用于转发给前台页面使用
					request.setAttribute("wherePage",wherePage );
					request.setAttribute("condition",condition);
					request.setAttribute("value",value);
					request.getRequestDispatcher("/Admin/SeatMsg.jsp").forward(request, response);
				}else{
					String where=condition+"=\""+value+"\"";//拼接查询字符串
					int page=request.getParameter("page")==null?1:Integer.parseInt(request.getParameter("page"));//获取要跳转的页面号
					int wherePage=Integer.parseInt(seat.getPageCountByWhere(where).toString()) ;//获取查询后的分页总数
					List<Object> list=seat.getEntityByWhere(where, page);//获取查询后的数据列表
					request.setAttribute("list",list);//将数据存放到request对象中，用于转发给前台页面使用
					request.setAttribute("wherePage",wherePage );
					request.setAttribute("condition",condition);
					request.setAttribute("value",value);
					request.getRequestDispatcher("/Admin/SeatMsg.jsp").forward(request, response);
				}
				//String where=condition+"=\""+value+"\"";//拼接查询字符串
			}
		}
