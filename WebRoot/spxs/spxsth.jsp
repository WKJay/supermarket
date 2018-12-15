<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<%@ page import="java.sql.*,java.io.*"%>
<jsp:useBean id="rst" scope="page" class="com.infinity.dbconn.DBConn"/>
<jsp:useBean id="calendar" scope="page" class="com.infinity.showtime.ShowTime"/>
<html>
<title>商品销售信息</title>

<link href="../CSS/font-awesome.css" rel="stylesheet" type="text/css" />
<link href="../CSS/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="../layui/css/layui.css"  media="all" />
<link href="../CSS/style.css" rel="stylesheet" type="text/css">
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
<body>
<%
   request.setCharacterEncoding("UTF-8");
   String strSql="select * from tb_sell";
   //String strKh="select * from tb_customer";
   String maxCount="select max(id) from tb_sellth";
   String xsthph = null;
   ResultSet rs=rst.getResult(strSql);//在下拉列表中显示销售商品名称
   //ResultSet rsKh=rst.getResult(strKh);

   String jc=""; String gg="";String bz="";String spid="";String spname="";
   String khqc="";
   String dj="";String cd="";String dw="";String xssl="";String theMax="";
   String xsphid=(String)request.getParameter("xsphid");//获得用户所选商品的简称
   String xsthStr="select * from tb_sell where ID ='"+xsphid+"'";
   ResultSet rs1=rst.getResult(xsthStr);//根据简称查询出用户所选商品

   if(rs1.next()){
     jc=rs1.getString("jc");gg=rs1.getString("gg");bz=rs1.getString("bz");
     cd=rs1.getString("cd");dw=rs1.getString("dw");xssl=rs1.getString("sl");
     xsphid=rs1.getString("ID");spname=rs1.getString("spname");
     dj=rs1.getString("dj");khqc = rs1.getString("khname");
     spid=rs1.getString("spid");
   }
   ResultSet rs2=rst.getResult(maxCount);//获得tb_ruku表中字段"id"最大的记录
   if(rs2.next()){
     theMax=rs2.getString(1);
   }
   //将最大的字段加1
   if (theMax == null){
   	  xsthph = "XSTH20171222100";
   }else{
  	  xsthph="XSTH"+calendar.getDateString()+(Integer.parseInt(theMax.substring(10))+1);
   }
%>
 	 <blockquote class="layui-elem-quote">
		<span  class="word_deepgrey"> 当前位置：销售管理 ></span>商品销售 &gt;&gt;&gt;
	 </blockquote>
	 <br>
	 
	  <fieldset class="layui-elem-field" style="width:95% ;margin-left:15">
	  <legend>退货商品选择及核验</legend>
	  <div class="layui-field-box">
		<form name="form1" method="post" action="spxsth.jsp" class="layui-form"  >
		<table class="table table-bordered" >
		<tr>
			<td width = "130"  bgcolor="#EEEEEE">
				销售票号
			</td>
			<td width = "178"  bgcolor="#EEEEEE">
				<div class="layui-input-inline">
					<select name="xsphid" lay-verify="required" lay-search=""  lay-filter="xsphid">
						 <option value="" selected="selected" disabled>选择票号</option>
		                 <%while(rs.next()){%>
							<option> <%=rs.getString("ID")%> </option>
		                 <%}%>
					</select>
		       	</div>
			</td>
			<td width = "130" bgcolor="#EEEEEE">
				退货票号
			</td>
			<td width = "178" bgcolor="#EEEEEE">		
				  <input type="text" class="form-control" name="xsthph" 
				  value = "<%=xsthph %>"
				  aria-describedby="basic-addon1" readonly>	   
			</td>
			
		</tr>
		
		<tr>
			<td width = "130" bgcolor="#EEEEEE">
				商品名称
			</td>
			<td width = "178" bgcolor="#EEEEEE">
				  <input type="text" class="form-control" name="spname" 
				  value="<%=spname%>"
				  aria-describedby="basic-addon1" readonly>
			</td>
			<td width = "130" bgcolor="#EEEEEE">
				简称
			</td>
			<td width = "178" bgcolor="#EEEEEE">
				  <input type="text" class="form-control" name="jc" 
				  value="<%=jc%>"
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
				产地
			</td>
			<td width = "178" bgcolor="#EEEEEE">
				  <input type="text" class="form-control" name="cd" 
				  value="<%=cd%>"
				  aria-describedby="basic-addon1" readonly>
			</td>
			<td width = "130" bgcolor="#EEEEEE">
				进价
			</td>
			<td width = "178" bgcolor="#EEEEEE">
				  <input type="text" class="form-control" name="dj" 
				  value="<%=dj%>"
				  aria-describedby="basic-addon1" readonly>
			</td>
		</tr>
		
		</table>    
		</form>
	  </div>
	  </fieldset>
	  
	  <fieldset class="layui-elem-field" style="width:95% ;margin-left:15">
	  <legend>商品退货</legend>
	  <div class="layui-field-box">
		<form name="form2" method="post" action="change/xsthChange.jsp" class="layui-form">
		 <%
         session.setAttribute("jc",jc); session.setAttribute("spname",spname);
         session.setAttribute("gg",gg); session.setAttribute("bz",bz);
         session.setAttribute("cd",cd); session.setAttribute("xsthph",xsthph);
         session.setAttribute("dw",dw); session.setAttribute("spid",spid);
         session.setAttribute("dj",dj); 
     	 %>
		
		<table class="table table-bordered" >
		<tr>
			<td width = "130"  bgcolor="#EEEEEE">
				客户全称
			</td>
			<td width = "178" bgcolor="#EEEEEE">
				<input class="form-control input-sm" readonly type="text" name="khqc" value=<%=khqc %>>
			</td>
			
			<td width = "130" bgcolor="#EEEEEE">
				销售数量
			</td>
			<td width = "178" bgcolor="#EEEEEE">
				<input class="form-control input-sm" readonly type="text" name="xssl" value=<%=xssl %>>
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
				  <input type="text" class="form-control" name="dj" value="<%=dj %>" aria-describedby="basic-addon1" onBlur="autoje()">
			    </div>
			</td>
			
			<td width = "130" bgcolor="#EEEEEE">
				金额
			</td>
			<td width = "178" bgcolor="#EEEEEE">
				<input class="form-control input-sm" type="text" name="je" readonly>
			</td>
		</tr>
		
		<tr>
			<td width = "130" bgcolor="#EEEEEE">
				退货数量
			</td>
			<td width = "178" bgcolor="#EEEEEE">
				<div class="input-group">
				  <span class="input-group-addon" id="basic-addon1">
				  	<i class="fa fa-lock" aria-hidden="true"></i>
				  </span>
				  <input type="text" class="form-control" name="thsl" aria-describedby="basic-addon1" onBlur="autoje()">
				  	<span class="input-group-addon" id="basic-addon1">
				  		<%=dw %>
				    </span>
			    </div>
			</td>
			
			<td width = "130" bgcolor="#EEEEEE">
				应退
			</td>
			<td width = "178" bgcolor="#EEEEEE">
				<input class="form-control input-sm" type="text" name="yt" readonly>
			</td>
		</tr>
		
		<tr>
			<td width = "130" bgcolor="#EEEEEE">
				实退
			</td>
			<td width = "178" bgcolor="#EEEEEE">
				<div class="input-group">
				  <span class="input-group-addon" id="basic-addon1">
				  	<i class="fa fa-lock" aria-hidden="true"></i>
				  </span>
				  <input type="text" class="form-control" name="st" aria-describedby="basic-addon1" onBlur="autoje()">
				</div>
			</td>
			<td width = "130" bgcolor="#EEEEEE">
				未退
			</td>
			<td width = "178" bgcolor="#EEEEEE">
				<input class="form-control input-sm" type="text" name="wt" readonly>
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
				<input class="form-control input-sm" type="text" name="xsthdate" readonly 
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
  
  form.on('select(xsphid)', function(){
 	 form1.submit();
  });    
});

