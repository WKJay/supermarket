<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="rst" scope="page" class="com.infinity.dbconn.DBConn"/>
<jsp:useBean id="trans" scope="page" class="com.infinity.chinese.ToChinese"/>
<html>
<head>
  <title>添加账号</title>
  <link href="../CSS/style.css" rel="stylesheet" type="text/css">
  <link href="../CSS/font-awesome.css" rel="stylesheet" type="text/css" />
  <link href="../CSS/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <link rel="stylesheet" type="text/css" href="../CSS/mdialog.css">
  <link rel="stylesheet" href="../layui/css/layui.css"  media="all">
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
  <script src="../layui/layui.js" charset="utf-8"></script>
  
   <style type="text/css">      
     body{      
        background-image: url(../images/blank2.jpg);      
        background-size:cover;   
        margin:0;
        
     }      
     #form1{
			
			text-align:center;
		}
     .alert{
     	margin-bottom:0px !important;
     }
     .table{
     	width:60%;
     	margin-left:142;
     }
     legend {
     width:auto;
     border-bottom:0px;
     }
     #td2{
     	width:25%;
     	word-wrap:break-word;
     	word-break:break-all;
     }	 
  </style> 
</head>  
<body>
<%
   //防止非法用户绕过登录页面，直接进入系统内部
   boolean isLog=false;
   try{
     //获得用户是否登录的信息
     isLog=((String)session.getAttribute("isLog")).equals("1");
     }catch(Exception e){}
   if(!isLog){
     out.println("<script language='javascript'>");
  	 out.println(" layui.use(['layer', 'form'], function(){var layer = layui.layer,form = layui.form;layer.msg('您还未登录');});");
  	 out.println("window.setTimeout(function(){window.location.href='../index.jsp';},600);");
   	 out.println("</script>");
     }
     
      request.setCharacterEncoding("UTF-8");
      String kcyjlimit = request.getParameter("kcyjlimit");
%>
<blockquote class="layui-elem-quote">
	<span  class="word_deepgrey"> 当前位置：系统设置></span>高级设置 &gt;&gt;&gt;
</blockquote>
<br>

<fieldset class="layui-elem-field" style="width:95% ;margin-left:15" >
  <legend>高级设置</legend>
  <div class="layui-field-box" >
	<form name="form1" method="post" action="advancedsetting.jsp" id="form1">
	<table class="table table-bordered" >
	<tr>
		<td width = "130"  bgcolor="#EEEEEE">
			库存预警限度
		</td>
		<td width = "270" bgcolor="#EEEEEE">
			<div class="input-group">
			  <input type="text" class="form-control" name="kcyjlimit" aria-describedby="basic-addon1">
		    </div>
		</td>
	</tr>
	
	
	<tr>
		<td colspan="2" align="center"  bgcolor="#EEEEEE">
			<button type="button" class="btn btn-primary" onClick="next()">确认</button> 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="reset" class="btn btn-info" >重置</button>
		</td>
	</tr>
	</table>    
	</form>
  </div>

  </body>
</html>
<script src="../layui/layui.js" charset="utf-8"></script>
<script language="javascript">
layui.use(['layer', 'form'], function(){
  var layer = layui.layer
  ,form = layui.form;
});
function next(){
	var kcyjlimitnum = form1.kcyjlimit.value;
	setCookie("kcyjlimit",kcyjlimitnum);
}

function setCookie(cname,cvalue){
	var d = new Date();
	d.setTime(d.getTime()+(300*24*60*60*1000));
	var expires = "expires="+d.toGMTString();
	document.cookie = cname+"="+cvalue+"; "+expires+";path=/";
	layer.msg("设置成功");
	window.setTimeout(function(){form1.submit();},800);
}



</script>







