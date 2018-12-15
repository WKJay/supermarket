<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>
<jsp:useBean id="rst" scope="page" class="com.infinity.dbconn.DBConn"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>ADDMONEY</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style type="text/css">

		body {
			background-image: url(../images/blank2.jpg); 
			background-size:cover;  
			margin:0;
		}
		
	 </style>
  <script src="../layui/layui.js" charset="utf-8"></script>
  </head>
  
  <body>
    <%
    	request.setCharacterEncoding("UTF-8");
    	String Money = request.getParameter("money");
    	float money = Float.valueOf(Money);
    	String strUpdate="update tb_supermarket set ldzj = ldzj + "+money+"where ID = 1";
    	rst.doExecute(strUpdate);
		out.println("<script language='javascript'>");
	    out.println(" layui.use(['layer', 'form'], function(){var layer = layui.layer,form = layui.form;layer.msg('资金添加成功');});");
	  	out.println("window.setTimeout(function(){window.location.href='info.jsp';},600);");
	 	out.println("</script>");
     %>
  </body>
</html>






