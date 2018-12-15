<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.sql.*,java.io.*"%>
<meta charset="UTF-8">
<% request.setCharacterEncoding("UTF-8");%>
<link rel="stylesheet" href="../../layui/css/layui.css">
<jsp:useBean id="khinfo" scope="page" class="com.infinity.info.KhinfoBean">
<jsp:setProperty name="khinfo" property="*"/>
</jsp:useBean>
<jsp:useBean  id="regist" scope="page" class="com.infinity.info.KhRegist"/>
<script src="../../layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
</script>
<%
   regist.setKhinfo(khinfo);
   regist.regist();//调用regist()方法来对数据库操作
   out.flush();
   out.println("<script language='javascript'>");
   out.println(" layui.use(['layer', 'form'], function(){var layer = layui.layer,form = layui.form;layer.msg('登记成功');});");
   out.println("window.setTimeout(function(){window.location.href='../khinfo.jsp';},600);");

   out.println("</script>");
     
%>
<head>
<style>
body{      
        background-image: url(../../images/blank2.jpg);      
        background-size:cover;   
        margin:0;
        
     } 
</style>
</head>
<body>
</body>
  