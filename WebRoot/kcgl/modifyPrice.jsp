<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>
<jsp:useBean id="rst" scope="page" class="com.infinity.dbconn.DBConn"/>
<html>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<title>价格调整</title>
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

<%
   request.setCharacterEncoding("UTF-8");//对字符串统一编码解决表单提交中的中文乱码问题
   String spbh="",cd="",spname="",jc="",gg="",bz="",sl="",je="",dj="";
   String ydj="";
   String tzspname=request.getParameter("tzspname");
   String strSql="select * from tb_kucun ";
   String strSpname="select * from tb_kucun where spname='"+tzspname+"'";
   ResultSet rs=rst.getResult(strSql);
   ResultSet rsSpname=rst.getResult(strSpname);
   if(rsSpname.next()){
     spbh=rsSpname.getString("id"); cd=rsSpname.getString("cd");
     jc=rsSpname.getString("jc");   gg=rsSpname.getString("gg");
     bz=rsSpname.getString("bz");   sl=rsSpname.getString("kcsl");
     je=rsSpname.getString("kcje");   dj=rsSpname.getString("dj");
     ydj=rsSpname.getString("dj");
     spname=rsSpname.getString("spname");
   }
%>

<blockquote class="layui-elem-quote">
	<span  class="word_deepgrey"> 当前位置：库存管理 ></span>价格调整 &gt;&gt;&gt;
</blockquote>
<br>

<fieldset class="layui-elem-field" style="width:95% ;margin-left:15">
  <legend>价格调整</legend>
  <div class="layui-field-box">
		<form name="form1" method="post" action="modifyPrice.jsp" class="layui-form"  >
		<table class="table table-bordered" >
		<tr>
			<td width = "130"  bgcolor="#EEEEEE">
				入库商品
			</td>
			<td width = "178"  bgcolor="#EEEEEE">
				<div class="layui-input-inline">
					<select name="tzspname" lay-verify="required" lay-search=""  lay-filter="tzspname">
						 <option value="" selected="selected" disabled>选择商品名称</option>
		                 <%while(rs.next()){%>
							<option> <%=rs.getString("spname")%> </option>
		                 <%}%>
					</select>
		       	</div>
			</td>
			<td width = "130" bgcolor="#EEEEEE">
				商品编号
			</td>
			<td width = "178" bgcolor="#EEEEEE">		
				  <input type="text" class="form-control" name="spbh" 
				  value = "<%=spbh %>"
				  aria-describedby="basic-addon1" readonly>	   
			</td>
			
		</tr>
		
		<tr>
			<td width = "130" bgcolor="#EEEEEE">
				商品全称
			</td>
			<td width = "178" bgcolor="#EEEEEE">
				  <input type="text" class="form-control" name="spname" 
				  value="<%=spname%>"
				  aria-describedby="basic-addon1" readonly>
			</td>
			<td width = "130" bgcolor="#EEEEEE">
				产地
			</td>
			<td width = "178" bgcolor="#EEEEEE">
				  <input type="text" class="form-control" name="cd" 
				  value="<%=cd%>"
				  aria-describedby="basic-addon1" readonly>
			</td>
		</tr>
		
		<tr>
			<td width = "130" bgcolor="#EEEEEE">
				简称
			</td>
			<td width = "178" bgcolor="#EEEEEE">
				  <input type="text" class="form-control" name="jc" 
				  value="<%=jc%>"
				  aria-describedby="basic-addon1" readonly>
			</td>
			<td width = "130" bgcolor="#EEEEEE">
				包装
			</td>
			<td width = "178" bgcolor="#EEEEEE">
				  <input type="text" class="form-control" name="bz" 
				  value="<%=bz%>"
				  aria-describedby="basic-addon1" readonly>
			</td>
		</tr>
		
		<tr>
			<td width = "130" bgcolor="#EEEEEE">
				规格
			</td>
			<td width = "178" bgcolor="#EEEEEE">
				  <input type="text" class="form-control" name="gg" 
				  value="<%=gg%>"
				  aria-describedby="basic-addon1" readonly>
			</td>
			<td width = "130" bgcolor="#EEEEEE">
				库存数量
			</td>
			<td width = "178" bgcolor="#EEEEEE">
				  <input type="text" class="form-control" name="kcsl" 
				  value="<%=sl%>"
				  aria-describedby="basic-addon1" readonly>
			</td>
		</tr>
		
		<tr>
			<td width = "130" colspan="2" bgcolor="#EEEEEE">
				单价调整
			</td>
			<td width = "178" bgcolor="#EEEEEE" colspan="2">
				  <input type="text" class="form-control" name="dj" 
				  value="<%=dj%>" onBlur="autoje()"
				  aria-describedby="basic-addon1">
			</td>
		</tr>
		
		<tr>
			<td width = "130" colspan="2" bgcolor="#EEEEEE">
				改后库存额度
			</td>
			<td width = "178" bgcolor="#EEEEEE" colspan="2">
				  <input type="text" class="form-control" name="kcje" 
				  value="<%=je%>" readonly
				  aria-describedby="basic-addon1">
			</td>
		</tr>
		
		<tr>
			<td colspan="4" align="center"  bgcolor="#EEEEEE">
				<button type="button" class="btn btn-primary" onClick="check()">提交信息</button> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-primary">清除重写</button>
			</td>
		</tr>
		
		</table>    
		</form>
	  </div>
	  
  <form name="form2" action="change/jgChange.jsp" method="POST">
  <input type="hidden" name="hid">
  <input type="hidden" name="hkcje">
  <input type="hidden" name="hdj">
  <input type="hidden" name="ydj" value="<%=ydj%>">
  </form>

