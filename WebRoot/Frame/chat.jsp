<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<html>
<head>
<style type="text/css">
  body{
  background-image: url(../images/blank2.jpg);
  background-size:cover;    
  }
  </style>
  <script>
  layui.use(['layer', 'form'], function(){
  var layer = layui.layer
  ,form = layui.form;
});

	function getCookie(cname){
	var name = cname + "=";
	var ca = document.cookie.split(';');
	for(var i=0; i<ca.length; i++) {
		var c = ca[i].trim();
		if (c.indexOf(name)==0) return c.substring(name.length,c.length);
	}
	return "";
	}	
	
	function checkkcyj(){
		var kcyjlimit=getCookie("kcyjlimit");
		if (kcyjlimit==""){
		layer.msg("当前环境未设置库存预警限度，请前往:<br>系统设置>>高级设置中进行设置");
		//alert("当前环境未设置库存预警限度，请前往:系统设置>>高级设置中进行设置");
		}
	}
   
  </script>

<title>Home</title>
</head>
<frameset rows="*" cols="*,1000,*" framespacing="1" frameborder="no" marginheight="0">
  <frame src="blank.jsp" name="blankFrame" scrolling="NO" noresize>
  <frameset rows="115,40,*,30" cols="*" frameborder="NO" border="0" framespacing="0">
  <frame src="top.jsp" name="topFrame" scrolling="NO" noresize >
  <frame src="brief.jsp" name="briefFrame" scrolling="NO" noresize >
  <frameset rows="*" cols="268,*" framespacing="0" frameborder="NO" border="0">
  	<frame src="infinity_left.jsp" name="leftFrame" frameborder="no" scrolling="AUTO" noresize >
    <frame src="main.jsp" name="mainFrame" frameborder="0" scrolling="AUTO" noresize marginwidth="0" marginheight="1" bordercolor="#CCCCCC">
  </frameset>
  <frame src="bottom.jsp" name="bottomFrame" scrolling="NO" noresize >
</frameset>
  <frame src="blank.jsp" name="blankFrame">	
</frameset>	
<noframes>
<body>

</script>
</body>
</noframes>
</html>

<script src="../layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">


</script>
