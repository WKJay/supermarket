<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>
<jsp:useBean id="rst" scope="page" class="com.infinity.dbconn.DBConn"/>


  <%
  	 request.setCharacterEncoding("UTF-8");
  	 String q = request.getParameter("q");
  	 String SQLStr = "SELECT * FROM tb_kucun where kcsl < "+q; 
  	 ResultSet rs=rst.getResult(SQLStr);
  	 if(!rs.next()){
  	 	out.print("无缺货状态");
  	 }else{
  		 out.print("<a href='../kcgl/kcjbchat.jsp?qvalue="+q+"' target='mainFrame' color = 'red'>");
  	 	 out.print("有缺货,点击查看！");
  	 	 out.print("</a>");
  	 }
   %>