function autoje()
{
      str=form2.dj.value;
      if(isNaN(str)){//判断输入是否为数字
	      form2.dj.value=0;
	      layer.msg('输入错误,请输入数字');form2.dj.focus();return;}      
      str=form2.thsl.value;
      if(isNaN(str)){
	      form2.thsl.value=0;
	      layer.msg('输入错误,请输入数字');form2.thsl.focus();return;}    
      str=form2.st.value;
      if(isNaN(str)){
	      form2.st.value=0;
	      layer.msg('输入错误,请输入数字');form2.st.focus();return;}
	      
    //自动计算金额、应收及未收款
    form2.je.value=form2.dj.value*form2.thsl.value;
    form2.yt.value=form2.je.value;
    form2.wt.value=form2.yt.value-form2.st.value;
    
    if(form2.st.value-form2.yt.value>0){
      form2.st.value=0;
      form2.wt.value=form2.yt.value;
      layer.msg("实收金额不应大于应收金额!");form2.st.focus();return;
    }
}


function check(){
  if(form2.thsl.value==0){
    layer.msg("请输入数量");form2.thsl.focus();return;}
  if(form2.dj.value==0){
    layer.msg("请输入单价");form2.dj.focus();return;}
  if(form2.st.value==0){
    layer.msg("请输入实退");form2.ss.focus();return;}
  if(form2.jsr.value==""){
    layer.msg("请输入经手人姓名");form2.jsr.focus();return;}
  if(form2.xssl.value-form2.thsl.value<0){
    layer.msg("退货数量大于销售数量，请核实！");
    form2.thsl.value=0;
    form2.thsl.focus();return;
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
	  	'<div style="text-align:center; padding: 10px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">请确认商品退货信息</div>'
	  	+'<div style="padding:6px "> <table class="layui-table"  >'
	  	//第一行
	  	+'<tr>'
	  		+'<td id="td2">商品名称</td>'
	  		+'<td id="td2">'+form1.spname.value+'</td>'
	  		
	  		+'<td id="td2">顾客名称</td>'
	  		+'<td id="td2">'+form2.khqc.value+'</td>'
	  	+'<tr>'
	  	
	  	//第二行
	  	+'<tr>'
	  		+'<td id="td2">单价</td>'
	  		+'<td id="td2">'+form2.dj.value+'</td>'
	  		
	  		+'<td id="td2">数量</td>'
	  		+'<td id="td2">'+form2.xssl.value+'</td>'
	  	+'<tr>'
	  	
	  	//第三行
	  	+'<tr>'
	  		+'<td id="td2">实退</td>'
	  		+'<td id="td2">'+form2.st.value+'</td>'
	  		
	  		+'<td id="td2">应退</td>'
	  		+'<td id="td2">'+form2.yt.value+'</td>'
	  	+'<tr>'
	  	
	  	//第四行
	  	+'<tr>'
	  		+'<td id="td2">未退</td>'
	  		+'<td id="td2">'+form2.wt.value+'</td>'
	  		
	  		+'<td id="td2">经手人</td>'
	  		+'<td id="td2">'+form2.jsr.value+'</td>'
	  	+'<tr>'
	  	
	  	+'</table> </div>'
	  	
	  	
	  ,yes:function(){
	  	form2.submit();
	  	layer.closeAll();
	  }	
	});
}
</script>



