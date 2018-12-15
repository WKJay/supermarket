<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="rst" scope="page" class="com.infinity.dbconn.DBConn"/>
<script src="../../layui/layui.js" charset="utf-8"></script>
<%
	String DeleteSql = request.getParameter("DeleteSql");//用request得到url中传的sql语句
	rst.doExecute(DeleteSql);
	out.flush();
    out.println("<script language='javascript'>");
    out.println(" layui.use(['layer', 'form'], function(){var layer = layui.layer,form = layui.form;layer.msg('删除成功');});");
    out.println("window.setTimeout(function(){window.location.href='../main.jsp';},600);");
    out.println("</script>");
%>
<head>
<style type="text/css">      
	     body{      
	        background-image: url(../../images/blank2.jpg);      
	        background-size:cover;   
	        margin:0;
	        
	     }      
 	</style>	
</head>
<body>
</body>