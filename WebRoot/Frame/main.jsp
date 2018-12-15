<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>

<meta charset="UTF-8">
 <link rel="stylesheet" href="../layui/css/layui.css" media="all">
 <link rel="stylesheet" href="../CSS/bootstrap.css">
	<style type="text/css">      
     body{      
        background-image: url(../images/blank2.jpg);      
        background-size:cover;    
     }      
	
	.alert.alert-success{
		float:left;
		position:absolute;
		z-index:2 !important;
		margin-top:200px;
		margin-left:250px;
		opacity:0.7;
	}


 </style> 
</head>
<body> 
	
	<div class="layui-carousel" id="media">
	<!-- 加上这个就太丑了，别问我为什么知道
		<div class="alert alert-success" role="alert">
  		<a href="#" class="alert-link">欢迎使用超市销售管理系统</a>
		</div>  
	-->
	
	  <div carousel-item>
	    <div><img src="../images/mainframepics/4.jpg"></div>
	    <div><img src="../images/mainframepics/2.jpg"></div>
	    <div><img src="../images/mainframepics/3.jpg"></div>
	    <div><img src="../images/mainframepics/1.jpg"></div>
	    <div><img src="../images/mainframepics/5.jpg"></div>
	  </div>
	</div>

	
</body>

<script src="../layui/layui.js"></script>
<script>
layui.use('carousel', function(){
  var carousel = layui.carousel;
  //建造实例
  carousel.render({
    elem: '#media'
    ,width: '100%' //设置容器宽度
    ,arrow: 'none' //始终显示箭头
    ,anim: 'fade' //切换动画方式
    ,full:'ture'
    ,indicator:'none'
    
  });
});
</script>
</html>
