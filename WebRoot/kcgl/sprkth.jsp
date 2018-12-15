<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.io.*"%>
<html>
<meta charset="UTF-8">
<jsp:useBean id="rst" scope="page" class="com.infinity.dbconn.DBConn"></jsp:useBean>
<jsp:useBean id="calendar" scope="page" class="com.infinity.showtime.ShowTime"></jsp:useBean>
  <head>
  	<title>商品入库退货</title>
  	
  	<link href="../CSS/font-awesome.css" rel="stylesheet" type="text/css" />
  	<link href="../CSS/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="../layui/css/layui.css"  media="all" />
	
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
  <body>
  	<%
  		request.setCharacterEncoding("UTF-8");
  		String strSql       = "select * from tb_kucun";					//选出已经入库的商品信息
  		String rkthbh		= null;
  		String maxCount     = "select max(id) from tb_rukuth";
  		ResultSet rs        = rst.getResult(strSql);					//得到商品信息，将其显示在表单一中
  		String    jc        = "";										//商品简称
  		String    gg        = "";										//规格
  		String    bz        = "";										//包装
  		String    spid      = "";										//商品编号
  		String    spname    = "";										//商品名称
  		String    gysname   = "";										//供应商名称
  		String    cd        = "";										//产地
  		String    dw        = "";										//计量单位
  		String    theMax    = "";										//入库商品种类的数量(注意是多少种商品而不是每个商品多少个)
  	 	String    rkspname  = (String)request.getParameter("rkspname"); //获得表单一中用户所选商品的全称
  	 	String    rkStr     = "select * from tb_brand where "+			//根据商品名称查出用户所选商品
  	 						"spname='"+rkspname+"'";
  	 	ResultSet rs1       = rst.getResult(rkStr);
  	 	
  	 	if(rkspname!=null){
  	 		if(rs1.next()){
  	 		jc	    = rs1.getString("jc");
  	 		gg 		= rs1.getString("gg");
  	 		bz      = rs1.getString("bz");
  	 		gysname = rs1.getString("gysname");
  	 		cd 		= rs1.getString("cd");
  	 		dw 		= rs1.getString("dw");
  	 		spid 	= rs1.getString("ID");
  	 		spname 	= rs1.getString("spname");	 		
  	 		}
  	 	}

  	 	
  	 	
  	 	ResultSet rs2 = rst.getResult(maxCount);//获取入库记录中的当前记录量
  	 	if(rs2.next()){
  	 		theMax = theMax=rs2.getString(1);
  	 	if (theMax == null)
   			rkthbh="TH2017122210000";
   		else{		
   			
		    rkthbh="TH"+calendar.getDateString()+(Integer.parseInt(theMax.substring(10))+1);
		}
   }
  	 %>
  	 
  	 <blockquote class="layui-elem-quote">
		<span  class="word_deepgrey"> 当前位置：库存管理></span>入库退货&gt;&gt;&gt;
	 </blockquote>
	 <br>
	 
	  <fieldset class="layui-elem-field" style="width:95% ;margin-left:15">
	  <legend>入库退货商品选择及核验</legend>
	  <div class="layui-field-box">
		<form name="form1" method="post" action="sprkth.jsp" class="layui-form"  >
		<table class="table table-bordered" >
		<tr>
			<td width = "130"  bgcolor="#EEEEEE">
				退货商品
			</td>
			<td width = "178"  bgcolor="#EEEEEE">
				<div class="layui-input-inline">
					<select name="rkspname" lay-verify="required" lay-search=""  lay-filter="rkspname">
						 <option value="" selected="selected" disabled>选择退货商品</option>
		                 <%while(rs.next()){%>
							<option> <%=rs.getString("spname")%> </option>
		                 <%}%>
					</select>
		       	</div>
			</td>
			<td width = "130" bgcolor="#EEEEEE">
				入库退货编号
			</td>
			<td width = "178" bgcolor="#EEEEEE">		
				  <input type="text" class="form-control" name="rkthbh" 
				  value = "<%=rkthbh %>"
				  aria-describedby="basic-addon1" disabled>	   
			</td>
			
		</tr>
		
		<tr>
			<td width = "130" bgcolor="#EEEEEE">
				商品名称
			</td>
			<td width = "178" bgcolor="#EEEEEE">
				  <input type="text" class="form-control" name="spname" 
				  value="<%=spname%>"
				  aria-describedby="basic-addon1" disabled>
			</td>
			<td width = "130" bgcolor="#EEEEEE">
				简称
			</td>
			<td width = "178" bgcolor="#EEEEEE">
				  <input type="text" class="form-control" name="jc" 
				  value="<%=jc%>"
				  aria-describedby="basic-addon1" disabled>
			</td>
		</tr>
		
		<tr>
			<td width = "130" bgcolor="#EEEEEE">
				规格
			</td>
			<td width = "178" bgcolor="#EEEEEE">
				  <input type="text" class="form-control" name="gg" 
				  value="<%=gg%>"
				  aria-describedby="basic-addon1" disabled>
			</td>
			<td width = "130" bgcolor="#EEEEEE">
				包装
			</td>
			<td width = "178" bgcolor="#EEEEEE">
				  <input type="text" class="form-control" name="bz" 
				  value="<%=bz%>"
				  aria-describedby="basic-addon1" disabled>
			</td>
		</tr>
		
		<tr>
			<td width = "130" bgcolor="#EEEEEE">
				供应商全称
			</td>
			<td width = "178" bgcolor="#EEEEEE">
				  <input type="text" class="form-control" name="gysname" 
				  value="<%=gysname%>"
				  aria-describedby="basic-addon1" disabled>
			</td>
			<td width = "130" bgcolor="#EEEEEE">
				产地
			</td>
			<td width = "178" bgcolor="#EEEEEE">
				  <input type="text" class="form-control" name="cd" 
				  value="<%=cd%>"
				  aria-describedby="basic-addon1" disabled>
			</td>
		</tr>
		
		</table>    
		</form>
	  </div>
	  </fieldset>
	  
	  <fieldset class="layui-elem-field" style="width:95% ;margin-left:15">
	  <legend>入库退货</legend>
	  <div class="layui-field-box">
		<form name="form2" method="post" action="change/sprkthChange.jsp" class="layui-form">
		 <%
		 request.setCharacterEncoding("UTF-8");
         session.setAttribute("jc",jc); session.setAttribute("spname",spname);
         session.setAttribute("gg",gg); session.setAttribute("bz",bz);
         session.setAttribute("cd",cd); session.setAttribute("rkthbh",rkthbh);
         session.setAttribute("dw",dw); session.setAttribute("spid",spid);
         session.setAttribute("gysname",gysname);
     	 %>
		
		<table class="table table-bordered" >
		<tr>
			<td width = "130"  bgcolor="#EEEEEE">
				数量
			</td>
			<td width = "178" bgcolor="#EEEEEE">
				<div class="input-group">
				  <span class="input-group-addon" id="basic-addon1">
				  	<i class="fa fa-lock" aria-hidden="true"></i>
				  </span>
				  <input type="text" class="form-control" name="sl" aria-describedby="basic-addon1" onBlur="autoje()">
				  	<span class="input-group-addon" id="basic-addon1">
				  		<%=dw %>
				    </span>
			    </div>
			</td>
			
			<td width = "130" bgcolor="#EEEEEE">
				金额
			</td>
			<td width = "178" bgcolor="#EEEEEE">
				<input class="form-control input-sm" readonly type="text" name="je" >
			</td>
		</tr>
		
		<tr>
			<td width = "130" bgcolor="#EEEEEE">
				单价
			</td>
			<td width = "178" bgcolor="#EEEEEE">
				<div class="input-group">
				  <span class="input-group-addon" id="basic-addon1">
				  	<i class="fa fa-lock" aria-hidden="true"></i>
				  </span>
				  <input type="text" class="form-control" name="dj" aria-describedby="basic-addon1" onBlur="autoje()">
			    </div>
			</td>
			
			<td width = "130" bgcolor="#EEEEEE">
				应收
			</td>
			<td width = "178" bgcolor="#EEEEEE">
				<input class="form-control input-sm" type="text" name="ys" readonly>
			</td>
		</tr>
		
		<tr>
			<td width = "130" bgcolor="#EEEEEE">
				实收
			</td>
			<td width = "178" bgcolor="#EEEEEE">
				<div class="input-group">
				  <span class="input-group-addon" id="basic-addon1">
				  	<i class="fa fa-lock" aria-hidden="true"></i>
				  </span>
				  <input type="text" class="form-control" name="ss" aria-describedby="basic-addon1" onBlur="autoje()">
			    </div>
			</td>
			
			<td width = "130" bgcolor="#EEEEEE">
				未收
			</td>
			<td width = "178" bgcolor="#EEEEEE">
				<input class="form-control input-sm" type="text" name="ws" readonly>
			</td>
		</tr>
		
		<tr>
			<td width = "130" bgcolor="#EEEEEE">
				操作员
			</td>
			<td width = "178" bgcolor="#EEEEEE">
				<div class="input-group">
				  <span class="input-group-addon" id="basic-addon1">
				  	<i class="fa fa-lock" aria-hidden="true"></i>
				  </span>
				  <input type="text" readonly class="form-control" name="czy" aria-describedby="basic-addon1"
				  value="<%=session.getAttribute("username")%>">
			    </div>
			</td>
			
			<td width = "130" bgcolor="#EEEEEE">
				经手人
			</td>
			<td width = "178" bgcolor="#EEEEEE">
				<div class="input-group">
				  <span class="input-group-addon" id="basic-addon1">
				  	<i class="fa fa-lock" aria-hidden="true"></i>
				  </span>
				  <input type="text" class="form-control" name="jsr" aria-describedby="basic-addon1" >
			    </div>
			</td>
		</tr>
		
		<tr>
			<td width = "130" bgcolor="#EEEEEE">
				退货日期
			</td>
			<td width = "178" bgcolor="#EEEEEE">
				<input class="form-control input-sm" type="text" name="thdate" readonly 
				value="<%=calendar.getDate()%>">
			</td>
			
			<td width = "130" bgcolor="#EEEEEE">
				结算方式
			</td>
			<td width = "178" bgcolor="#EEEEEE">
				<select name="jsfs" lay-verify="required" lay-search="">
					<option value="现金" selected>现金</option>
		            <option value="预付" >预付</option>
		            <option value="支票" >支票</option>
		            <option value="挂账" >挂账</option>
				</select>
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
				<button type="reset" class="btn btn-primary">清除重写</button>
			</td>
		</tr>
		</table>    
		</form>
	
	  </div>
	  </fieldset>
  
  </body>
