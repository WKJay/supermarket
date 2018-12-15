<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<title>供应商信息</title>																
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
	<span  class="word_deepgrey"> 当前位置：基础信息管理 ></span>供应商信息登记 &gt;&gt;&gt;
</blockquote>
<br>

<fieldset class="layui-elem-field" style="width:95% ;margin-left:15">
  <legend>供应商信息登记</legend>
  <div class="layui-field-box">
	<form name="form1" method="post" action="add/addgysinfo.jsp" >
	<table class="table table-bordered" >
	<tr>
		<td width = "130"  bgcolor="#EEEEEE">
			供应商全称
		</td>
		<td width = "178" bgcolor="#EEEEEE">
			<div class="input-group">
			  <span class="input-group-addon" id="basic-addon1">
			  	<i class="fa fa-lock" aria-hidden="true"></i>
			  </span>
			  <input type="text" class="form-control" name="gysname" aria-describedby="basic-addon1">
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
			地址
		</td>
		<td width = "178" bgcolor="#EEEEEE">
			<div class="input-group">
			  <span class="input-group-addon" id="basic-addon1">
			  	<i class="fa fa-lock" aria-hidden="true"></i>
			  </span>
			  <input type="text" class="form-control" name="address" aria-describedby="basic-addon1">
		    </div>
		</td>
		
		<td width = "130" bgcolor="#EEEEEE">
			邮政编码
		</td>
		<td width = "178" bgcolor="#EEEEEE">
			<input class="form-control input-sm" type="text" name="postcode" >
		</td>
	</tr>
	
	<tr>
		<td width = "130" bgcolor="#EEEEEE">
			电话
		</td>
		<td width = "178" bgcolor="#EEEEEE">
			<div class="input-group">
			  <span class="input-group-addon" id="basic-addon1">
			  	<i class="fa fa-lock" aria-hidden="true"></i>
			  </span>
			  <input type="text" class="form-control" name="tel" aria-describedby="basic-addon1">
		    </div>
		</td>
		
		<td width = "130" bgcolor="#EEEEEE">
			传真
		</td>
		<td width = "178" bgcolor="#EEEEEE">
			<input class="form-control input-sm" type="text" name="fax" >
		</td>
	</tr>
	
	<tr>
		<td width = "130" bgcolor="#EEEEEE">
			联系人
		</td>
		<td width = "178" bgcolor="#EEEEEE">
			<div class="input-group">
			  <span class="input-group-addon" id="basic-addon1">
			  	<i class="fa fa-lock" aria-hidden="true"></i>
			  </span>
			  <input type="text" class="form-control" name="lxr" aria-describedby="basic-addon1">
		    </div>
		</td>
		
		<td width = "130" bgcolor="#EEEEEE">
			联系人电话
		</td>
		<td width = "178" bgcolor="#EEEEEE">
			<input class="form-control input-sm" type="text" name="lxrtel" >
		</td>
	</tr>
	
	<tr>
		<td width = "130" bgcolor="#EEEEEE">
			电子邮箱
		</td>
		<td width = "178" bgcolor="#EEEEEE">
			<input class="form-control input-sm" type="text" name="email" >
		</td>
		
		<td width = "130" bgcolor="#EEEEEE">
			开户银行
		</td>
		<td width = "178" bgcolor="#EEEEEE">
			<input class="form-control input-sm" type="text" name="khyh" >
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
  if(form1.gysname.value==0){
	layer.msg('请输入供应商全称');form1.gysname.focus();return;}
  if(form1.address.value==0){
	layer.msg('请输入地址');form1.address.focus();return;}
  if(form1.tel.value==0){
	layer.msg('请输入电话');form1.tel.focus();return;} 
  if(form1.lxr.value==0){
	layer.msg('请输入联系人');form1.lxr.focus();return;}
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
	  	'<div style="text-align:center; padding: 10px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">请确认客户登记信息</div>'
	  	+'<div style="padding:6px "> <table class="layui-table" lay-even="" lay-skin="nob">'
	  	//第一行
	  	+'<tr>'
	  		+'<td id="td2">供应商全称</td>'
	  		+'<td id="td2">'+form1.gysname.value+'</td>'
	  		
	  		+'<td id="td2">简称</td>'
	  		+'<td id="td2">'+form1.jc.value+'</td>'
	  	+'<tr>'
	  	
	  	//第二行
	  	+'<tr>'
	  		+'<td id="td2">地址</td>'
	  		+'<td id="td2">'+form1.address.value+'</td>'
	  		
	  		+'<td id="td2">邮政编码</td>'
	  		+'<td id="td2">'+form1.postcode.value+'</td>'
	  	+'<tr>'
	  	
	  	//第三行
	  	+'<tr>'
	  		+'<td id="td2">电话</td>'
	  		+'<td id="td2">'+form1.tel.value+'</td>'
	  		
	  		+'<td id="td2">传真</td>'
	  		+'<td id="td2">'+form1.fax.value+'</td>'
	  	+'<tr>'
	  	
	  	//第四行
	  	+'<tr>'
	  		+'<td id="td2">联系人</td>'
	  		+'<td id="td2">'+form1.lxr.value+'</td>'
	  		
	  		+'<td id="td2">联系人电话</td>'
	  		+'<td id="td2">'+form1.lxrtel.value+'</td>'
	  	+'<tr>'
	  	
	  	//第五行
	  	+'<tr>'
	  		+'<td id="td2">电子邮箱</td>'
	  		+'<td id="td2">'+form1.email.value+'</td>'
	  		
	  		+'<td id="td2">开户银行</td>'
	  		+'<td id="td2">'+form1.khyh.value+'</td>'
	  	+'<tr>'
	  	
	  	
	  	+'</table> </div>'
	  	
	  	
	  ,yes:function(){
	  	form1.submit();
	  	layer.closeAll();
	  }	
	});
}

    
  
</script>



