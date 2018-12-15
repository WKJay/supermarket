<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="calendar" scope="page" class="com.infinity.showtime.ShowTime"/>
<jsp:useBean id="Time" scope="page" class="com.infinity.showtime.CalendarBean"/>
<jsp:useBean id="rst" scope="page" class="com.infinity.dbconn.DBConn"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset="utf-8">
    <title>信息</title>
    <link href="../CSS/font-awesome.css" rel="stylesheet" type="text/css">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">      
     body{          
        background-size:cover; 
        margin:0;   
        background-color:#393D49;;  
     }      
     
     .table{
     	margin-top:6;
     	color:white;
     	background-color:#393D49;
     }
     
     .input{
     	background-color:#393D49;
     	border:0;
     	width:80;
     	color:white;
     }
      a{ 
      color:red; /*无链接时颜色*/
      text-decoration:none;
       }  
      a:hover{ color:red;/*鼠标经过链接时颜色*/}
      a:active{ color:red; /*鼠标点击链接时颜色*/}

 </style> 
  </head>

  <body onLoad="getLangDate();checkcookie();">
   <table class="table">
   <tr>
   		<td width="30"><i class="fa fa-cog fa-spin"></i>&nbsp;&nbsp;</td>
   		<td width="370">
   			<div id="dateStr" ></div>
   		</td>
   		<td width="250">
   			&nbsp;&nbsp;&nbsp;当前操作员：<input class="input" type="text" name="czy"  readonly value="<%=session.getAttribute("zgxm")%>">
   		</td>
   		<td width= "40"></td>
   		<td width= "90">库存警报：</td>
   		<td width= "140"><div id="kcjb" class="word_grey"></div></td>
   		<td></td>
   </tr>
   </table>
   
   <script type="text/javascript">
   
   function getCookie(cname){
	var name = cname + "=";
	var ca = document.cookie.split(';');
	for(var i=0; i<ca.length; i++) {
		var c = ca[i].trim();
		if (c.indexOf(name)==0) return c.substring(name.length,c.length);
	}
	return "";
	}	
	
    
   	function getLangDate(){
   		var dateObj = new Date();
   		var year = dateObj.getFullYear();
   		var month = dateObj.getMonth()+1;
   		var date = dateObj.getDate();
   		var day = dateObj.getDay();
   		var weeks = ["星期日","星期一","星期二","星期三","星期四","星期五","星期六"];
   		var week = weeks[day];
   		var hour = dateObj.getHours();
   		var minute = dateObj.getMinutes();
   		var second = dateObj.getSeconds();
   		//如果月、日、小时、分、秒的值小于10，在前面补0
   		if(month<10){
   			month = "0"+month;
   		}
   		if(date<10){
   			date = "0"+date;
   		}
   		if(hour<10){
   			date = "0"+hour;
   		}
   		if(minute<10){
   			minute = "0"+minute;
   		}
   		if(second<10){
   			second = "0"+second;
   		}
   		var newDate = year+"年"+month+"月"+date+"日 "+week+" "+hour+":"+minute+":"+second;
   		document.getElementById("dateStr").innerHTML="当前时间："+newDate;
   		
   		showCustomer();
   		setTimeout("getLangDate()",1000);//每一秒调用一次函数
   		
   	}
   	
   	function checkcookie(){
   	var checkchar= getCookie("kcyjlimit");
   		if(checkchar==""){
   			alert("当前库存预警限度未设置！请前往：系统设置>高级设置中进行相应的设定！");
   		}
   	}
   	
   	function showCustomer(str)
	{
	var xmlhttp;
	var kcyjlimit=getCookie("kcyjlimit");
    var SQLStr = "SELECT * FROM tb_kucun where kcsl <"+kcyjlimit;  	
	if (str=="")
	{
	  document.getElementById("kcjb").innerHTML="";
	  return;
    }
	if (window.XMLHttpRequest)
	{// code for IE7+, Firefox, Chrome, Opera, Safari
	  xmlhttp=new XMLHttpRequest();
	}
	else
	{// code for IE6, IE5
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
     }
     
     xmlhttp.onreadystatechange=function()
	  {
	  if (xmlhttp.readyState==4 && xmlhttp.status==200 )
	    {
	    var resChar = xmlhttp.responseText;    	
	    document.getElementById("kcjb").innerHTML=xmlhttp.responseText;	    
	    }
	  }
	  if(kcyjlimit!=""){
		xmlhttp.open("GET","kcjb.jsp?q="+kcyjlimit,true);
		xmlhttp.send();
	  }  
	}
   </script>
  </body>
</html>
