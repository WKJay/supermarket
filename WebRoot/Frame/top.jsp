<%@ page contentType="text/html;charset=gb2312" language="java"%>
<%@ page import="java.io.*,java.sql.*,java.util.*"%>
<html>
  <title>
  </title>
  <head>
  </head>
  <style type="text/css">
  body{
  background-image: url(../images/blank2.jpg);
  background-size:cover;  
  margin-bottom:0px !important;  
  }
  </style>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link href="../CSS/style.css" rel="stylesheet" type="text/css">
  <body>
<%
  boolean isLog=false;
  try
  {
    //获得用户是否登录的信息
    isLog=((String)session.getAttribute("isLog")).equals("1");
  }
  catch(Exception e){}
  if(!isLog)
  {
    out.println("<script language='javascript'>alert('您还没有登录');parent.location.href='../index.jsp';</script>");
  }
%>
<table width="1000"  border="0" align="center" cellpadding="0" cellspacing="0" margin="0">
  <tr>
    <td width="1000" height="115" align="center" valign="top">
	    <a href="main.jsp" target="mainFrame">
			<img src="../images/logo.jpg" width="1000" height="115">
	    </a>
    </td>
  </tr>
</table>
  </body>
</html>



