</html>
<script src="../layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">

layui.use(['layer', 'form'], function(){
  var layer = layui.layer
  ,form = layui.form;
  
  form.on('select(rkspname)', function(){
 	 form1.submit();
  });    
});

function autoje()
{
      str=form2.sl.value;
      if(isNaN(str)){//判断输入是否为数字
	      form2.sl.value=0;
	      layer.msg('输入错误,请输入数字');form2.sl.focus();return;}      
      str=form2.dj.value;
      if(isNaN(str)){
	      form2.dj.value=0;
	      layer.msg('输入错误,请输入数字');form2.dj.focus();return;}
	      
      str=form2.ss.value;
      if(isNaN(str)){
	      form2.ss.value=0;
	      layer.msg('输入错误,请输入数字');form2.sf.focus();return;}
	      
    //自动计算金额、应收及未收款
    form2.je.value=form2.dj.value*form2.sl.value;
    form2.ys.value=form2.je.value;
    form2.ws.value=form2.ys.value-form2.ss.value;
    
    if(form2.ss.value-form2.ys.value>0){
      form2.ss.value=0;
      form2.ws.value=form2.ys.value;
      layer.msg('实付金额不应大于应付金额!');form2.ss.focus();return;
    }
}


function check(){
	if(form2.sl.value==0){
		layer.msg('请输入入库数量');form2.sl.focus();return;
	}
	if(form2.dj.value==0){
		layer.msg('请输入入库单价');form2.dj.focus();return;
	}
	if(form2.ss.value==0){
		layer.msg('请输入实付金额');form2.ss.focus();return;
	}
	if(form2.jsr.value==0){
		layer.msg('请输入经手人姓名');form2.jsr.focus();return;
	}
	showcheck2();
}


