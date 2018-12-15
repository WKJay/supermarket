<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>库存警报框架</title>
</head>
<%
String qvalue=request.getParameter("qvalue");
String dic = "kcjb.jsp?qvalue="+qvalue;
 %>
<frameset rows="100,*" cols="*" frameborder="no" border="1" framespacing="0">
  <frame src="kcjbtop.jsp" name="topFrame" frameborder="no" scrolling="NO" noresize>
  <frame src="<%=dic %>" name="main2Frame" frameborder="no" scrolling="AUTO" noresize marginwidth="1" marginheight="1" bordercolor="#CCCCCC">
</frameset>
<noframes>
<body>

</body>
</noframes>
</html>
