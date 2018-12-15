 <%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.sql.*,java.io.*"%>
<%@ page import="com.infinity.dbconn.DBConn"%>
<jsp:useBean id="rst" scope="page" class="com.infinity.dbconn.DBConn"/>
<jsp:useBean id="calendar" scope="page" class="com.infinity.showtime.CalendarBean"/>
<script src="../../layui/layui.js" charset="utf-8"></script>
<%
   request.setCharacterEncoding("UTF-8");//解决表单提交中的中文乱码问题
   //获取表单数据
   String jc=(String)session.getAttribute("jc"); String spname=(String)session.getAttribute("spname");
   String gg=(String)session.getAttribute("gg"); String xsid=(String)session.getAttribute("xsph");
   String bz=(String)session.getAttribute("bz");
   String cd=(String)session.getAttribute("cd"); String spid=(String)session.getAttribute("spid");
   String dw=(String)session.getAttribute("dw");
   String sl=(String)request.getParameter("sl"); String czy=(String)request.getParameter("czy");
   String je=(String)request.getParameter("je"); String jsr=(String)request.getParameter("jsr");
   String dj=(String)request.getParameter("dj"); String xsdate=(String)request.getParameter("xsdate");
   String ys=(String)request.getParameter("ys"); String jsfs=(String)request.getParameter("jsfs");
   String ss=(String)request.getParameter("ss"); String ws=(String)request.getParameter("ws");
   String xskhname=(String)request.getParameter("khqc");
   String whether="";
   if(ws.equals("0")){
     whether="是";
     }else{
       whether="否";
     }
%>
<%
   //保存销售信息
   String xsSql="insert into tb_sell values('"+xsid+"','"+spid+"','"+spname+"',"+
       "'"+jc+"','"+cd+"','"+gg+"','"+bz+"','"+dw+"',"+dj+",'"+sl+"',"+je+","+
       "'"+xskhname+"','"+xsdate+"','"+czy+"','"+jsr+"','"+jsfs+"')";
   //保存销售票号信息
   String xsphSql="insert into tb_sellph values('"+xsid+"','"+sl+"',"+ys+","+ss+","+
      ""+ws+",'"+xskhname+"','"+xsdate+"','"+czy+"','"+jsr+"','"+jsfs+"','"+whether+"')";

   //更新库存信息
   //String rkkcSql="update tb_kucun set kcsl=kcsl-"+sl+",dj="+dj+","+
        //"kcje=(kcsl+"+sl+")*"+dj+" where id='"+spid+"'";
	String rkkcSql="update tb_kucun set kcsl = kcsl-"+sl+","+
        "kcje=(kcsl-"+sl+")* dj  where id='"+spid+"'";
        
   //更新超市资金
   String ldzjSql="UPDATE tb_supermarket SET ldzj = ldzj +"+ss;

   rst.doExecute(rkkcSql);
   rst.doExecute(xsSql);
   rst.doExecute(xsphSql);
   rst.doExecute(ldzjSql);
   
   out.flush();
   out.println("<script language='javascript'>");
   out.println(" layui.use(['layer', 'form'], function(){var layer = layui.layer,form = layui.form;layer.msg('销售成功');});");
   out.println("window.setTimeout(function(){window.location.href='../spxs.jsp';},600);");
   out.println("</script>");
%>