<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <meta charset="utf-8">
    <title>bottom</title>
    <style type="text/css">
    body{
    margin:0;
    }
    table{
    background-color:#f3f6f7;
    }
    #footer {
	text-align: center;
	min-height: 50px;
	_height: 15px;
	border-top: 1px solid black;
	margin-top: 0px;
	padding-top:5px;
	margin-bottom: 10px;
	background-color:#f3f6f7;
}
	 
	</style>
	<link href="../CSS/font-awesome.css" rel="stylesheet" type="text/css" />
 	 <link href="../CSS/bootstrap.min.css" rel="stylesheet" type="text/css" />
  </head>
  
  
  <body>
    <table width="1000" height="50" margin="0" >
    <tr>
    <td>
    	<div id="footer">Copyright ©2017 infinity.top</div>
    </td>
    </tr>
    </table>
  </body>
  
</html>
