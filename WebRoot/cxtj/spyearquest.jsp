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
			<span class="word_deepgrey"> 当前位置：查询统计 ></span>年销售额分析&gt;&gt;&gt;
		</blockquote>
		    
	   <form name="form1" method="POST" action="search/spyearquest_dosearch.jsp" target="main2Frame" id="form1">
	       请选择要分析的年份：
	    <div class="layui-input-inline">   
		    <select name="year" id="year" class="form-control">
	        	<%for(int i=2000;i<=2049;i++){%>
	        		<option value="<%=i%>" ><%=i%>年</option>
				<%}%>
	      	</select>
		</div>
		&nbsp;&nbsp;&nbsp;
		<button type="submit" class="btn btn-primary" >确认分析</button>
		   
	   </form>
	          
	</body>
</html>

