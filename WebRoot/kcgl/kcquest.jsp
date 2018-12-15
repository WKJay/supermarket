<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
  <title>库存信息查询</title>

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
			<span  class="word_deepgrey"> 当前位置：库存管理 ></span>库存信息查询&gt;&gt;&gt;
		</blockquote>
		    
	   <form name="form1" method="POST" action="search/kcquest_dosearch.jsp" target="main2Frame" id="form1">
	    
	      <div class="layui-input-inline">   
			      
			   		 <select name="cif" class="form-control"style="width:120">
				        <option value="" disabled>查询方式</option>
				        <option value="spname" selected="">商品全称</option>
				        <option value="jc">商品简称</option>
				        <option value="cd">产地</option>
				        <option value="kcsl">库存数量</option>
			     	 </select>
		        
		    </div>
		      
		     <div class="layui-input-inline">
			      <select name="ccif" class="form-control"style="width:120">
			        <option value="" disabled>匹配要求</option>
			        <option value="LIKE">包含</option>
			        <option value="=">等于</option>
			        <option value="<">小于</option>
			        <option value="ALL">所有数据</option>
			      </select>
			 </div>
		   
		     <div class="layui-input-inline">
		       <%
		       request.setCharacterEncoding("UTF-8");
		        %>
			   <input type="text" name="qvalue" class="form-control" style="width:130">
		     </div>
		   
		   <button type="button" name="submit1" class="btn btn-primary" onClick="check()">查询</button>
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
function check()
{
  if(form1.qvalue.value==0){
    layer.msg('请输入查询关键字');
    form1.qvalue.focus();
    return;
  }
  if(form1.ccif.value==0){
  	layer.msg('请选择匹配条件');
    form1.ccif.focus();
    return;
  }
  form1.submit();
}

</script>

