<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

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
	<span  class="word_deepgrey"> 当前位置：基础信息管理 ></span>客户信息登记 &gt;&gt;&gt;
</blockquote>
<br>

<fieldset class="layui-elem-field" style="width:95% ;margin-left:15">
  <legend>客户信息登记</legend>
  <div class="layui-field-box">
	<form name="form1" method="post" action="add/addkhinfo.jsp" >
	<table class="table table-bordered" >
	<tr>
		<td width = "130"  bgcolor="#EEEEEE">
			客户全称
		</td>
		<td width = "178" bgcolor="#EEEEEE">
			<div class="input-group">
			  <span class="input-group-addon" id="basic-addon1">
			  	<i class="fa fa-lock" aria-hidden="true"></i>
			  </span>
			  <input type="text" class="form-control" name="khqc" aria-describedby="basic-addon1">
		    </div>
		</td>
		
		<td width = "130" bgcolor="#EEEEEE">
			客户简称
		</td>
		<td width = "178" bgcolor="#EEEEEE">
			<input class="form-control input-sm" type="text" name="khjc" >
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
			  <input type="text" class="form-control" name="khdz" aria-describedby="basic-addon1">
		    </div>
		</td>
		
		<td width = "130" bgcolor="#EEEEEE">
			邮政编码
		</td>
		<td width = "178" bgcolor="#EEEEEE">
			<input class="form-control input-sm" type="text" name="khyb" >
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
			  <input type="text" class="form-control" name="khdh" aria-describedby="basic-addon1">
		    </div>
		</td>
		
		<td width = "130" bgcolor="#EEEEEE">
			传真
		</td>
		<td width = "178" bgcolor="#EEEEEE">
			<input class="form-control input-sm" type="text" name="khcz" >
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
			  <input type="text" class="form-control" name="khlxr" aria-describedby="basic-addon1">
		    </div>
		</td>
		
		<td width = "130" bgcolor="#EEEEEE">
			联系人电话
		</td>
		<td width = "178" bgcolor="#EEEEEE">
			<input class="form-control input-sm" type="text" name="khlxrdh" >
		</td>
	</tr>
	
	<tr>
		<td width = "130" bgcolor="#EEEEEE">
			会员等级
		</td>
		<td width = "178" bgcolor="#EEEEEE">
			<div class="input-group">
			  <span class="input-group-addon" id="basic-addon1">
			  	<i class="fa fa-lock" aria-hidden="true"></i>
			  </span>
			  <input type="text" class="form-control" name="khhydj" aria-describedby="basic-addon1">
		    </div>
		</td>
		
		<td width = "130" bgcolor="#EEEEEE">
			E-Mail
		</td>
		<td width = "178" bgcolor="#EEEEEE">
			<input class="form-control input-sm" type="text" name="khyx" >
		</td>
	</tr>
	
	<tr>
		<td width = "130" bgcolor="#EEEEEE">
			开户银行
		</td>
		<td width = "178" bgcolor="#EEEEEE">
			<input class="form-control input-sm" type="text" name="khkhyh" >
		</td>
		
		<td width = "130" bgcolor="#EEEEEE">
			银行账号
		</td>
		<td width = "178" bgcolor="#EEEEEE">
			<input class="form-control input-sm" type="text" name="khyhzh" >
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
  if(form1.khqc.value==0){
	layer.msg('请输入客户全称');form1.khqc.focus();return;}
  if(form1.khdz.value==0){
	layer.msg('请输入客户地址');form1.khdz.focus();return;}
  if(form1.khdh.value==0){
	layer.msg('请输入客户电话');form1.khdh.focus();return;} 
  if(form1.khlxr.value==0){
	layer.msg('请输入联系人');form1.khlxr.focus();return;}
  if(form1.khhydj.value==0){
	layer.msg('请输入客户会员等级');form1.khhydj.focus();return;}
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
	  		+'<td id="td2">客户全称</td>'
	  		+'<td id="td2">'+form1.khqc.value+'</td>'
	  		
	  		+'<td id="td2">客户简称</td>'
	  		+'<td id="td2">'+form1.khjc.value+'</td>'
	  	+'<tr>'
	  	
	  	//第二行
	  	+'<tr>'
	  		+'<td id="td2">地址</td>'
	  		+'<td id="td2">'+form1.khdz.value+'</td>'
	  		
	  		+'<td id="td2">邮政编码</td>'
	  		+'<td id="td2">'+form1.khyb.value+'</td>'
	  	+'<tr>'
	  	
	  	//第三行
	  	+'<tr>'
	  		+'<td id="td2">电话</td>'
	  		+'<td id="td2">'+form1.khdh.value+'</td>'
	  		
	  		+'<td id="td2">传真</td>'
	  		+'<td id="td2">'+form1.khcz.value+'</td>'
	  	+'<tr>'
	  	
	  	//第四行
	  	+'<tr>'
	  		+'<td id="td2">联系人</td>'
	  		+'<td id="td2">'+form1.khlxr.value+'</td>'
	  		
	  		+'<td id="td2">联系人电话</td>'
	  		+'<td id="td2">'+form1.khlxrdh.value+'</td>'
	  	+'<tr>'
	  	
	  	//第五行
	  	+'<tr>'
	  		+'<td id="td2">会员等级</td>'
	  		+'<td id="td2">'+form1.khhydj.value+'</td>'
	  		
	  		+'<td id="td2">E-MAIL</td>'
	  		+'<td id="td2">'+form1.khyx.value+'</td>'
	  	+'<tr>'
	  	
	  	//第六行
	  	+'<tr>'
	  		+'<td id="td2">开户银行</td>'
	  		+'<td id="td2">'+form1.khkhyh.value+'</td>'
	  		
	  		+'<td id="td2">银行账号</td>'
	  		+'<td id="td2">'+form1.khyhzh.value+'</td>'
	  	+'<tr>'
	  	
	  	+'</table> </div>'
	  	
	  	
	  ,yes:function(){
	  	form1.submit();
	  	layer.closeAll();
	  }	
	});
}

    
  
</script>



