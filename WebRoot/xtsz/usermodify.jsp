<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.io.*,java.sql.*"%>
<jsp:useBean id="rst" scope="page" class="com.infinity.dbconn.DBConn"/>
<html>
<head>
<script src="../layui/layui.js" charset="utf-8"></script>
<%
   request.setCharacterEncoding("UTF-8");
   String username=request.getParameter("username");//接收用户名
   String password=request.getParameter("password");//接收旧密码
   String newpw1=request.getParameter("newpw1");//接收新密码
   String strSql="select * from tb_user where username='"+
                 username+"'and password='"+password+"'";
   ResultSet rs=rst.getResult(strSql);
   if(rs.next()){
	   //更新用户信息表
     String strUpdate="update tb_user set password='"+newpw1+
                     "' where username='"+username+"'";
     rst.doExecute(strUpdate);
     out.flush();
  	 out.println("<script language='javascript'>");
  	 out.println(" layui.use(['layer', 'form'], function(){var layer = layui.layer,form = layui.form;layer.msg('密码修改成功');});");
  	 out.println("window.setTimeout(function(){window.location.href='usermanager.jsp';},600);");
   	 out.println("</script>");
   }else{
     out.flush();
  	 out.println("<script language='javascript'>");
  	 out.println(" layui.use(['layer', 'form'], function(){var layer = layui.layer,form = layui.form;layer.msg('原密码错误');});");
  	 out.println("window.setTimeout(function(){window.location.href='usermanager.jsp';},600);");
   	 out.println("</script>");
   }
%>

 <style type="text/css">      
     body{      
        background-image: url(../images/blank2.jpg);      
        background-size:cover;   
        margin:0;
        
     }
  </style>
</head>
<body>
</body>
</html>