<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>警告</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="../CSS/mdialog.css">
    <style type="text/css">      
     body{      
        background-image: url(../images/blank2.jpg);      
        background-size:cover;    
     }      
 </style> 


  </head>
  
  <body margin="0 ">
   <script type="text/javascript" src="../js/zepto.min.js"></script>
   <script type="text/javascript" src="../js/mdialog.js"></script>
   
		<script type="text/javascript">
			new TipBox({type:'error',str:'开发中，请稍后再来',hasBtn:true});
		</script>
  </body>
  
  
</html>
