<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>



<html>
	<head>
	
	  <meta charset="UTF-8">
	  <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" media="screen" />
	  <link rel="stylesheet" href="layui/css/layui.css"  media="all">
	  <title>INFINITY GROUP</title>
	  <style>
	  input:-webkit-autofill {
        -webkit-box-shadow: 0 0 0px 1000px #ffffff inset !important;//关于解决输入框背景颜色
        -webkit-text-fill-color: rgba(255,255,255,1)!important;//关于接输入框文字颜色
      }
	  body {
		  background-color: #eee;
		  overflow: hidden;
	  }
</style>
	  <link rel="stylesheet" href="CSS/loginstyle.css">
	  <link rel="stylesheet" href="CSS/img_style.css">
	  <link href="CSS/playground.css" media="all" rel="stylesheet" type="text/css" /> 
	  
	<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"52346",secure:"52353"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
	<body><canvas id="canvas"></canvas><br/>
	<div class = "content">
		<div class ="secondary"><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<div class ="box">
		<div class="he_border1">
			<img class="he_border1_img" src="CSS/css_img/login-bg.jpg" alt="Image 01" style="width:400px">
			<div class="he_border1_caption">
				<h3 class="he_border1_caption_h">超市销售管理系统</h3>
				<p class="he_border1_caption_p">@INFINITY GROUP<br/>王君杰<br/>曲承承<br/>魏梦<br/>胡桂英<br/>麻玉琳</p>
				<a class="he_border1_caption_a" href="#"></a>
			</div>
		</div>
		<div class = "wordline">
		  	 &copy; 2017 课程设计 - 超市销售管理系统 
		  	 <br/>INFINITY GROUP		    	
	    </div>
		</div>
		   
		</div>
	
		<div class = "primary">
			<form class="sign-up" action = "LoginServlet" method = "post">
		    <h1 class="sign-up-title">操作员登录</h1>
		    <input type="text" name="username" class="sign-up-input" placeholder="请输入用户名" autofocus>
		    <input type="password" name="pwd" class="sign-up-input" placeholder="请输入密码">
		    <input type="submit" value="登录" class="sign-up-button">
		    </form> 		
		</div>
	
	</div>
	
	
    
	  
	  <!-- 
	  <div align="center">
	  <a href="secondary_index.jsp" class="large red button" >进入调试</a>
	  </div>
	  
	  <div class="about">
	    <p class="about-links">
	      <a href="http://www.cssflow.com/snippets/sign-up-form" target="_parent">项目简介</a>
	      <a href="http://www.cssflow.com/snippets/sign-up-form.zip" target="_parent">团队简介</a>
	    </p>
	    <p class="about-author">
	      &copy; 2017 <a>课程设计</a> -
	      <a>超市销售管理系统</a><br>
	      INFINITY GROUP
	    </p>
	  </div>
	   -->
<script src="layui/layui.js" charset="utf-8"></script>
<script>

var canvas = document.getElementById("canvas");
var ctx = canvas.getContext("2d");
var cw = canvas.width = window.innerWidth,
  cx = cw / 2;
var ch = canvas.height = window.innerHeight,
  cy = ch / 2;

ctx.fillStyle = "#000";
var linesNum = 16;
var linesRy = [];
var requestId = null;

function Line(flag) {
  this.flag = flag;
  this.a = {};
  this.b = {};
  if (flag == "v") {
    this.a.y = 0;
    this.b.y = ch;
    this.a.x = randomIntFromInterval(0, ch);
    this.b.x = randomIntFromInterval(0, ch);
  } else if (flag == "h") {
    this.a.x = 0;
    this.b.x = cw;
    this.a.y = randomIntFromInterval(0, cw);
    this.b.y = randomIntFromInterval(0, cw);
  }
  this.va = randomIntFromInterval(25, 100) / 100;
  this.vb = randomIntFromInterval(25, 100) / 100;

  this.draw = function() {
    ctx.strokeStyle = "#ccc";
    ctx.beginPath();
    ctx.moveTo(this.a.x, this.a.y);
    ctx.lineTo(this.b.x, this.b.y);
    ctx.stroke();
  }

  this.update = function() {
    if (this.flag == "v") {
      this.a.x += this.va;
      this.b.x += this.vb;
    } else if (flag == "h") {
      this.a.y += this.va;
      this.b.y += this.vb;
    }

    this.edges();
  }

  this.edges = function() {
    if (this.flag == "v") {
      if (this.a.x < 0 || this.a.x > cw) {
        this.va *= -1;
      }
      if (this.b.x < 0 || this.b.x > cw) {
        this.vb *= -1;
      }
    } else if (flag == "h") {
      if (this.a.y < 0 || this.a.y > ch) {
        this.va *= -1;
      }
      if (this.b.y < 0 || this.b.y > ch) {
        this.vb *= -1;
      }
    }
  }

}

