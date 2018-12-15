<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
  <title>商品销售排行</title>

  <link href="../CSS/style.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="../layui/css/layui.css">
  <link href="../CSS/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <style type="text/css">
		.style2 {color: #333333}
		body {
			background-image: url(../images/blank2.jpg); 
			background-size:cover;  
			margin:0;
		}
		#form1{
			margin-top:10;
			margin-left:0;
			text-align:center;
		}
		.layui-form-label{
			padding-left:0 ;
		}
  </style>
  
	<body>
		<blockquote class="layui-elem-quote" style="margin-bottom:0px">
			<span class="word_deepgrey"> 当前位置：查询统计 ></span>商品销售排行&gt;&gt;&gt;
		</blockquote>
		    
	   <form name="form1" method="POST" action="search/spxsphquest_dosearch.jsp" target="main2Frame" id="form1">
	    
	       查询日期从：
	       <div class="layui-input-inline">
			   <input type="text" name="sdate" class="form-control" style="width:80"
			   value="输入年月日" 
			   onblur="if(this.value==''){this.value='输入年月日'}" 
			   onfocus="if(this.value=='输入年月日'){this.value=''}">
		   </div>
		   &nbsp;至&nbsp;
		   <div class="layui-input-inline">
			   <input type="text" name="edate" class="form-control" style="width:80"
			    value="输入年月日" 
			   onblur="if(this.value==''){this.value='输入年月日'}" 
			   onfocus="if(this.value=='输入年月日'){this.value=''}">
		   </div>
		      
		     <div class="layui-input-inline">
			      <select name="orderby" class="form-control" style="width:120">
			        <option value="je">金额</option>
                    <option value="sl">数量</option>
			      </select>
			 </div>
			 
			 <div class="layui-input-inline">
			      <select name="paixu" class="form-control" style="width:120">
			         <option value="desc">降序排序</option>
                     <option value="asc">升序排序</option>
			      </select>
			 </div>
		   
		   <button type="button" class="btn btn-primary" onClick="check()">查看排行</button>
		   
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
function check()
{
   if(form1.sdate.value==0){
    form1.sdate.focus();
    layer.msg('请输入查询日期');return;
    }
  if(form1.edate.value==0){
    form1.edate.focus();
    layer.msg('请输入截止日期');return;
    }
  if(CheckDate(form1.sdate.value)){
    layer.msg('请输入标准日期(如:(年/月/日)或(年-月-日))');
    form1.sdate.value="";
    form1.sdate.focus();
    return;
  }
  if(CheckDate(form1.edate.value)){
    layer.msg('请输入标准日期(如:(年/月/日)或(年-月-日))');
    form1.edate.value="";
    form1.edate.focus();
    return;
  }
  form1.submit();
}

//判断输入的日期是否正确
function CheckDate(INDate){
 if (INDate=="")			//如果输入日期为空
    {return true;}
	subYY=INDate.substr(0,4)	 //截取输入日期的前4位
	if(isNaN(subYY) || subYY<=0){	//如果输入的不是数字或者是负数
		return true;
	}
	//转换月份，从输入数字的第0位开始查找，判断是否有字符串"-"，如果有将separate的值设置为"-"
	if(INDate.indexOf('-',0)!=-1){	separate="-"}
	else{
		if(INDate.indexOf('/',0)!=-1){separate="/"}//如果没有字符串"-"，那么将separate的值设置为"/"
		else {return true;}//如果以上两者均查询不到，则返回true
		}
		area=INDate.indexOf(separate,0)//从字符串的第一个位置开始查找，返回特定字符的位置
		subMM=INDate.substr(area+1,INDate.indexOf(separate,area+1)-(area+1))
		if(isNaN(subMM) || subMM<=0){
		return true;
	}
		if(subMM.length<2){subMM="0"+subMM}//如果月份只有1位，那么在它的前面加"0"
	//转换日
	area=INDate.lastIndexOf(separate)//从字符串的最后一位开始查找，返回特定字符的位置
	subDD=INDate.substr(area+1,INDate.length-area-1)
	if(isNaN(subDD) || subDD<=0){
		return true;
	}
	if(eval(subDD)<10){subDD="0"+eval(subDD)}	//对作为数字表达式的字符串求值
	NewDate=subYY+"-"+subMM+"-"+subDD
	if(NewDate.length!=10){return true;}	//如果输入日期的长度小于10
    if(NewDate.substr(4,1)!="-"){return true;}	//如果输入日期的第5位不是"-"
    if(NewDate.substr(7,1)!="-"){return true;}	//如果输入日期的第8位不是"-"
	var MM=NewDate.substr(5,2);		//从第5位开始截取字符串，截取2为，即获得月份
	var DD=NewDate.substr(8,2);		//从第8位开始截取字符串，截取2为，即获得日
	//判断是否为闰年（能被4整除并且不能被100整除或者只能被400整除的年份就为闰年）
	if((subYY%4==0 && subYY%100!=0)||subYY%400==0){ //判断是否为闰年
		if(parseInt(MM)==2){	//将MM转化为整数
			if(DD>29){return true;}
		}
	}else{
		if(parseInt(MM)==2){
			if(DD>28){return true;}
		}	
	}
	var mm=new Array(1,3,5,7,8,10,12); //判断每月中的最大天数
	for(i=0;i< mm.length;i++){
		if (parseInt(MM) == mm[i]){	//判断月份是否为数组中的值
			if(parseInt(DD)>31){
				return true;
			}else{
				return false;
			}
		}
	}
   if(parseInt(DD)>30){return true;}
   if(parseInt(MM)>12){return true;}//如果月份大于12
   return false;	//如果以上情况都不是则返回false
   }

</script>
