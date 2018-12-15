<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.jfree.chart.ChartFactory" %>
<%@ page import="org.jfree.chart.JFreeChart" %>
<%@ page import="org.jfree.data.category.DefaultCategoryDataset" %>
<%@ page import="org.jfree.chart.plot.PlotOrientation" %>
<%@ page import="org.jfree.chart.entity.StandardEntityCollection" %>
<%@ page import="org.jfree.chart.ChartRenderingInfo" %>
<%@ page import="org.jfree.chart.servlet.ServletUtilities" %>

<%@ page import="java.io.*,java.sql.*"%>
<jsp:useBean id="rst" scope="page" class="com.infinity.dbconn.DBConn"/>
<link href="../../CSS/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../../layui/css/layui.css " media="all">
<link href="../../CSS/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script src="../../layui/layui.js" charset="utf-8"></script>
<%
   String year=request.getParameter("year");
   String url="";
   //获得某年按月份分组的总销售额的SQL语句
   String strSql="select sum(je) as sumje,month(xsdate) as xsmonth from tb_sell"+
                 " where  year(xsdate)='"+year+"' group by month(xsdate)"; 
   ResultSet rs=rst.getResult(strSql);
   int counts=0;
   while(rs.next()){
   	counts++;
   }
   if(counts!=12){
   counts=0;
   out.flush();
   out.println("<script language='javascript'>");
   out.println("layui.use(['layer', 'form'], function(){var layer = layui.layer,form = layui.form;layer.msg('当年没有销售信息！或记录月数不足一年');});");
   out.println("window.setTimeout(function(){window.location.href='../main.jsp';},700);");
   out.println("</script>");
   }
   else
   {
   	    rs=rst.getResult(strSql);
   	    rs.next();
		DefaultCategoryDataset dataset1=new DefaultCategoryDataset();
		for(int j=1;j<=12;j++){   //循环从1循环到12
			float sumje=Float.valueOf(rs.getString("sumje"));
			int y=rs.getInt("xsmonth");
			dataset1.addValue(sumje,y+"月",y+"月");
			rs.next();
		}
		//创建JFreeChart组件的图表对象
		JFreeChart chart=ChartFactory.createBarChart3D(
											year+"年销售额分析图",		//图表标题
											"月份",					//x轴的显示标题
											"销量",					//y轴的显示标题
											dataset1,				//数据集
											PlotOrientation.VERTICAL,//图表方向(垂直)
											true,					//是否包含图例
											false,					//是否包含提示
											false					//是否包含URL
											);
		//设置图表的文件名
		// 固定用法
		ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
		String fileName=ServletUtilities.saveChartAsPNG(chart,500,300,info,session);
	    url=request.getContextPath()+"/servlet/DisplayChart?filename="+fileName;
		System.out.println(url);
	}
%>
<html>
<title>年销售额分析</title>
<meta charset="UTF-8">
<link href="../../CSS/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../../layui/css/layui.css " media="all">
<link href="../../CSS/bootstrap.min.css" rel="stylesheet" type="text/css"/>

	<style>
	   	body {
		background-image: url(../../images/blank2.jpg); 
		background-size:cover;  
		margin:0;
		}
		.form-control{
			display:inline-block;
			width:40;
		}
		.input-sm{
			height:20px;
			margin-left:5;
			margin-right:5;
		}
	 </style>
<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0" class="table table-bordered">
  <tr>
    <td style="text-align:center"><img src="<%=url%>"></td>
  </tr>
</table>
</body>
</html>
