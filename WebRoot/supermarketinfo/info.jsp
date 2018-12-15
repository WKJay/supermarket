<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.io.*"%>
<jsp:useBean id="rst" scope="page" class="com.infinity.dbconn.DBConn"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset="UTF-8">
    <title>超市信息</title>
    <link href="../CSS/font-awesome.css" rel="stylesheet" type="text/css" />
	<link href="../CSS/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="../CSS/mdialog.css">
	<link href="../CSS/style.css" rel="stylesheet" type="text/css"/> 
	
	<link rel="stylesheet" href="../layui/css/layui.css"  media="all">
	<style type="text/css">      
     body{      
        background-image: url(../images/blank2.jpg);      
        background-size:cover;   
        margin:0;
     }      
     legend {
     width:auto;
     border-bottom:0px;
     }
      .table{
     	width:60%;
     	margin-left:142;
     }
	</style> 

  </head>
  
  <body>
  <script src="../layui/layui.js" charset="utf-8"></script>
  <%
   request.setCharacterEncoding("UTF-8");
   String strSql="select * from tb_supermarket";
   ResultSet rs=rst.getResult(strSql);//在下拉列表中显示销售商品名称
   String ldzj = "0";
   if(!rs.next()){
   }else{
   	 ldzj = rs.getString("ldzj");
   }
   %>
  	  <blockquote class="layui-elem-quote">
	  	<span  class="word_deepgrey"> 当前位置：超市管理 ></span>超市信息 &gt;&gt;&gt;
	  </blockquote>
	  <br>
	  <fieldset class="layui-elem-field" style="width:95% ;margin-left:15" >
	  <legend>超市信息</legend>
	  <div class="layui-field-box" >
	  <form name="form1" method="post" action="addmoney.jsp" id="form1">
		<table class="table table-bordered" >
		<tr>
			<td width = "100"  bgcolor="#EEEEEE">
				流动资金
			</td>
			<td width = "220" bgcolor="#EEEEEE">
			<div class="input-group">
			  	<input type="text" class="form-control" name="ldzj" aria-describedby="basic-addon1" 
			  	readonly value="<%=ldzj %>">
				  	<span class="input-group-addon" id="basic-addon1">
				  		<i class="fa fa-jpy" aria-hidden="true"></i>
				    </span>
		    </div>
			</td>
		</tr>	
		<tr>
			<td width = "100"  bgcolor="#EEEEEE">
				添加资金
			</td>
			<td width = "220" bgcolor="#EEEEEE">
			<div class="input-group">
			  	<input type="text" class="form-control" name="money" aria-describedby="basic-addon1" >
				  	<span class="input-group-addon" id="basic-addon1">
				  		<i class="fa fa-jpy" aria-hidden="true"></i>
				    </span>
		    </div>
			</td>
		</tr>
		<tr>
		<td colspan="4" align="center"  bgcolor="#EEEEEE">
			<button type="button" class="btn btn-primary" onClick="check()">确认</button> 
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
function check()
{
  str=form1.money.value;
  if(isNaN(str)){//判断输入是否为数字
     form1.money.value=0;
     layer.msg('输入错误,请输入数字');form1.money.focus();return;}   
  if(form1.money.value==0){//判断输入是否为数字
  layer.msg('请输入有效金额');form1.money.focus();return;}  
  form1.submit();
  
  
}

</script>