</body>
</html>

<script src="../layui/layui.js" charset="utf-8"></script>
<script>

layui.use(['layer', 'form'], function(){
  var layer = layui.layer
  ,form = layui.form;
  
  	 form.on('select(tzspname)', function(){
 	 form1.submit();
  });    
  
});

function check(){
  	form2.hid.value=form1.spbh.value;
    form2.hkcje.value=form1.kcje.value;
    form2.hdj.value=form1.dj.value; 

	if(form1.dj.value==0){
      layer.msg('请输入单价!');form1.dj.focus();return}
  	showcheck2(); 
	} 


function autoje(){
    if(isNaN(form1.dj.value)){
      layer.msg('请输入数字');form1.dj.value=0;form1.dj.focus();return}
      form1.kcje.value=form1.dj.value*form1.kcsl.value;
  }

function showcheck2()
{
	layer.open({
	   type: 1
	  ,title: false //不显示标题栏
	  ,closeBtn: false
	  ,area: '500px'
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
	  		+'<td id="td2">商品名称</td>'
	  		+'<td id="td2">'+form1.spname.value+'</td>'
	  		
	  		+'<td id="td2">商品编号</td>'
	  		+'<td id="td2">'+form1.spbh.value+'</td>'
	  	+'<tr>'
	  	
	  	//第二行
	  	+'<tr>'
	  		+'<td id="td2">产地</td>'
	  		+'<td id="td2">'+form1.cd.value+'</td>'
	  		
	  		+'<td id="td2">简称</td>'
	  		+'<td id="td2">'+form1.jc.value+'</td>'
	  	+'<tr>'
	  	
	  	//第三行
	  	+'<tr>'
	  		+'<td id="td2">包装</td>'
	  		+'<td id="td2">'+form1.bz.value+'</td>'
	  		
	  		+'<td id="td2">规格</td>'
	  		+'<td id="td2">'+form1.gg.value+'</td>'
	  	+'<tr>'
	  	
	  	//第四行
	  	+'<tr>'
	  		+'<td id="td2">原单价</td>'
	  		+'<td id="td2">'+form2.ydj.value+'</td>'
	  		
	  		+'<td id="td2">修改后单价</td>'
	  		+'<td id="td2">'+form1.dj.value+'</td>'
	  	+'<tr>'
	  	
	  	
	  	+'</table> </div>'
	  	
	  	
	  ,yes:function(){
	  	form2.submit();
	  	layer.closeAll();
	  }	
	});
}
 
</script>