for (var i = 0; i < linesNum; i++) {
  var flag = i % 2 == 0 ? "h" : "v";
  var l = new Line(flag);
  linesRy.push(l);
}

function Draw() {
  requestId = window.requestAnimationFrame(Draw);
  ctx.clearRect(0, 0, cw, ch);

  for (var i = 0; i < linesRy.length; i++) {
    var l = linesRy[i];
    l.draw();
    l.update();
  }
  for (var i = 0; i < linesRy.length; i++) {
    var l = linesRy[i];
    for (var j = i + 1; j < linesRy.length; j++) {
      var l1 = linesRy[j]
      Intersect2lines(l, l1);
    }
  }
}

function Init() {
  linesRy.length = 0;
  for (var i = 0; i < linesNum; i++) {
    var flag = i % 2 == 0 ? "h" : "v";
    var l = new Line(flag);
    linesRy.push(l);
  }

  if (requestId) {
    window.cancelAnimationFrame(requestId);
    requestId = null;
  }

  cw = canvas.width = window.innerWidth,
    cx = cw / 2;
  ch = canvas.height = window.innerHeight,
    cy = ch / 2;

  Draw();
};

setTimeout(function() {
  Init();

  addEventListener('resize', Init, false);
}, 15);

function Intersect2lines(l1, l2) {
  var p1 = l1.a,
    p2 = l1.b,
    p3 = l2.a,
    p4 = l2.b;
  var denominator = (p4.y - p3.y) * (p2.x - p1.x) - (p4.x - p3.x) * (p2.y - p1.y);
  var ua = ((p4.x - p3.x) * (p1.y - p3.y) - (p4.y - p3.y) * (p1.x - p3.x)) / denominator;
  var ub = ((p2.x - p1.x) * (p1.y - p3.y) - (p2.y - p1.y) * (p1.x - p3.x)) / denominator;
  var x = p1.x + ua * (p2.x - p1.x);
  var y = p1.y + ua * (p2.y - p1.y);
  if (ua > 0 && ub > 0) {
    markPoint({
      x: x,
      y: y
    })
  }
}

function markPoint(p) {
  ctx.beginPath();
  ctx.arc(p.x, p.y, 2, 0, 2 * Math.PI);
  ctx.fill();
}

function randomIntFromInterval(mn, mx) {
  return ~~(Math.random() * (mx - mn + 1) + mn);
}

layui.use(['layer', 'form'], function(){
  var layer = layui.layer
  ,form = layui.form;
  
  layer.open({
        type: 1
        ,title: false //不显示标题栏
        ,closeBtn: false
        ,area: '350px;'
        ,shade: 0.8
        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
        ,btn: ['明白！', '好的！']
        ,btnAlign: 'c'
        ,moveType: 1 //拖拽模式，0或者1
        ,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">'+
         '1月5日更新！<br><br>'+
         '职工系统进行了大改！<br>'+
         '原来的操作员信息改成了职工信息，<br>'+
         '并且添加了职工信息表，并与用户名账号绑定！<br>'+
         '当然，原来的用户名和账号已经无法使用，<br>'+
         '请在系统设置》新职工登记中登记自己的信息。<br>'+
         '新添加“超市管理条目”，可在该条目下查看职工信息<br>'+
         '同时该条目下的超市信息中加入了超市资金统计！<br>'+
         '职工信息表采用全新的数据表格，更加美观，<br>'+
         '与其他基本信息表完全区分开来，增加多样性！<br>'+
         '赶快登陆体验吧！！！<br><br><br>'+
         '最后更新记录：<br>'+
         '2018/1/5/23:10'+
         '</div>'
      });
});


   



</script>
	</body>
</html>
