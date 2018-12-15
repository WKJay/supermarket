<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="rst" scope="page" class="com.infinity.dbconn.DBConn"/>
<jsp:useBean id="trans" scope="page" class="com.infinity.chinese.ToChinese"/>
<jsp:useBean id="calendar" scope="page" class="com.infinity.showtime.ShowTime"></jsp:useBean>
<html>
<head>
  <title>新职工登记</title>
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
  	 out.println("window.setTimeout(function(){window.top.location.href='../index.jsp';},600);");
   	 out.println("</script>");
     }
     String maxCount     = "select max(zgbh) from tb_user";
     ResultSet rs = rst.getResult(maxCount);
     String theMax="";
     String zgbh = "";
 	 if(rs.next()){
 	 	 theMax=rs.getString(1);
 	 if (theMax == null)
  		zgbh="ZG"+calendar.getDateString()+"10";
  	 else{			
	    zgbh="ZG"+calendar.getDateString()+(Integer.parseInt(theMax.substring(10))+1);
	 }
	 }
%>
<blockquote class="layui-elem-quote">
	<span  class="word_deepgrey"> 当前位置：系统设置></span>新职工登记 &gt;&gt;&gt;
</blockquote>
<br>

<fieldset class="layui-elem-field" style="width:95% ;margin-left:15" >
  <legend>新职工登记</legend>
  <div class="layui-field-box" >
	<form name="form1" method="post" action="updateUser.jsp" id="form1">
	<table class="table table-bordered" >
	<tr>
		<td width = "130"  bgcolor="#EEEEEE">
			职工编号
		</td>
		<td width = "178" bgcolor="#EEEEEE">
		  <input type="text" class="form-control" name="zgbh" value = "<%=zgbh %>"  
		  aria-describedby="basic-addon1"  readonly >
		</td>
		
		<td width = "130" bgcolor="#EEEEEE">
			登记日期
		</td>
		<td width = "178" bgcolor="#EEEEEE">
				<input class="form-control input-sm" type="text" name="djrq" readonly 
				value="<%=calendar.getDate()%>">
		</td>
	</tr>
	
	<tr>
		<td width = "130"  bgcolor="#EEEEEE">
			姓名
		</td>
		<td width = "178" bgcolor="#EEEEEE">
			<div class="input-group">
			  <span class="input-group-addon" id="basic-addon1">
			  	<i class="fa fa-lock" aria-hidden="true"></i>
			  </span>
			  <input type="text" class="form-control" name="zgxm" aria-describedby="basic-addon1">
		    </div>
		</td>
		
		<td width = "130" bgcolor="#EEEEEE">
			性别
		</td>
		<td width = "178" bgcolor="#EEEEEE">
			<div class="input-group">
			  <span class="input-group-addon" id="basic-addon1">
			  	<i class="fa fa-lock" aria-hidden="true"></i>
			  </span>
			  <input type="text" class="form-control" name="zgxb" aria-describedby="basic-addon1">
		    </div>
		</td>
	</tr>
	<tr>
		<td width = "130"  bgcolor="#EEEEEE">
			联系电话
		</td>
		<td width = "178" bgcolor="#EEEEEE">
			<div class="input-group">
			  <span class="input-group-addon" id="basic-addon1">
			  	<i class="fa fa-lock" aria-hidden="true"></i>
			  </span>
			  <input type="text" class="form-control" name="lxdh" aria-describedby="basic-addon1">
		    </div>
		</td>
		<td width = "130"  bgcolor="#EEEEEE">
			住址
		</td>
		<td width = "178" bgcolor="#EEEEEE">
		  <input type="text" class="form-control" name="zgzz" aria-describedby="basic-addon1">
		</td>
	</tr>
	
	<tr>
		<td width = "130"  bgcolor="#EEEEEE">
			出生日期
		</td>
		<td width = "178" bgcolor="#EEEEEE">
			<div class="input-group">
			  <span class="input-group-addon" id="basic-addon1">
			  	<i class="fa fa-lock" aria-hidden="true"></i>
			  </span>
			  <input type="text" class="form-control" name="csrq" aria-describedby="basic-addon1">
		    </div>
		</td>
		<td width = "130"  bgcolor="#EEEEEE">
			电子邮箱
		</td>
		<td width = "178" bgcolor="#EEEEEE">
		  <input type="text" class="form-control" name="dzyx" aria-describedby="basic-addon1">
		</td>
	</tr>
	
		<tr>
		<td width = "130"  bgcolor="#EEEEEE">
			用户名
		</td>
		<td width = "178" bgcolor="#EEEEEE">
			<div class="input-group">
			  <span class="input-group-addon" id="basic-addon1">
			  	<i class="fa fa-lock" aria-hidden="true"></i>
			  </span>
			  <input type="text" class="form-control" name="username" aria-describedby="basic-addon1">
		    </div>
		</td>
		<td width = "130"  bgcolor="#EEEEEE">
			登录密码
		</td>
		<td width = "178" bgcolor="#EEEEEE">
		  <input type="password" class="form-control" name="password" aria-describedby="basic-addon1">
		</td>
	</tr>
	
	<tr>
		<td colspan="4" bgcolor="#EEEEEE">
			<div class="alert alert-warning" role="alert" margin-bottom="0px !important" >
				&nbsp;&nbsp;&nbsp;
				<i class="fa fa-exclamation" aria-hidden="true"></i>
				&nbsp;&nbsp;&nbsp;&nbsp;
				 带有“<i class="fa fa-lock" aria-hidden="true"></i>”标志的内容为必填项目！
				 <br>&nbsp;&nbsp;&nbsp;
				 <i class="fa fa-exclamation" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户名和密码作为登录系统的账号密码使用，
				 <br>&nbsp;&nbsp;&nbsp;
				<i class="fa fa-exclamation" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户名一旦设置，无法更改，请确认后再提交！
				 <br>&nbsp;&nbsp;&nbsp;
				<i class="fa fa-exclamation" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日期格式：XXXX-XX-XX   （年-月-日）
				</span>
			</div>
		</td>
	</tr>
	
	<tr>
		<td colspan="4" align="center"  bgcolor="#EEEEEE">
			<button type="button" class="btn btn-primary" onClick="check()">提交信息</button> 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn btn-info" onClick="exit()" >退出登录</button>
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
  if(form1.username.value==0){
    layer.msg("请输入用户名");form1.username.focus();return;
  }
  if(form1.password.value==0){
    layer.msg("请输入密码");form1.password.focus();return;
  }
  if(form1.zgxm.value==0){
    layer.msg("请输入职工姓名");form1.zgxm.focus();return;
  }
  if(form1.zgxb.value!='男'&&form1.zgxb.value!='女'){
    layer.msg("请输入职工性别，男或女");form1.zgxb.focus();return;
  }
  if(form1.lxdh.value==0){
    layer.msg("请输入联系电话");form1.lxdh.focus();return;
  }
  if(form1.zgzz.value==0){
    layer.msg("请输入职工住址");form1.zgzz.focus();return;
  }
  if(CheckDate(form1.csrq.value)){
    layer.msg("请输入标准日期(如:(年-月-日))");
    form1.csrq.focus();
    return;
  }
  if(form1.dzyx.value==0){
    layer.msg("请输入电子邮箱");form1.dzyx.focus();return;
  }
  showcheck1();
}