function showcheck2()
{
	layer.open({
	   type: 1
	  ,title: false //不显示标题栏
	  ,closeBtn: false
	  ,area: '600px'
	  ,shade: 0.8
	  ,offset: '100px'
	  ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
	  ,resize: false
	  ,btn: ['确定提交', '重新填写']
	  ,btnAlign: 'c'
	  ,moveType: 1 //拖拽模式，0或者1
	  ,content: 
	  	'<div style="text-align:center; padding: 10px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">请确认商品入库退货信息</div>'
	  	+'<div style="padding:6px "> <table class="layui-table"  >'
	  	//第一行
	  	+'<tr>'
	  		+'<td id="td2">入库退货编号</td>'
	  		+'<td id="td2">'+form1.rkthbh.value+'</td>'
	  		
	  		+'<td id="td2">商品名称</td>'
	  		+'<td id="td2">'+form1.spname.value+'</td>'
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
	  		+'<td id="td2">规格</td>'
	  		+'<td id="td2">'+form1.gg.value+'</td>'
	  		
	  		+'<td id="td2">包装</td>'
	  		+'<td id="td2">'+form1.bz.value+'</td>'
	  	+'<tr>'
	  	
	  	//第四行
	  	+'<tr>'
	  		+'<td id="td2">供应商</td>'
	  		+'<td id="td2">'+form1.gysname.value+'</td>'
	  		
	  		+'<td id="td2">数量</td>'
	  		+'<td id="td2">'+form2.sl.value+'</td>'
	  	+'<tr>'
	  	
	  	//第五行
	  	+'<tr>'
	  		+'<td id="td2">单价</td>'
	  		+'<td id="td2">'+form2.dj.value+'</td>'
	  		
	  		+'<td id="td2">金额</td>'
	  		+'<td id="td2">'+form2.je.value+'</td>'
	  	+'<tr>'
	  	
	  	//第六行
	  	+'<tr>'
	  		+'<td id="td2">实收</td>'
	  		+'<td id="td2">'+form2.ss.value+'</td>'
	  		
	  		+'<td id="td2">应收</td>'
	  		+'<td id="td2">'+form2.ys.value+'</td>'
	  	+'<tr>'
	  	
	  	//第七行
	  	+'<tr>'
	  		+'<td id="td2">未收</td>'
	  		+'<td id="td2">'+form2.ws.value+'</td>'
	  		
	  		+'<td id="td2">结算方式</td>'
	  		+'<td id="td2">'+form2.jsfs.value+'</td>'
	  	+'<tr>'
	  	+'</table> </div>'
	  	
	  	
	  ,yes:function(){
	  	form2.submit();
	  	layer.closeAll();
	  }	
	});
}

    
  
</script>



