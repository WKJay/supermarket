<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<jsp:useBean id="rst" scope="page" class="com.infinity.dbconn.DBConn"/>
<%@ page import="java.sql.*,java.io.*"%>
<%
   String strSql="select * from tb_supplier";
   ResultSet rs=rst.getResult(strSql);
%>
<title>客户信息</title>
  <link href="../CSS/font-awesome.css" rel="stylesheet" type="text/css" />
  <link href="../CSS/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <link rel="stylesheet" type="text/css" href="../CSS/mdialog.css">

<head>
<meta http-equiv="Content-Type" content="text/html">
<link rel="stylesheet" href="../layui/css/layui.css"  media="all">
<style type="text/css">      
     body{      
        background-image: url(../images/blank2.jpg);      
        background-size:cover;   
        margin:0;
        
     }      
     .alert{
     	margin-bottom:0px !important;
     }
     .table{
     	
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
<link href="../CSS/style.css" rel="stylesheet" type="text/css"/> 
<link rel="stylesheet" href="../layui/css/layui.css">
<body>

<blockquote class="layui-elem-quote">
	<span  class="word_deepgrey"> 当前位置：基础信息管理 ></span>商品信息登记 &gt;&gt;&gt;
</blockquote>
<br>

<fieldset class="layui-elem-field" style="width:95% ;margin-left:15">
  <legend>商品信息登记</legend>
  <div class="layui-field-box">
	<form name="form1" method="post" action="add/addspinfo.jsp" class="layui-form">
	<table class="table table-bordered" >
	<tr>
		<td width = "130"  bgcolor="#EEEEEE">
			商品名称
		</td>
		<td width = "178" bgcolor="#EEEEEE">
			<div class="input-group">
			  <span class="input-group-addon" id="basic-addon1">
			  	<i class="fa fa-lock" aria-hidden="true"></i>
			  </span>
			  <input type="text" class="form-control" name="spname" aria-describedby="basic-addon1">
		    </div>
		</td>
		
		<td width = "130" bgcolor="#EEEEEE">
			简称
		</td>
		<td width = "178" bgcolor="#EEEEEE">
			<input class="form-control input-sm" type="text" name="jc" >
		</td>
	</tr>
	
	<tr>
		<td width = "130" bgcolor="#EEEEEE">
			产地
		</td>
		<td width = "178" bgcolor="#EEEEEE">
			<div class="input-group">
			  <span class="input-group-addon" id="basic-addon1">
			  	<i class="fa fa-lock" aria-hidden="true"></i>
			  </span>
			  <input type="text" class="form-control" name="cd" aria-describedby="basic-addon1">
		    </div>
		</td>
		
		<td width = "130" bgcolor="#EEEEEE">
			批号
		</td>
		<td width = "178" bgcolor="#EEEEEE">
			<input class="form-control input-sm" type="text" name="ph" >
		</td>
	</tr>
	
	<tr>
		<td width = "130" bgcolor="#EEEEEE">
			规格
		</td>
		<td width = "178" bgcolor="#EEEEEE">
			<div class="input-group">
			  <span class="input-group-addon" id="basic-addon1">
			  	<i class="fa fa-lock" aria-hidden="true"></i>
			  </span>
			  <input type="text" class="form-control" name="gg" aria-describedby="basic-addon1">
		    </div>
		</td>
		
		<td width = "130" bgcolor="#EEEEEE">
			包装
		</td>
		<td width = "178" bgcolor="#EEEEEE">
			<input class="form-control input-sm" type="text" name="bz" >
		</td>
	</tr>
	
	<tr>
		<td width = "130" bgcolor="#EEEEEE">
			计量单位
		</td>
		<td width = "178" bgcolor="#EEEEEE">
			<div class="input-group">
			  <span class="input-group-addon" id="basic-addon1">
			  	<i class="fa fa-lock" aria-hidden="true"></i>
			  </span>
			  <input type="text" class="form-control" name="dw" aria-describedby="basic-addon1">
		    </div>
		</td>
		
		<td width = "130" bgcolor="#EEEEEE">
			批准文号
		</td>
		<td width = "178" bgcolor="#EEEEEE">
			<input class="form-control input-sm" type="text" name="pzwh" >
		</td>
	</tr>
	
	<tr>
		<td width = "130" bgcolor="#EEEEEE">
			供应商全称
		</td>
		<td width = "178" bgcolor="#EEEEEE">
			<div class="layui-input-inline">
				<select name="gysname" lay-verify="required" lay-search="">
					 <option value="">直接选择或搜索选择</option>
	                 <%while(rs.next()){%>
	                      <option> <%=rs.getString("gysname")%> </option>
	                 <%}%>
	       		 </select>
	       	</div>
		</td>
		
		<td width = "130" bgcolor="#EEEEEE">
			备注
		</td>
		<td width = "178" bgcolor="#EEEEEE">
			<input class="form-control input-sm" type="text" name="memo" >
		</td>
	</tr>
	
	<tr>
		<td colspan="4" bgcolor="#EEEEEE">
			<div class="alert alert-warning" role="alert" margin-bottom="0px !important" >
				&nbsp;&nbsp;&nbsp;
				<i class="fa fa-exclamation" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;
				 带有“<i class="fa fa-lock" aria-hidden="true"></i>”标志的内容为必填项目！
				</span>
			</div>
		</td>
	</tr>
	
	<tr>
		<td colspan="4" align="center"  bgcolor="#EEEEEE">
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

<script src="../layui/layui.js" charset="utf-8"></script>
<script>

layui.use(['layer', 'form'], function(){
  var layer = layui.layer
  ,form = layui.form;
});

function check(){
  if(form1.spname.value==0){
	layer.msg('请输入商品名称');form1.spname.focus();return;}
  if(form1.cd.value==0){
	layer.msg('请输入产地');form1.cd.focus();return;}
  if(form1.gg.value==0){
	layer.msg('请输入商品规格');form1.gg.focus();return;} 
  if(form1.dw.value==0){
	layer.msg('请输入计量单位');form1.dw.focus();return;}
  	showcheck2(); 
} 




function showcheck2()
{
	layer.open({
	   type: 1
	  ,title: false //不显示标题栏
	  ,closeBtn: false
	  ,area: 'auto'
	  ,shade: 0.8
	  ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
	  ,resize: false
	  ,btn: ['确定提交', '重新填写']
	  ,btnAlign: 'c'
	  ,moveType: 1 //拖拽模式，0或者1
	  ,content: 
	  	'<div style="text-align:center; padding: 10px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">请确认商品登记信息</div>'
	  	+'<div style="padding:6px "> <table class="layui-table"  >'
	  	//第一行
	  	+'<tr>'
	  		+'<td id="td2">商品名称</td>'
	  		+'<td id="td2">'+form1.spname.value+'</td>'
	  		
	  		+'<td id="td2">简称</td>'
	  		+'<td id="td2">'+form1.jc.value+'</td>'
	  	+'<tr>'
	  	
	  	//第二行
	  	+'<tr>'
	  		+'<td id="td2">产地</td>'
	  		+'<td id="td2">'+form1.cd.value+'</td>'
	  		
	  		+'<td id="td2">批号</td>'
	  		+'<td id="td2">'+form1.ph.value+'</td>'
	  	+'<tr>'
	  	
	  	//第三行
	  	+'<tr>'
	  		+'<td id="td2">规格</td>'
	  		+'<td id="td2">'+form1.gg.value+'</td>'
	  		
	  		+'<td id="td2">包装</td>'
	  		+'<td id="td2">'+form1.bz.value+'</td>'
	  	+'<tr>'
	  	
	  	//第四行
	  	+'<tr>'
	  		+'<td id="td2">计量单位</td>'
	  		+'<td id="td2">'+form1.dw.value+'</td>'
	  		
	  		+'<td id="td2">批准文号</td>'
	  		+'<td id="td2">'+form1.pzwh.value+'</td>'
	  	+'<tr>'
	  	
	  	//第五行
	  	+'<tr>'
	  		+'<td id="td2">供应商</td>'
	  		+'<td id="td2" colspan="3">'+form1.gysname.value+'</td>'
	  		
	  	+'<tr>'
	  	
	  	//第六行
	  	+'<tr colspan="4">'
	  		+'<td id="td2">备注</td>'
	  		+'<td id="td2" colspan="3">'+form1.memo.value+'</td>'
	  		
	  	
	  	+'</table> </div>'
	  	
	  	
	  ,yes:function(){
	  	form1.submit();
	  	layer.closeAll();
	  }	
	});
}

    
  
</script>