function exit(){
	window.location.href="userexit.jsp";
}

function CheckDate(INDate)
{ if (INDate=="")//如果输入日期为空
    {return true;}
	subYY=INDate.substr(0,4)//截取输入日期的前4位
	if(isNaN(subYY) || subYY<=0){//如果输入的不是数字或着是负数
		return true;
	}
	//转换月份
        //从第输入数字的第0位开始查找，判断是否有字符串"-",如果有将separate的值设置为"-"
	if(INDate.indexOf('-',0)!=-1){	separate="-"}
	else{
		if(INDate.indexOf('/',0)!=-1){separate="/"}
		else {return true;}
		}
                //从字符串的第一个位置开始查找，返回特定字符的位置
		area=INDate.indexOf(separate,0)
		subMM=INDate.substr(area+1,INDate.indexOf(separate,area+1)-(area+1))
		if(isNaN(subMM) || subMM<=0){
		return true;
	}
		if(subMM.length<2){subMM="0"+subMM}//如果月份的只有一位那么在它的前面加"0"
	//转换日
	area=INDate.lastIndexOf(separate)//从字符串的最后一位开始查找，返回特定字符的位置
	subDD=INDate.substr(area+1,INDate.length-area-1)
	if(isNaN(subDD) || subDD<=0){
		return true;
	}
	if(eval(subDD)<10){subDD="0"+eval(subDD)}//对作为数字表达示的字符串求值
	NewDate=subYY+"-"+subMM+"-"+subDD
	if(NewDate.length!=10){return true;}//如果输入日期的长度小于10
    if(NewDate.substr(4,1)!="-"){return true;}//如果输入日期的第5位不是"-"
    if(NewDate.substr(7,1)!="-"){return true;}//如果输入日期的第8位不是"-"
	var MM=NewDate.substr(5,2);//从第5位开始截取字符串，截取2为，即获得月份
	var DD=NewDate.substr(8,2);//从第8位开始截取字符串，截取2为，即获得日
        //判断是否为闰年（能被4整除并且能够被100整除或者只能被400整除的年份就为闰年）
	if((subYY%4==0 && subYY%100!=0)||subYY%400==0){
		if(parseInt(MM)==2){//将MM转化为整数
			if(DD>29){return true;}
		}
	}else{
		if(parseInt(MM)==2){
			if(DD>28){return true;}
		}
	}
	var mm=new Array(1,3,5,7,8,10,12); //判断每月中的最大天数
	for(i=0;i< mm.length;i++){
		if (parseInt(MM) == mm[i]){//判断月份是否为数组中的值
			if(parseInt(DD)>31){return true;}
		}else{
			if(parseInt(DD)>30){return true;}
		}
	}
	if(parseInt(MM)>12){return true;}//如果月份大于12
   return false;}//如果以上情况都不是返回false


