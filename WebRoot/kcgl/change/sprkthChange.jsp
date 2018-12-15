<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.sql.*,java.io.*"%>
<%@ page import="com.infinity.dbconn.DBConn"%>
<script src="../../layui/layui.js" charset="utf-8"></script>
<jsp:useBean id="rst" scope="page" class="com.infinity.dbconn.DBConn"/>
<jsp:useBean id="calendar" scope="page" class="com.infinity.showtime.CalendarBean"/>
<%
   request.setCharacterEncoding("UTF-8");//解决表单提交中的中文乱码问题
   //获取表单数据
   String jc=(String)session.getAttribute("jc"); String spname=(String)session.getAttribute("spname");
   String gg=(String)session.getAttribute("gg"); String rkthid=(String)session.getAttribute("rkthbh");
   String bz=(String)session.getAttribute("bz"); String gysname=(String)session.getAttribute("gysname");
   String cd=(String)session.getAttribute("cd"); String spid=(String)session.getAttribute("spid");
   String dw=(String)session.getAttribute("dw");
   String sl=(String)request.getParameter("sl"); String czy=(String)request.getParameter("czy");
   String je=(String)request.getParameter("je"); String jsr=(String)request.getParameter("jsr");
   String dj=(String)request.getParameter("dj"); String thdate=(String)request.getParameter("thdate");
   String ys=(String)request.getParameter("ys"); String jsfs=(String)request.getParameter("jsfs");
   String ss=(String)request.getParameter("ss"); String ws=(String)request.getParameter("ws");
   String whether="";
   
   if(ws.equals("0")){//记录商品入库时是否有未收款
       whether="是";
     }else{
       whether="否";
     }
   String theMax="";
   //保存入库信息
   String rukuthSql="insert into tb_rukuth values('"+rkthid+"','"+spid+"','"+spname+"',"+
       "'"+jc+"','"+cd+"','"+gg+"','"+bz+"','"+dw+"',"+dj+",'"+sl+"',"+je+","+
       "'"+gysname+"','"+ thdate +"','"+czy+"','"+jsr+"','"+jsfs+"')";
   //保存入库票号信息
   String rkthphSql="insert into tb_thph_rk values('"+rkthid+"','"+sl+"',"+ys+","+ss+","+
      ""+ws+",'"+gysname+"','"+thdate+"','"+czy+"','"+jsr+"','"+jsfs+"','"+whether+"')";

   //保存或修改库存信息
   String kcSelect="select * from tb_kucun where id='"+spid+"'";
   ResultSet rkkc=rst.getResult(kcSelect);
   String thkcSql="";
   //判断库存中是否有该商品，如果有则修改库存信息，否则插入库存记录。
   if(rkkc.next()){
   	float thissl = rkkc.getFloat("kcsl");
   	if(thissl==Float.parseFloat(sl)){
   		thkcSql = "delete from tb_kucun where id='"+spid+"'";
   	}else{
     	thkcSql="update tb_kucun set kcsl=kcsl+"+sl+",dj="+dj+","+
        "kcje=(kcsl+"+sl+")*"+dj+" where id='"+spid+"'";
     }
   }else{
    	//不存在该情况。因为是从库存中选择的
   }
   rst.doExecute(thkcSql);
   rst.doExecute(rukuthSql);
   rst.doExecute(rkthphSql);
   
   
   out.flush();
   out.println("<script language='javascript'>");
   out.println(" layui.use(['layer', 'form'], function(){var layer = layui.layer,form = layui.form;layer.msg('退货成功');});");
   out.println("window.setTimeout(function(){window.location.href='../sprkth.jsp';},600);");
   out.println("</script>");
%>