<%@ page contentType="text/html;charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<html>
  <title>入库信息查询</title>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
  <link href="../CSS/font-awesome.css" rel="stylesheet" type="text/css" />
  <link href="../CSS/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <link rel="stylesheet" href="../layui/css/layui.css"  media="all" />
  
   <style type="text/css">
		.style2 {color: #333333}
		body {
			background-image: url(../images/blank2.jpg); 
			background-size:cover;  
			margin:0;
		}
		#form1{
			margin-top:0;
			margin-left:0;
			text-align:center;
		}
		.layui-form-label{
			padding-left:0 ;
		}
		.layui-elem-quote{
			margin-bottom:0 ;
		}
	</style>
 	
<body>
	
	<blockquote class="layui-elem-quote" margin-bottom="0">
		<span  class="word_deepgrey"> 当前位置：查询统计 ></span>商品入库查询 &gt;&gt;&gt;
	</blockquote>
	<br>
	
	<form name="form1" method="POST" action="search/sprkquest_dosearch.jsp" target="main2Frame" id="form1">
	    
	      <div class="layui-input-inline">   
			      
			   		 <select name="cif" class="form-control"style="width:110">
				        <option value="" disabled>查询方式</option>
				        <option value="spname" selected="">商品名称</option>
				        <option value="spid">商品编号</option>
				        <option value="jc">简称</option>
				        <option value="id">入库编号</option>
                  		<!--<option value="khname">客户全称</option>-->
			     	 </select>
		        
		    </div>
		      
		     <div class="layui-input-inline">
			      <select name="ccif" class="form-control"style="width:110">
			        <option value="" disabled>匹配要求</option>
			        <option value="LIKE">包含</option>
			        <option value="=">等于</option>
			        <option value="ALL">所有数据</option>
			      </select>
			 </div>
			 
		     <div class="layui-input-inline">
		       <%
		       request.setCharacterEncoding("UTF-8");
		       %>
			   <input type="text" name="qvalue" class="form-control"
			   value="输入关键字" 
			   onblur="if(this.value==''){this.value='输入关键字'}" 
			   onfocus="if(this.value=='输入关键字'){this.value=''}" style="width:100" >
		     </div>
		     
		     <div class="layui-input-inline">
			      <select name="andor" class="form-control"style="width:80">
			        <option value="" disabled>匹配要求</option>
			        <option value="AND" selected> 并且</option>
                    <option value="OR">或者</option>
			      </select>
			 </div>
			 
			 日期从
			 <div class="layui-input-inline">
			   <input type="text" name="sdate" class="form-control" style="width:80">
		     </div>
		           至
		     <div class="layui-input-inline">
			   <input type="text" name="edate" class="form-control" style="width:80">
		     </div>
		   <br><br>
		   <button type="button" name="submit1" class="btn btn-primary" onClick="check()">立即查询</button>
		   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		   <button type="submit" name="submit2" class="btn btn-info" onClick="searchall()">显示全部数据</button>
		   
	    </form>
	
</body>

</html>

<script src="../layui/layui.js" charset="UTF-8"></script>
<script language='JavaScript'>

layui.use(['layer', 'form'], function(){
  var layer = layui.layer
  ,form = layui.form;
});

function searchall(){
	form1.ccif.value="ALL";
	form1.submit();
}

function  check(){
  if(form1.qvalue.value==0){
   	layer.msg("请输入查询条件");form1.qvalue.focus();
    return;
  }
  if(form1.sdate.value==0){
    form1.sdate.focus();
    layer.msg("请输入查询日期");return;
    }
  if(form1.edate.value==0){
    form1.edate.focus();
    layer.msg("请输入截止日期");return;
    }
  if(CheckDate(form1.sdate.value)){
    layer.msg("请输入标准日期(如:(年/月/日)或(年-月-日))");
    form1.sdate.focus();
    form1.sdate.focus();
    return;
  }
  if(CheckDate(form1.edate.value)){
    layer.msg("请输入标准日期(如:(年/月/日)或(年-月-日))");
    form1.edate.value="";
    form1.edate.focus();
    return;
  }
  form1.submit();
}
//判断输入的日期是否正确
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
</script>

