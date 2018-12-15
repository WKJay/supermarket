package com.infinity.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.infinity.dbconn.DBConn;
import com.infinity.showtime.CalendarBean;
import com.infinity.showtime.ShowTime;


public class LoginServlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public LoginServlet() {
		super();
	}

	/**
		 * Destruction of the servlet. <br>
		 */
	@Override
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
		 * The doGet method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to get.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String password = request.getParameter("pwd");
		String str="select * from tb_user where "+
	               "username='"+username+"' and password='"+password+"'";
		ShowTime calendar = new ShowTime();
		CalendarBean time = new CalendarBean();
		HttpSession session  = request.getSession(); 
		PrintWriter out = response.getWriter();
		ResultSet rs = DBConn.getResult(str);
		try {
			if (rs.next()){
				String strsql=calendar.getDateString();
				String timeShow = time.getTime();
				System.out.println("登录成功！登陆者是"+username+"登陆时间为"+timeShow);
				session.setAttribute("username",rs.getString("username"));//保存登录信息到session对象中
			     session.setAttribute("password",rs.getString("password"));
			     session.setAttribute("zgxm",rs.getString("zgxm"));
			     session.setAttribute("isLog",new String("1"));//将isLog属性设置为1
			     //获得用户上次登录系统的时间
			     session.setAttribute("userLastLogTime",rs.getString("userLastLogTime"));    
			     //将该用户本次登录系统的时间在用户信息表中更新
			     String strUpdate="update tb_user set userLastLogTime='"+strsql+"' where username="+username+"";
			     DBConn rst = null;
				 DBConn.getResult(strUpdate);//执行SQL语句
			     response.sendRedirect("Frame/chat.jsp");//登录成功后转到系统主页面
			}else{
				System.out.println("登陆失败！");
				String a = URLEncoder.encode("用户名或密码错误", "UTF-8"); 
				out.print("<script>alert(decodeURIComponent('"+a+"') );window.location.href='index.jsp'</script>");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
		 * The doPost method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to post.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request,response);
	}

	/**
		 * Initialization of the servlet. <br>
		 *
		 * @throws ServletException if an error occurs
		 */
	@Override
	public void init() throws ServletException {
		// Put your code here
	}

}
