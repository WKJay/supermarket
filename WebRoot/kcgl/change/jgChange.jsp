<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.io.*,java.sql.*"%>
<jsp:useBean id="rst" scope="page" class="com.infinity.dbconn.DBConn"/>

<html>
<head>
<title>价格调整</title>
<link rel="stylesheet" href="../../layui/css/layui.css " media="all">
<script src="../../layui/layui.js" charset="utf-8"></script>
<body>
	
	<%
	   request.setCharacterEncoding("UTF-8");
	   String hid=request.getParameter("hid");
	   String hkcje=request.getParameter("hkcje");
	   String hdj=request.getParameter("hdj");
	   String strSql="update tb_kucun set kcje="+hkcje+
	                 ", dj="+hdj+" where id='"+hid+"'";
	   rst.doExecute(strSql);
	   
	
	   out.flush();
	   out.println("<script language='javascript'>");
	   out.println("layui.use(['layer', 'form'], function(){var layer = layui.layer,form = layui.form;layer.msg('修改成功');});");
	   out.println("window.setTimeout(function(){window.location.href='../modifyPrice.jsp';},600);");
	   out.println("</script>");
	%>
</body>
</head>
</html>
