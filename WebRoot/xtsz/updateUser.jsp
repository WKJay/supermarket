<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.sql.*,java.io.*"%>
<jsp:useBean id="rst" scope="page" class="com.infinity.dbconn.DBConn"/>
<jsp:useBean id="trans" scope="page" class="com.infinity.chinese.ToChinese"/>
<jsp:useBean id="calendar" scope="page" class="com.infinity.showtime.ShowTime"/>
<script src="../layui/layui.js" charset="utf-8"></script>
<%
   request.setCharacterEncoding("UTF-8");
   String username=request.getParameter("username");
   String password=request.getParameter("password");
   String strSql="select * from tb_user where username='"+username+"'";
   String strAdd="";
   ResultSet rs=rst.getResult(strSql);
   if(rs.next()){
  	 out.println("<script language='javascript'>");
  	 out.println(" layui.use(['layer', 'form'], function(){var layer = layui.layer,form = layui.form;layer.msg('该用户名已存在');});");
  	 out.println("window.setTimeout(function(){window.location.href='addUser.jsp';},600);");
   	 out.println("</script>");
   }
   else{
     String strLast=calendar.getDate();
     String zgbh=request.getParameter("zgbh");
     String djrq=request.getParameter("djrq");
     String zgxm=request.getParameter("zgxm");
     String zgxb=request.getParameter("zgxb");
     String lxdh=request.getParameter("lxdh");
     String zgzz=request.getParameter("zgzz");
     String csrq=request.getParameter("csrq");
     String dzyx=request.getParameter("dzyx");
     strAdd="insert into tb_user values ('"+zgbh+"','"+zgxm+"','"+zgxb+"','"+zgzz+"','"+lxdh+"','"+dzyx+"','"+csrq+"','"+djrq+"',"+0+",'"+username+"','"+password+"','"+strLast+"')";
     rst.doExecute(strAdd);
	 out.println("<script language='javascript'>");
  	 out.println(" layui.use(['layer', 'form'], function(){var layer = layui.layer,form = layui.form;layer.msg('登记成功');});");
  	 out.println("window.setTimeout(function(){window.location.href='addUser.jsp';},600);");
   	 out.println("</script>");
   }
%>