function showcheck1()
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
	  	'<div style="text-align:center; padding: 10px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">请核对您的基本信息</div>'
	  	+'<div style="padding:6px "> <table class="layui-table"  >'
	  	//第一行
	  	+'<tr>'
	  		+'<td id="td2">职工编号</td>'
	  		+'<td id="td2">'+form1.zgbh.value+'</td>'
	  		
	  		+'<td id="td2">登记日期</td>'
	  		+'<td id="td2">'+form1.djrq.value+'</td>'
	  	+'<tr>'
	  	
	  	//第二行
	  	+'<tr>'
	  		+'<td id="td2">姓名</td>'
	  		+'<td id="td2">'+form1.zgxm.value+'</td>'
	  		
	  		+'<td id="td2">性别</td>'
	  		+'<td id="td2">'+form1.zgxb.value+'</td>'
	  	+'<tr>'
	  	
	  	//第三行
	  	+'<tr>'
	  		+'<td id="td2">联系电话</td>'
	  		+'<td id="td2">'+form1.lxdh.value+'</td>'
	  		
	  		+'<td id="td2">住址</td>'
	  		+'<td id="td2">'+form1.zgzz.value+'</td>'
	  	+'<tr>'
	  	
	  	//第四行
	  	+'<tr>'
	  		+'<td id="td2">出生日期</td>'
	  		+'<td id="td2">'+form1.csrq.value+'</td>'
	  		
	  		+'<td id="td2">电子邮箱</td>'
	  		+'<td id="td2">'+form1.dzyx.value+'</td>'
	  	+'<tr>'
	  	+'</table> </div>'
	  	
	  	
	  ,yes:function(){
	    layer.closeAll();
	  	checkpassword();
	  	
	  }	
	});
}

function checkpassword(){
  layer.prompt({title: '您的用户名为:"'+form1.username.value+'",请再次输入密码确认提交', formType: 1}, function(pass, index){
	  layer.close(index);
	  if(form1.password.value!=pass){
	      layer.msg("密码不一致，请重新输入！");
	      form1.password.focus();
		  return;
	  }else{
	    layer.msg("确认成功，即将完成登记！");
	  	window.setTimeout(function(){form1.submit();},600);
	  }
	  
  });
}

</script>







