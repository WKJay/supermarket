<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>左侧栏</title>

<link href="../CSS/jquery-accordion-menu.css" rel="stylesheet" type="text/css" />
<link href="../CSS/font-awesome.css" rel="stylesheet" type="text/css" />

<style type="text/css">
*{box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;}
body{
	background-color:grey
	background-size:cover;
	margin:0;
	padding-top:0;
	overflow-x:hidden
}
.content{
	width:268px;
	margin:0px auto;
}
.filterinput{
	background-color:rgba(249, 244, 244, 0);
	border-radius:15px;
	width:90%;
	height:30px;
	border:thin solid #000;
	text-indent:0.5em;
	font-weight:bold;
	color:grey;
#demo-list a{
	overflow:hidden;
	text-overflow:ellipsis;
	-o-text-overflow:ellipsis;
	white-space:nowrap;
	width:100%;
}
</style>

<script src="../js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="../js/jquery-accordion-menu.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$("#demo-list li").click(function(){
		$("#demo-list li.active").removeClass("active")
		$(this).addClass("active");
	})	
})	
</script>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" %>  

</head>
<body>
<div class="content">
	<div id="jquery-accordion-menu" class="jquery-accordion-menu white">
		<div class="jquery-accordion-menu-header" id="form"></div>
		<ul id="demo-list" >
		   <li><a href="#" ><i class="fa fa-home fa-fw"></i>基础信息管理</a>
			   <ul class="submenu"> 
			   	<li><a href="../jcxx/khinfo.jsp"  target="mainFrame">客户信息登记</a></li>
				<li><a href="../jcxx/spinfo.jsp"  target="mainFrame">商品信息登记</a></li>
				<li><a href="../jcxx/gysinfo.jsp" target="mainFrame">供应商信息登记</a></li>
				<li><a href="../jcxx/khchat.jsp"  target="mainFrame">客户信息查询 </a></li>
				<li><a href="../jcxx/spchat.jsp"  target="mainFrame">商品信息查询 </a></li>
				<li><a href="../jcxx/gyschat.jsp" target="mainFrame">供应商信息查询 </a></li>
				</ul>      
		   </li>
			<li><a href="#"><i class="fa fa-glass fa-fw"></i>库存管理 </a>
				<ul class="submenu">
					<li><a href="../kcgl/sprk.jsp" target="mainFrame">商品入库</a></li>
					<li><a href="../kcgl/sprkth.jsp">商品入库退货</a></li>
					<li><a href="../kcgl/kcchat.jsp">库存查询 </a></li>
					<li><a href="../kcgl/modifyPrice.jsp">价格调整 </a></li>
		        </ul>
			</li>
			<li><a href="#"><i class="fa fa-handshake-o fa-fw"></i>销售管理</a>
				<ul class="submenu">
					<li><a href="../spxs/spxs.jsp">商品销售</a></li>
					<li><a href="../spxs/spxsth.jsp">销售退货</a></li>
		        </ul>
			</li>
			<li><a href="#"><i class="fa fa-file-image-o fa-fw"></i>查询统计</a>
				<ul class="submenu">
					<li><a href="../cxtj/xsxxchat.jsp">销售信息查询</a></li>
					<li><a href="../cxtj/sprkchat.jsp">商品入库查询</a></li>
					<li><a href="../cxtj/spxsphchat.jsp">商品销售排行</a></li>
					<li><a href="../cxtj/spyearchat.jsp">年销售额分析</a></li>
				</ul>
			</li>
	
			<li><a href="#"><i class="fa fa-cog fa-fw"></i>系统设置 </a>
				<ul class="submenu">
					<li><a href="../xtsz/addUser.jsp">新职工登记</a></li>
					<li><a href="../xtsz/usermanager.jsp">个人密码修改</a></li>
					<li><a href="../xtsz/advancedsetting.jsp">高级设置</a></li>
				</ul>
			</li>
			
			<li><a href="#"><i class="fa fa-shopping-cart" aria-hidden="true"></i></i>超市管理 </a>
				<ul class="submenu">
					<li><a href="../supermarketinfo/info.jsp">超市信息</a></li>
					<li><a href="../supermarketinfo/zhigong/showData.jsp">职工信息</a></li>
				</ul>
			</li>
			<li><a href="NoJsp.jsp"><i class="fa fa-user fa-fw"></i>About </a></li>
			<li><a onClick="showcontact()"><i class="fa fa-envelope fa-fw"></i>Contact </a></li>
		</ul>
		<div class="jquery-accordion-menu-footer">
			INFINITY GROUP<br>
			2017<br>
			CURRICULUM DESIGN
		</div>
	</div>
</div>
<script src="../layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
layui.use(['layer', 'form'], function(){
  var layer = layui.layer
  ,form = layui.form;
});
function showcontact(){
layer.msg("1931048074@qq.com");
}
(function($) {
$.expr[":"].Contains = function(a, i, m) {
	return (a.textContent || a.innerText || "").toUpperCase().indexOf(m[3].toUpperCase()) >= 0;
};
function filterList(header, list) {
	//@header 头部元素
	//@list 无需列表
	//创建一个搜素表单
	var form = $("<form>").attr({
		"class":"filterform",
		action:"#"
	}), input = $("<input>").attr({
		"class":"filterinput",
		type:"text"
	});
	$(form).append(input).appendTo(header);
	$(input).change(function() {
		var filter = $(this).val();
		if (filter) {
			$matches = $(list).find("a:Contains(" + filter + ")").parent();
			$("li", list).not($matches).slideUp();
			$matches.slideDown();
		} else {
			$(list).find("li").slideDown();
		}
		return false;
	}).keyup(function() {
		$(this).change();
	});
}
$(function() {
	filterList($("#form"), $("#demo-list"));
});
})(jQuery);	
</script>

<script type="text/javascript">

	jQuery("#jquery-accordion-menu").jqueryAccordionMenu();
	
</script>

</body>
</html>
