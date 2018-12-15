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
   String gg=(String)session.getAttribute("gg"); String xsthid=(String)session.getAttribute("xsthph");
   String bz=(String)session.getAttribute("bz");
   String cd=(String)session.getAttribute("cd"); String spid=(String)session.getAttribute("spid");
   String dw=(String)session.getAttribute("dw");
   String sl=(String)request.getParameter("thsl"); String czy=(String)request.getParameter("czy");
   String je=(String)request.getParameter("je"); String jsr=(String)request.getParameter("jsr");
   String dj=(String)request.getParameter("dj"); String xsthdate=(String)request.getParameter("xsthdate");
   String yt=(String)request.getParameter("yt"); String jsfs=(String)request.getParameter("jsfs");
   String st=(String)request.getParameter("st"); String wt=(String)request.getParameter("wt");
   String xskhname=(String)request.getParameter("khqc");
   String whether="";
   if(wt.equals("0")){
     whether="是";
     }else{
       whether="否";
     }
%>
<%
   //保存销售信息
   String xsthSql="insert into tb_sellth values('"+xsthid+"','"+spid+"','"+spname+"',"+
       "'"+jc+"','"+cd+"','"+gg+"','"+bz+"','"+dw+"',"+dj+",'"+sl+"',"+je+","+
       "'"+xskhname+"','"+xsthdate+"','"+czy+"','"+jsr+"','"+jsfs+"')";
   //保存销售票号信息
   String xsthphSql="insert into tb_sellph values('"+xsthid+"','"+sl+"',"+yt+","+st+","+
      ""+wt+",'"+xskhname+"','"+xsthdate+"','"+czy+"','"+jsr+"','"+jsfs+"','"+whether+"')";

   //更新库存信息
   //String rkkcSql="update tb_kucun set kcsl=kcsl-"+sl+",dj="+dj+","+
        //"kcje=(kcsl+"+sl+")*"+dj+" where id='"+spid+"'";
	String rkkcSql="update tb_kucun set kcsl = kcsl+"+sl+","+
        "kcje=(kcsl+"+sl+")* dj  where id='"+spid+"'";
        
    String ldzjSql="UPDATE tb_supermarket SET ldzj = ldzj +"+st;

   rst.doExecute(rkkcSql);
   rst.doExecute(xsthSql);
   rst.doExecute(xsthphSql);
   rst.doExecute(ldzjSql);
   
   out.flush();
   out.println("<script language='javascript'>");
   out.println(" layui.use(['layer', 'form'], function(){var layer = layui.layer,form = layui.form;layer.msg('退货成功');});");
   out.println("window.setTimeout(function(){window.location.href='../spxsth.jsp';},600);");
   out.println("</script>");
%>