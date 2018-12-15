<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.io.*,java.sql.*"%>
<jsp:useBean id="rst" scope="page" class="com.infinity.dbconn.DBConn"/>
<jsp:useBean id="trans" scope="page" class="com.infinity.chinese.ToChinese"/>
<html>
  <title>用户基本设置</title>
  <link href="../CSS/font-awesome.css" rel="stylesheet" type="text/css" />
  <link href="../CSS/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <link rel="stylesheet" type="text/css" href="../CSS/mdialog.css">
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
  
  <link rel="stylesheet" href="../layui/css/layui.css"  media="all">
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
  <script src="../layui/layui.js" charset="utf-8"></script>
  <body>
<%
    request.setCharacterEncoding("UTF-8");//对字符串统一编码解决表单提交中的中文乱玛问题
   //防止非法用户绕过登录页面，直接进入系统内部
   boolean isLog=false;
   try{
     //获得用户是否登录的信息
     isLog=((String)session.getAttribute("isLog")).equals("1");
     }catch(Exception e){}
   if(!isLog){
     out.flush();
     out.println("<script language='javascript'>");
     out.println(" layui.use(['layer', 'form'], function(){var layer = layui.layer,form = layui.form;layer.msg('登记成功');});");
     out.println("window.setTimeout(function(){window.location.href='../index.jsp';},600);");
     }
%>
<blockquote class="layui-elem-quote">
	<span  class="word_deepgrey"> 当前位置：系统设置></span>修改密码 &gt;&gt;&gt;
</blockquote>
<br>

<fieldset class="layui-elem-field" style="width:95% ;margin-left:15" >
  <legend>修改密码</legend>
  <div class="layui-field-box" >
	<form name="form1" method="post" action="usermodify.jsp" id="form1">
	<table class="table table-bordered" >
	<tr>
		<td width = "130"  bgcolor="#EEEEEE">
			用户名
		</td>
		<td width = "270" bgcolor="#EEEEEE">
			<div class="input-group">
			  <span class="input-group-addon" id="basic-addon1">
			  	<i class="fa fa-lock" aria-hidden="true"></i>
			  </span>
			  <input type="text" class="form-control" name="username" aria-describedby="basic-addon1"
			  value="<%=session.getAttribute("username")%>" readonly>
		    </div>
		</td>
	</tr>
	
	<tr>
		<td width = "130" bgcolor="#EEEEEE">
			原密码
		</td>
		<td width = "270" bgcolor="#EEEEEE">
			<div class="input-group">
			  <span class="input-group-addon" id="basic-addon1">
			  	<i class="fa fa-lock" aria-hidden="true"></i>
			  </span>
			  <input type="password" class="form-control" name="password" aria-describedby="basic-addon1">
		    </div>
		</td>
	</tr>
	
	<tr>
		<td width = "130" bgcolor="#EEEEEE">
			新密码
		</td>
		<td width = "270" bgcolor="#EEEEEE">
			<div class="input-group">
			  <span class="input-group-addon" id="basic-addon1">
			  	<i class="fa fa-lock" aria-hidden="true"></i>
			  </span>
			  <input type="password" class="form-control" name="newpw1" aria-describedby="basic-addon1">
		    </div>
		</td>
	</tr>
	
	<tr>
		<td width = "130" bgcolor="#EEEEEE">
			确认新密码
		</td>
		<td width = "270" bgcolor="#EEEEEE">
			<div class="input-group">
			  <span class="input-group-addon" id="basic-addon1">
			  	<i class="fa fa-lock" aria-hidden="true"></i>
			  </span>
			  <input type="password" class="form-control" name="newpw2" aria-describedby="basic-addon1">
		    </div>
		</td>
	</tr>
	
	<tr>
		<td colspan="2" bgcolor="#EEEEEE">
			<div class="alert alert-warning" role="alert" margin-bottom="0px !important" >
				&nbsp;&nbsp;&nbsp;
				<i class="fa fa-exclamation" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;
				 带有“<i class="fa fa-lock" aria-hidden="true"></i>”标志的内容为必填项目！
				</span>
			</div>
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center"  bgcolor="#EEEEEE">
			<button type="button" class="btn btn-primary" onClick="check()">提交信息</button> 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="reset" class="btn btn-primary"  >清除重写</button>
		</td>
	</tr>
	</table>    
	</form>

  </div>


  </body>
</html>
<script language="javascript">
layui.use(['layer', 'form'], function(){
  var layer = layui.layer
  ,form = layui.form;
});

function check()
{
  if(form1.password.value==0){
    layer.msg("请输入密码");form1.password.focus();return;
  }
  if(form1.newpw1.value==0){
    layer.msg("请输入新密码");form1.newpw1.focus();return;
  }
  if(form1.newpw2.value==0){
    layer.msg("请再次输入新密码");form1.newpw2.focus();return;
  }
  if(form1.newpw1.value!=form1.newpw2.value){
    layer.msg("两次新密码输入不一致,请从新输入");
    form1.newpw1.value="";
    form1.newpw2.value="";
    form1.newpw1.focus();
    return;
  }
  form1.submit();
}

</script>







