<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset="UTF-8">
    <title>职工数据</title>
    <link rel="stylesheet" href="../../layui/css/layui.css " media="all">
    <link href="../../CSS/font-awesome.css" rel="stylesheet" type="text/css" />
    <link href="../../CSS/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <style>
    .layui-form-checkbox[lay-skin=primary]{
    	padding-top:10%;
    }
    
    </style>
  </head>
  <body>
 	 
	  <blockquote class="layui-elem-quote">
		<span  class="word_deepgrey"> 当前位置：超市管理></span>职工信息 &gt;&gt;&gt;
	  </blockquote>
	  <br>
  	<center>
  	<div class="layui-btn-group demoTable">
	  <button class="layui-btn" data-type="getCheckData">获取选中行数据</button>
	  <button class="layui-btn" data-type="getCheckLength">获取选中数目</button>
	  <button class="layui-btn" data-type="isAll">验证是否全选</button>
	</div>
	
	<table class="layui-table" lay-data="{width: 700, height:480, url:'zhigongdata.jsp', page:true, id:'idTest'}" lay-filter="demo">
	  <thead>
	    <tr>
	      <th lay-data="{type:'checkbox', fixed: 'left'}"></th>
	      <th lay-data="{field:'zgbh', width:80}">职工编号</th>
	      <th lay-data="{field:'zgxm', width:80}">姓名</th>
	      <th lay-data="{field:'zgxb', width:80}">性别</th>
	      <th lay-data="{field:'zgzz', width:120}">住址</th>
	      <th lay-data="{field:'dzyx', width:200}">电子邮箱</th>
	      <th lay-data="{field:'xse', width:80}">销售额</th>
	      <th lay-data="{field:'djrq', width:120}">入职日期</th>
	      <th lay-data="{field:'username', width:80}">用户名</th>
	      <th lay-data="{field:'userLastLogTime', width:120}">最后登陆时间</th>
	      <th lay-data="{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}"></th>
	    </tr>
	  </thead>
	</table>
	 
	<script type="text/html" id="barDemo">

    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>

	</script>
	
	<script src="../../layui/layui.js" charset="utf-8"></script>
	<script>
	layui.use('table', function(){
	  var table = layui.table;
	  //监听表格复选框选择
	  table.on('checkbox(demo)', function(obj){
	    console.log(obj)
	  });
	  //监听工具条
	  table.on('tool(demo)', function(obj){
	    var data = obj.data;
	    if(obj.event === 'detail'){
	      layer.msg('ID：'+ data.id + ' 的查看操作');
	    } else if(obj.event === 'del'){
	      layer.confirm('真的删除行么', function(index){
	        obj.del();
	        layer.close(index);
	      });
	    } else if(obj.event === 'edit'){
	      layer.alert('编辑行：<br>'+ JSON.stringify(data))
	    }
	  });
	  
	  var $ = layui.$, active = {
	    getCheckData: function(){ //获取选中数据
	      var checkStatus = table.checkStatus('idTest')
	      ,data = checkStatus.data;
	      layer.alert(JSON.stringify(data));
	    }
	    ,getCheckLength: function(){ //获取选中数目
	      var checkStatus = table.checkStatus('idTest')
	      ,data = checkStatus.data;
	      layer.msg('选中了：'+ data.length + ' 个');
	    }
	    ,isAll: function(){ //验证是否全选
	      var checkStatus = table.checkStatus('idTest');
	      layer.msg(checkStatus.isAll ? '全选': '未全选')
	    }
	  };
	  
	  $('.demoTable .layui-btn').on('click', function(){
	    var type = $(this).data('type');
	    active[type] ? active[type].call(this) : '';
	  });
	});
	</script>
	</center>
  </body>
</html>
